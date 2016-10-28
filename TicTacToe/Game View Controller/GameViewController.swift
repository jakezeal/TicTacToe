//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Jake on 10/21/16.
//  Copyright © 2016 Jake. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewDelegate {
    
    // MARK: - Properties 
    var board = Board()
    weak var boardView: BoardView! = nil
    
    // MARK: - IBOutlets
    @IBOutlet weak var currentPlayerTurnLabel: UILabel!
    
    // MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareBoardView()
    }
    
    // MARK: - Preparations
    func prepareBoardView() {
        let boardView = BoardView(boardWidth: view.bounds.width - 25, boardHeight: view.bounds.width - 25)
        boardView.center = view.center
        view.addSubview(boardView)
        self.boardView = boardView
        self.boardView.delegate = self
    }
    
    // MARK: - Board View Delegate
    func handleTap(fieldView: FieldView) {
        print("Field View - xPosition: \(fieldView.xPosition)")
        print("Field View - yPosition: \(fieldView.yPosition)")
        board.move(x: fieldView.xPosition, y: fieldView.yPosition)
        currentPlayerTurnLabel.text = board.playerWithCurrentTurn().rawValue
        boardView.addLabel(in: fieldView)
    }
}

