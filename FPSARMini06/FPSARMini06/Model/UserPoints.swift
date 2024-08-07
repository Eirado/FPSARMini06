//
//  Model.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

import Foundation
import SwiftData

@Model
final class UserData: Identifiable {
    var id:String
    var score:Int
    var longestWave:Int
    var coins:Int
    var box_itens_ID:[Int]
    
    init( score: Int, longestWave: Int, coins: Int, box_itens_ID: [Int]) {
        self.id = UUID().uuidString
        self.score = score
        self.longestWave = longestWave
        self.coins = coins
        self.box_itens_ID = box_itens_ID
    }
}
