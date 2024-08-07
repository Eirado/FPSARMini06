//
//  HealthSystem.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 31/07/24.
//

import Foundation
import RealityKit

class HealthSystem: System {
    private static let query = EntityQuery(where: .has(HealthComponent.self))
    private static let queryPlayer = EntityQuery(where: .has(PlayerComponent.self))
    public static var score:Int?
    required init(scene: Scene) { }
    
    func update(context: SceneUpdateContext) {
        
        context.scene.performQuery(Self.query).forEach { entity in
            
            guard let component = entity.components[HealthComponent.self] as? HealthComponent else { return }
            
            
            
            if component.totalHealth == 0 {
                die(entity: entity)
               
            }
        }
        
        func die(entity: Entity) {
            let playerEntity = context.scene.performQuery(Self.queryPlayer).map({$0}).first
            if entity != playerEntity{
                guard let score = playerEntity?.components[PlayerComponent.self] as? PlayerComponent else { return }
                score.score! += 1
                playerEntity?.components[AttackComponent.self] = score
                
            }
            entity.removeFromParent()
            
        }
        
        
    }
}
