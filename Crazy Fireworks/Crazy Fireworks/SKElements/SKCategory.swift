//
//  SKCategory.swift
//  DodgeGame
//
//  Created by Matheus Kulick on 16/09/20.
//  Copyright © 2020 Matheus Kulick. All rights reserved.
//

class Category {
    static var character:UInt32 = 0x1 << 0
    static var bullet:UInt32 = 0x1 << 1
    static var field:UInt32 = 0x1 << 2
    static var all: UInt32 = UInt32.max
    static func allBut(_ categories:UInt32...) -> UInt32 {
        return categories.reduce(Self.all, {a, b in a - b})
    }
}
