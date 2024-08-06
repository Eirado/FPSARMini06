//
//  LifeComponent.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 31/07/24.
//

import Foundation
import RealityKit

struct HealthComponent: Component {
    var totalHealth: Int
    
    init(totalHealth: HealthEnum) {
        self.totalHealth = totalHealth.rawValue
    }
}

enum HealthEnum: Int {
    case enemyEntityHealth
    case playerEntityHealth
    
    var rawValue: Int {
        switch self {
        case .enemyEntityHealth: return 200
        case .playerEntityHealth: return 500
        }
    }
}
