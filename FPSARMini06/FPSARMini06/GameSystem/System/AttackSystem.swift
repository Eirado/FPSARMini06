//
//  AttackSystem.swift
//  FPSARMini06
//
//  Created by Luiz Felipe on 01/08/24.
//

import RealityKit
import Foundation

class AttackSystem: System{
    
    required init(scene: Scene) {}
    
    private var hasAttackComponent = EntityQuery(where: .has(AttackComponent.self))
    
    func update(context: SceneUpdateContext) {
        context.scene.performQuery(hasAttackComponent).forEach{ attackEntity in
            
            guard var entityComponent = attackEntity.components[AttackComponent.self] as? AttackComponent else {return}
                
                let endPosition = entityComponent.startPosition + entityComponent.direction * entityComponent.attackSpeed
                
                attackEntity.move(to: Transform(translation: endPosition), relativeTo: nil, duration: entityComponent.duration, timingFunction: .linear)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + entityComponent.duration) {
                    
                    attackEntity.removeFromParent()
                    
                }
            
            
        }
    }
}
