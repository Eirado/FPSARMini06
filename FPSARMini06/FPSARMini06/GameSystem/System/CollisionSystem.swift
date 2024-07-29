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
    let hasCollisionComponentQuery = EntityQuery(where: .has(gameCollisionComponent.self))
    var collisionSubscriptions = [Cancellable]()
    
    required init(scene: Scene) { }
    
    func update(context: SceneUpdateContext) {
        context.scene.performQuery(hasCollisionComponentQuery).forEach { collisorEntity in
            guard let entityComponent = collisorEntity.components[gameCollisionComponent.self] as? gameCollisionComponent else { return }
            
            
            //            let entityGroup = {
            //                switch entityComponent.entityBitMask {
            //                case .enemyEntityBitMask:
            //                    return CollisionGroup(rawValue: entityComponent.entityBitMask.rawValue)
            //                case .playerEntityBitMask:
            //                    return CollisionGroup(rawValue: entityComponent.entityBitMask.rawValue)
            //                }
            //            }
            
            // creating masks
            //            let entityMask = CollisionGroup.all.subtracting(entityGroup())
            
            // Have to create collision Groups
            
            //Have to define generateCollisionShapes and CollisionComponent
            collisionSubscriptions.append(context.scene.subscribe(to: CollisionEvents.Began.self) { event in
//                guard let modelEntity = collisorEntity as? ModelEntity else { return }
                print("Colidiu")
                
//                modelEntity.model?.materials = [SimpleMaterial(color: .purple, isMetallic: true)]
            })
        }
    }
}
