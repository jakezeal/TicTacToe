//
//  Board.swift
//  TicTacToe
//
//  Created by Jake on 10/21/16.
//  Copyright © 2016 Jake. All rights reserved.
//

// TODO: Future take backs if it is player's turn and other player accepts

struct Board {
    // MARK: - Properties
    fileprivate var currentTurn: Player = .cross
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
    
    mutating func move(x: Int, y: Int) {
        guard x < 3 && y < 3 else { return }
        guard fields[x][y] == .free else { return }
        
        fields[x][y] = .hasPlayer(currentTurn)
        
    }
    
    func winner() -> Player? {
        // Check rows, columns and diagonals
        if let winner = checkRowsForWinner() {
            return winner
        } else if let winner = checkColumnsForWinner() {
            return winner
        } else if let winner = checkDiagonalsForWinner() {
            return winner
        } else if checkForDraw() {
            // TODO: Indicate on UI that there was a draw (not directly from this class)
            return nil
        } else {
            return nil
        }
    }
    
    
}

private extension Board {
    // Check rows for winner
    func checkRowsForWinner() -> Player? {
        
        for row in 0..<3 {
            if let winner = checkWinner(in: fields[row]) {
                return winner
            }
        }
        
        return nil
    }
    
    // Check columns for winner
    func checkColumnsForWinner() -> Player? {
        
        let firstRow = fields[0]
        
        if let winner = checkWinner(in: firstRow) {
            return winner
        }
        
        return nil
    }
    
    // Check diagonals for winner
    func checkDiagonalsForWinner() -> Player? {
        
        guard fields[1][1] == .hasPlayer(.circle) || fields[1][1] == .hasPlayer(.cross) else { return nil }
        
        let firstDiagonal = [fields[0][0],  fields[1][1],  fields[2][2]]
        let secondDiagonal = [fields[0][2],  fields[1][1],  fields[2][0]]
        
        if let winner = checkWinner(in: firstDiagonal) {
            return winner
        } else if let winner = checkWinner(in: secondDiagonal) {
            return winner
        } else {
            return nil
        }
    }
    
    func checkWinner(in fields: [Field]) -> Player? {
        if let circleWinner = checkWinnerForCircle(in: fields) {
            return circleWinner
        } else if let crossWinner = checkWinnerForCross(in: fields) {
            return crossWinner
        } else {
            return nil
        }
    }
    
    func checkWinnerForCircle(in fields: [Field]) -> Player? {
        if fields[0] == .hasPlayer(.circle) && fields[1] == .hasPlayer(.circle) && fields[2] == .hasPlayer(.circle) {
            return Player(rawValue: "O")
        } else {
            return nil
        }
    }
    
    func checkWinnerForCross(in fields: [Field]) -> Player? {
        if fields[0] == .hasPlayer(.cross) && fields[1] == .hasPlayer(.cross) && fields[2] == .hasPlayer(.cross) {
            return Player(rawValue: "X")
        } else {
            return nil
        }
    }
    
    func checkForDraw() -> Bool {
        var draw = false
        
        for x in 0..<3 {
            for y in 0..<3 {
                if fields[x][y] == .free {
                    draw = false
                    break
                }
                draw = true
            }
        }
        print("Check for Draw: \(draw)")
        return draw
    }
}
