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
            guard let entityComponent = collisorEntity.components[GameCollisionComponent.self] as? GameCollisionComponent else { return }

            collisionSubscriptions.append(context.scene.subscribe(to: CollisionEvents.Began.self) { event in
                
                guard let entity1 = event.entityA as? ModelEntity,
                      let entity2 = event.entityB as? ModelEntity else { return }
                
                if var entidadeComVida = entity1.components[HealthComponent.self] as? HealthComponent {
                    entidadeComVida.totalHealth -= 10
                    
                    do {
                        try self.verificarVida(entidade: entidadeComVida)
                    } catch {
                        fatalError("A vida está abaixo de zero")
                    }
                }
                        
                entity1.model?.materials = [SimpleMaterial(color: .green, isMetallic: true)]
                entity2.model?.materials = [SimpleMaterial(color: .green, isMetallic: true)]
            })
            
            collisionSubscriptions.append(context.scene.subscribe(to: CollisionEvents.Ended.self) { event in
                
                guard let entity1 = event.entityA as? ModelEntity,
                      let entity2 = event.entityB as? ModelEntity else { return }
                        
                entity1.model?.materials = [SimpleMaterial(color: .red, isMetallic: true)]
                entity2.model?.materials = [SimpleMaterial(color: .red, isMetallic: true)]
            })
        }
    }
    
    func verificarVida(entidade: HealthComponent) throws {
        if entidade.totalHealth < 0 {
            throw fatalError()
        }
    }
}

