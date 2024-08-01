//
//  CollisionComponent.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 26/07/24.
//

import Foundation
import RealityKit

struct GameCollisionComponent: Component {
    let entityBitMask: BitMasks
}

enum BitMasks: UInt32 {
    case enemyEntityBitMask
    case playerEntityBitMask
    case bulletEntity
    
    var rawValue: Int {
        switch self {
        case .enemyEntityBitMask: return 1 << 0
        case .playerEntityBitMask: return 1 << 1
        case .bulletEntity : return 1 << 2
        }
    }
}
