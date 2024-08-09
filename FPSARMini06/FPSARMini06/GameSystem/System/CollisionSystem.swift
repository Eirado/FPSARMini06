//
//  CollisionSystem.swift
//  FPSARMini06
//
//  Created by Gabriel Eirado on 24/07/24.
//

import Foundation
import RealityKit
import Combine

class CollisionSystem: RealityKit.System {
    private let hasCollisionComponentQuery = EntityQuery(where: .has(GameCollisionComponent.self))
    var collisionSubscriptions = [Cancellable]()
    var hitLanded: Bool = false
    let damage: Int = 70
    
    required init(scene: Scene) { }
    
    func update(context: SceneUpdateContext) {
        context.scene.performQuery(hasCollisionComponentQuery).forEach { collisorEntity in
            collisionSubscriptions.append(context.scene.subscribe(to: CollisionEvents.Began.self) { [weak self] event in
                guard let self = self else { return }
                let entity1 = event.entityA
                let entity2 = event.entityB
                let involvedNodes = [entity1, entity2]
                
                if (entity1.name == "EnemyEntity" && entity2.name == "BulletEntity") ||
                    (entity1.name == "BulletEntity" && entity2.name == "EnemyEntity") {
                    guard let enemyEntity = involvedNodes.first(where: { $0.name == "EnemyEntity" }) else { return }
                    guard let bulletEntity = involvedNodes.first(where: { $0.name == "BulletEntity" }) else { return }
                    
                    if var enemyHealth = enemyEntity.components[HealthComponent.self] as? HealthComponent {
                        do {
                            if !hitLanded {
                                enemyHealth.totalHealth -= damage
                                bulletEntity.components.set(AttackComponent(hit: true))
                                self.hitLanded = true
                            }
                            enemyEntity.components[HealthComponent.self] = enemyHealth
                        }
                    }
                }
            })
            
            collisionSubscriptions.append(context.scene.subscribe(to: CollisionEvents.Ended.self) { [weak self] event in
                self!.hitLanded = false
            })
        }
    }
}
