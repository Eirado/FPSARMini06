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

            collisionSubscriptions.append(context.scene.subscribe(to: CollisionEvents.Began.self) { event in
                print("Colidiu")
            })
        }
    }
}
