//
//  BulletEntyty.swift
//  FPSARMini06
//
//  Created by Luiz Felipe on 30/07/24.
//

import Foundation
import RealityKit

class BulletEntity: Entity, HasCollision, HasModel{
    
    var model: ModelEntity
    var animationRoot: Entity
    var modelShape: ShapeResource // Ferramenta para definir o shape da colisao
    
     required init() {
         
        self.model = ModelEntity()
        self.animationRoot = Entity()
        self.modelShape = .generateSphere(radius: 0.1)

        
        //self.model.generateCollisionShapes(recursive: true)
//        print("entrou no primeiro, startPosition\(startPosition)")
        super.init()
        //self.components[gameCollisionComponent.self] = gameCollisionComponent(entityBitMask: .bulletEntity)
        //self.model.collision = CollisionComponent(shapes: [modelShape], mode: .trigger, filter: .sensor)
        self.model.components[ModelComponent.self] = ModelComponent(mesh: .generateSphere(radius: 0.02), materials: [SimpleMaterial(color: .purple, isMetallic: true)])
        
        self.components[AttackComponent.self] = AttackComponent()
        
        self.addChild(self.model)
        self.addChild(self.animationRoot)
        
        
    }

    
    
}
