//
//  AttackSystem.swift
//  FPSARMini06
//
//  Created by Luiz Felipe on 01/08/24.
//

import RealityKit
import Foundation

class AttackSystem: System{
    
    required init(scene: Scene) {
        
    }
    
    
    func update(context: SceneUpdateContext) {
        var hasAttackComponent = EntityQuery(where: .has(AttackComponent.self))

        context.scene.performQuery(hasAttackComponent).forEach{ attackEntity in
            
            guard let entityComponent = attackEntity.components[AttackComponent.self] as? AttackComponent else {return}
            print("sistema de ataque, startposition:\(entityComponent.startPosition)")
                let endPosition = entityComponent.startPosition + entityComponent.direction * entityComponent.attackSpeed
                
                attackEntity.move(to: Transform(translation: endPosition), relativeTo: nil, duration: entityComponent.duration, timingFunction: .linear)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + entityComponent.duration) {
                    
                    attackEntity.removeFromParent()
                    
                }
            
            
        }
    }
}
