//
//  HealthSystem.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 31/07/24.
//

import Foundation
import RealityKit

//Esse system será responsável por matar a entidade q zerar a vida

class HealthSystem: System {
    private static let query = EntityQuery(where: .has(HealthComponent.self))
    
    required init(scene: Scene) { }
    
    func update(context: SceneUpdateContext) {
        
    }
    
    func die() {// essa função deve retirar os elementos da tela quando o lifepoint chegar a zero
        
    }
}
