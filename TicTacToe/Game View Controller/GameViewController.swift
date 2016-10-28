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
    weak var boardView: BoardView!
    
    // MARK: - IBOutlets
    @IBOutlet weak var currentPlayerTurnLabel: UILabel!
    
    // MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareBoardView()
        prepareCurrentPlayerTurnLabel()
    }
    
    // MARK: - Preparations
    func prepareBoardView() {
        let boardView = BoardView(boardWidth: view.bounds.width - 25, boardHeight: view.bounds.width - 25)
        boardView.center = view.center
        view.addSubview(boardView)
        self.boardView = boardView
        self.boardView.delegate = self
    }
    
    func prepareCurrentPlayerTurnLabel() {
        currentPlayerTurnLabel.text = board.currentTurn.rawValue
    }
    
    // MARK: - Board View Delegate
    func handleTap(fieldView: FieldView) {
        // TODO: Animation to indicate to player must pick new field        
        guard board.fields[fieldView.xPosition][fieldView.yPosition] == .free else { return }
        
        print("Field View - xPosition: \(fieldView.xPosition)")
        print("Field View - yPosition: \(fieldView.yPosition)")
        
        boardView.addLabel(playerName: playerFromModelToView(player: board.currentTurn), in: fieldView)
        board.move(x: fieldView.xPosition, y: fieldView.yPosition)
        currentPlayerTurnLabel.text = board.currentTurn.rawValue
    }
    
    func playerFromModelToView(player: Player) -> BoardView.Player {
        switch player {
        case .cross:
            return .cross
        case .circle:
            return .circle
        }
    }
}

