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
                
                if (involvedNodes.contains(where: {$0.name == "EnemyEntity"}) && involvedNodes.contains(where: {$0.name == "PlayerBullet"})) {

                    guard let enemyEntity = involvedNodes.first(where: { $0.name == "EnemyEntity" }) else { return }
                    guard let bulletEntity = involvedNodes.first(where: { $0.name == "PlayerBullet" }) else { return }
                    if !bulletEntity.components.has(AttackComponent.self){
                        bulletEntity.components.set(AttackComponent(type: .player, hit: false))
                    }
                    guard var attackComponent = bulletEntity.components[AttackComponent.self] as? AttackComponent else{return}
                        if var enemyHealth = enemyEntity.components[HealthComponent.self] as? HealthComponent {
                            do {
                                if !attackComponent.hit{
                                    enemyHealth.totalHealth -= damage
                                    print("vida do inimigo \(enemyHealth.totalHealth)")
                                    bulletEntity.components.set(AttackComponent(hit: true))
                                    attackComponent.hit = true
                                    bulletEntity.components[AttackComponent.self] = attackComponent
                                }
                                enemyEntity.components[HealthComponent.self] = enemyHealth
                            }
                        }
                    
                    self.hitLanded = true
                }
                
                else if (involvedNodes.contains(where: {$0.name == "PlayerEntity"}) && involvedNodes.contains(where: {$0.name == "EnemyBullet"})) {

                    guard let playerEntity = involvedNodes.first(where: { $0.name == "PlayerEntity" }) else { return }
                    guard let bulletEntity = involvedNodes.first(where: { $0.name == "EnemyBullet" }) else { return }
                    
                    if !bulletEntity.components.has(AttackComponent.self){
                        bulletEntity.components.set(AttackComponent(hit: false))
                    }

                    guard var attackComponent = bulletEntity.components[AttackComponent.self] as? AttackComponent else {return}
                    if var playerHealth = playerEntity.components[HealthComponent.self] as? HealthComponent {
                        do {
                            if !attackComponent.hit{
                                playerHealth.totalHealth -= damage
                                print("vida do player \(playerHealth.totalHealth)")
                                bulletEntity.components.set(AttackComponent(hit: true))
                                attackComponent.hit = true
                                bulletEntity.components[AttackComponent.self] = attackComponent
                            }
                            playerEntity.components[HealthComponent.self] = playerHealth
                        }
                    }
                    self.hitLanded = true
                }
                else {return}
                
            })
            
            collisionSubscriptions.append(context.scene.subscribe(to: CollisionEvents.Ended.self) { [weak self] event in
                self!.hitLanded = false
            })
        }
    }
}
