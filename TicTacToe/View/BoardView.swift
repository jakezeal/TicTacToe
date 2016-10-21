//
//  BoardView.swift
//  TicTacToe
//
//  Created by Jake on 10/21/16.
//  Copyright © 2016 Jake. All rights reserved.
//

import UIKit

// MARK: - Private Properties
fileprivate let numberOfRows: CGFloat = 3
fileprivate let numberOfColumns: CGFloat = 3

class BoardView: UIView {
    
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
