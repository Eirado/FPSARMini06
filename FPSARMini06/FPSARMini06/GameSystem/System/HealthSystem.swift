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
        
        context.scene.performQuery(Self.query).forEach { entity in
            
            guard var component = entity.components[HealthComponent.self] as? HealthComponent else { return }
            
            if component.totalHealth == 0{
                die(entity: entity)
            }
        }
        
        func die(entity: Entity) {// essa função deve retirar os elementos da tela quando o lifepoint chegar a zero
            entity.removeFromParent()
            
        }
    }
}
