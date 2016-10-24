//
//  Board.swift
//  TicTacToe
//
//  Created by Jake on 10/21/16.
//  Copyright © 2016 Jake. All rights reserved.
//

struct Board {
    // MARK: - Properties
    private var currentTurn: Player = .cross
    var fields: [[Field]] = [[.free, .free, .free], [.free, .free, .free], [.free, .free, .free]]
    
    // MARK: - Public Functions
    // Know and change player's turn
    // Make move
    // Determine and return winner
    
    mutating func playerWithCurrentTurn() -> Player {
        switch currentTurn {
        case .cross:
            currentTurn = .circle
            return .circle
        case .circle:
            currentTurn = .cross
            return .cross
        }
    }
    
    mutating func move(player: Player, x: Int, y: Int) {
        guard x < 3 && y < 3 else { return }
        // TODO: Animation to indicate to player
        guard fields[x][y] == .free else { return }
        
        fields[x][y] = .hasPlayer(player)
        
    }
    
    func winner() -> Player? {
        // Check rows, columns and diagonals
        return nil
    }
    
    
}
