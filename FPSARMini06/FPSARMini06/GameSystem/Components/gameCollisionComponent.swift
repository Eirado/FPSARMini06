//
//  CollisionComponent.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 26/07/24.
//

import Foundation
import RealityKit

struct gameCollisionComponent: Component {
    let entityBitMask: BitMasks
}

/// Não estou conseguindo fazer com q o componente já compute o valor da bitmask por conta própria

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
