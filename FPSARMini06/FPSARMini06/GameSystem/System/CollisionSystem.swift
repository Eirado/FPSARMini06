//
//  CollisionSystem.swift
//  FPSARMini06
//
//  Created by Gabriel Eirado on 24/07/24.
//

import Foundation
import RealityKit
import Combine

// falta lidar com filtro de colisoes

class CollisionSystem: RealityKit.System {
    let hasCollisionComponentQuery = EntityQuery(where: .has(gameCollisionComponent.self))
    var collisionSubscriptions = [Cancellable]()
    
    required init(scene: Scene) { }
    
    func update(context: SceneUpdateContext) {
        context.scene.performQuery(hasCollisionComponentQuery).forEach { collisorEntity in
            guard let entityComponent = collisorEntity.components[gameCollisionComponent.self] as? gameCollisionComponent else { return }

            collisionSubscriptions.append(context.scene.subscribe(to: CollisionEvents.Began.self) { event in // aqui definimos como será a resposta para a colisao
                
                guard let entity1 = event.entityA as? ModelEntity,
                      let entity2 = event.entityB as? ModelEntity else { return }
                        
                entity1.model?.materials = [SimpleMaterial(color: .green, isMetallic: true)]
                entity2.model?.materials = [SimpleMaterial(color: .green, isMetallic: true)]
            })
            
            collisionSubscriptions.append(context.scene.subscribe(to: CollisionEvents.Ended.self) { event in // aqui definimos como será a resposta para a colisao
                
                guard let entity1 = event.entityA as? ModelEntity,
                      let entity2 = event.entityB as? ModelEntity else { return }
                        
                entity1.model?.materials = [SimpleMaterial(color: .red, isMetallic: true)]
                entity2.model?.materials = [SimpleMaterial(color: .red, isMetallic: true)]
            })
        }
    }
}
