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
        self.modelShape = .generateSphere(radius: 0.1)
        
        self.model.components[ModelComponent.self] = ModelComponent(mesh: .generateBox(size: 0.2), materials: [SimpleMaterial(color: .purple, isMetallic: true)])
        
        //Colisão
        self.model.components[GameCollisionComponent.self] = GameCollisionComponent()
        self.model.generateCollisionShapes(recursive: true)
        
        self.model.collision = CollisionComponent(shapes: [modelShape])
        
        super.init()
        
        self.model.name = "BulletEntity"
        
        self.addChild(self.model)
        self.addChild(self.animationRoot)
        
    }
}
