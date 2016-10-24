//
//  Field.swift
//  TicTacToe
//
//  Created by Jake on 10/21/16.
//  Copyright © 2016 Jake. All rights reserved.
//

enum Field {
    case free
    case hasPlayer(Player)
}

// we need to implement equatable because we are using enums with associated values
extension Field: Equatable {
    
}

//TODO
func ==(lhs: Field, rhs: Field) -> Bool {
    switch (lhs, rhs) {
    case (.free, .free):
        return true
    default:
        return false
    }

}
