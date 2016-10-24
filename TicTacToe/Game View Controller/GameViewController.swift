//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Jake on 10/21/16.
//  Copyright © 2016 Jake. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewDelegate {

    // MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        let boardView = BoardView(boardWidth: view.bounds.width - 25, boardHeight: view.bounds.width - 25)
        boardView.center = view.center
        view.addSubview(boardView)
    
    }

    // MARK: - Board View Delegate
    func handleTap(fieldView: FieldView) {
        print(fieldView.xPosition)
        print(fieldView.yPosition)
    }
}

