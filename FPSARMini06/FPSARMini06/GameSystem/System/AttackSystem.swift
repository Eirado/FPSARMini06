//
//  AttackSystem.swift
//  FPSARMini06
//
//  Created by Luiz Felipe on 01/08/24.
//

import RealityKit
import Foundation

class AttackSystem: RealityKit.System {
    
    private static let query = EntityQuery(where: .has(AttackComponent.self))
    
    
    required init(scene: Scene) {
        
    }
    
    
    func update(context: SceneUpdateContext) {
        
        
        context.scene.performQuery(AttackSystem.query).forEach{ entity in
            
            guard let component = entity.components[AttackComponent.self] as? AttackComponent else {return}
            
            let endPosition = component.startPosition + component.direction * component.attackSpeed
            
            entity.move(to: Transform(translation: endPosition), relativeTo: nil, duration: component.duration, timingFunction: .linear)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + component.duration) {
                
                entity.removeFromParent()
                
            }
        }
    }
}
