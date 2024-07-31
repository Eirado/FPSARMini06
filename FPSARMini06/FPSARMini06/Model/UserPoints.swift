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
    var box_itens_ID:[Int]
    
    init( score: Int, box_itens_ID: [Int]) {
        self.id = UUID().uuidString
        self.score = score
        self.box_itens_ID = box_itens_ID
    }
}
