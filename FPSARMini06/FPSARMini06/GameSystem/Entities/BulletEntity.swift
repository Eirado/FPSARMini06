//
//  BulletEntyty.swift
//  FPSARMini06
//
//  Created by Luiz Felipe on 30/07/24.
//

import Foundation
import RealityKit

class BulletEntity: Entity, HasCollision, HasModel {
    
    var model: ModelEntity
    var animationRoot: Entity
    var modelShape: ShapeResource
    
    required init() {
        
        self.model = ModelEntity()
        self.animationRoot = Entity()
        self.modelShape = .generateSphere(radius: 0.01)

        super.init()
        self.model.components[ModelComponent.self] = ModelComponent(mesh: .generateSphere(radius: 0.006), materials: [SimpleMaterial(color: .purple, isMetallic: true)])
        
        self.model.name = "BulletEntity"
        self.model.generateCollisionShapes(recursive: true)

        self.components[AttackComponent.self] = AttackComponent()
        self.model.components[GameCollisionComponent.self] = GameCollisionComponent()
        self.model.collision = CollisionComponent(shapes: [modelShape])
        
        self.addChild(self.model)
        self.addChild(self.animationRoot)
    }
}
