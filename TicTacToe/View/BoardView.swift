//
//  BoardView.swift
//  TicTacToe
//
//  Created by Jake on 10/21/16.
//  Copyright © 2016 Jake. All rights reserved.
//

import UIKit

// MARK: - Protocols
protocol BoardViewDelegate {
    func handleTap(fieldView: FieldView)
}

// MARK: - Private Properties
fileprivate let numberOfRows: CGFloat = 3
fileprivate let numberOfColumns: CGFloat = 3

final class BoardView: UIView {
    
    // MARK: - Properties
    var delegate: BoardViewDelegate?
    
    // MARK: - Initializers
    convenience init(boardWidth: CGFloat, boardHeight: CGFloat) {
        let fieldWidth = boardWidth / numberOfRows
        let fieldHeight = boardHeight / numberOfColumns
        self.init(fieldWidth: fieldWidth, fieldHeight: fieldHeight)
    }
    
    init(fieldWidth: CGFloat, fieldHeight: CGFloat) {
        let boardFrame = CGRect(x: 0, y: 0, width: fieldWidth * numberOfRows, height: fieldHeight * numberOfColumns)
        super.init(frame: boardFrame)
        
        // Add fields
        let numberOfFields = Int(numberOfRows * numberOfColumns)
        
        for i in 0..<numberOfFields {
            
            let xPosition = i % Int(numberOfColumns)
            let x = CGFloat(xPosition) * fieldWidth
            
            let yPosition = i / Int(numberOfRows)
            let y = CGFloat(yPosition) * fieldHeight
            
            let currentFieldFrame = CGRect(x: x, y: y, width: fieldWidth, height: fieldHeight)
            
            let field = FieldView(frame: currentFieldFrame, xPosition: xPosition, yPosition: yPosition)
            field.layer.borderWidth = 1.0
            
            // Add gesture Recognizer
            let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            field.addGestureRecognizer(tap)
            
            addSubview(field)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public API
    func addLabel(in fieldView: FieldView) {
        fieldView.label = UILabel(frame: fieldView.frame)
        fieldView.label!.text = "X"
        
        fieldView.label!.font = UIFont.systemFont(ofSize: 32.0)
        fieldView.label!.textColor = .black
        fieldView.label!.textAlignment = .center
        fieldView.addSubview(fieldView.label!)
    }
    
    // MARK: - Private Helper Methods
    @objc private func handleTap(_ tap: UITapGestureRecognizer) {
        if let tappedField = tap.view as? FieldView {
            delegate?.handleTap(fieldView: tappedField)
            print(tappedField)
        }
    }

}
