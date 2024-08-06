//
//  CollisionSystem.swift
//  FPSARMini06
//
//  Created by Gabriel Eirado on 24/07/24.
//

import Foundation
import RealityKit
import Combine

//TODO: Lidar com a colisão de dois elementos para fazer o dano na healthComponent

class CollisionSystem: RealityKit.System {
    private let hasCollisionComponentQuery = EntityQuery(where: .has(GameCollisionComponent.self))
    var collisionSubscriptions = [Cancellable]()
    
    required init(scene: Scene) { }
    
    func update(context: SceneUpdateContext) {
        context.scene.performQuery(hasCollisionComponentQuery).forEach { collisorEntity in
            
            collisionSubscriptions.append(context.scene.subscribe(to: CollisionEvents.Began.self) { event in
                var tomouDano: Bool = false
                
                let entity1 = event.entityA
                let entity2 = event.entityB
                
                let involvedNodes = [entity1, entity2]
                
                if (entity1.name == "BulletEntity" && entity2.name == "EnemyEntity") ||
                    (entity1.name == "EnemyEntity" && entity2.name == "BulletEntity") {
                    
                    let enemyEntity = involvedNodes.first { $0.name == "EnemyEntity" }
                    
                    if var enemyHealth = enemyEntity?.components[HealthComponent.self] as? HealthComponent {
                        do {
                            if !tomouDano {
                                print("dano 1 - \(enemyHealth.totalHealth)")
                                enemyHealth.totalHealth -= 1
                                tomouDano = true
                                print("dano 2 - \(enemyHealth.totalHealth)")
                                if enemyHealth.totalHealth < 0 {
                                    throw HealthError.healthBelowZero
                                }
                            }
                            enemyEntity?.components[HealthComponent.self] = enemyHealth
                        } catch HealthError.healthBelowZero {
                            print("morreu")
                        } catch {
                            print("Ocorreu um erro inesperado: \(error)")
                        }
                    }
                }
            })
        }
    }
    
}

enum HealthError: Error {
    case healthBelowZero
}
