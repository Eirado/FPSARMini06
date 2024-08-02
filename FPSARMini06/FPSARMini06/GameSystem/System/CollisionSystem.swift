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

                guard let entity1 = event.entityA as? ModelEntity,
                      let entity2 = event.entityB as? ModelEntity else { return }
                
                if entity1.name == "BulletEntity" || entity2.name == "BulletEntity" {
                    let bulletEntity = entity1.name == "BulletEntity" ? entity1 : entity2
                    let otherEntity = bulletEntity == entity1 ? entity2 : entity1

                    print("Colisão envolvendo BulletEntity")

                    if var entidadeComVida = otherEntity.components[HealthComponent.self] as? HealthComponent {
                        entidadeComVida.totalHealth -= 10
                        do {
                            try self.verificarVida(entidade: entidadeComVida)
                        } catch {
                            fatalError("A vida está abaixo de zero")
                        }
                    }
                }

                if (entity1.name == "PlayerEntity" && entity2.name == "EnemyEntity") ||
                   (entity1.name == "EnemyEntity" && entity2.name == "PlayerEntity") {

                    print("Colisão entre PlayerEntity e EnemyEntity")

                    let playerEntity = entity1.name == "PlayerEntity" ? entity1 : entity2
                    let enemyEntity = playerEntity == entity1 ? entity2 : entity1

                    if var playerHealth = playerEntity.components[HealthComponent.self] as? HealthComponent {
                        playerHealth.totalHealth -= 5
                        do {
                            try self.verificarVida(entidade: playerHealth)
                        } catch {
                            fatalError("A vida do jogador está abaixo de zero")
                        }
                    }

                    if var enemyHealth = enemyEntity.components[HealthComponent.self] as? HealthComponent {
                        enemyHealth.totalHealth -= 5
                        do {
                            try self.verificarVida(entidade: enemyHealth)
                        } catch {
                            fatalError("A vida do inimigo está abaixo de zero")
                        }
                    }
                }
            })
        }
    }
    
    func verificarVida(entidade: HealthComponent) throws {
        if entidade.totalHealth < 0 {
            throw fatalError()
        }
    }
}

