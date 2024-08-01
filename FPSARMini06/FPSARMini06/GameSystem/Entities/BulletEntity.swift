//
//  BulletEntyty.swift
//  FPSARMini06
//
//  Created by Luiz Felipe on 30/07/24.
//

import Foundation
import RealityKit

class BulletEntity: Entity, HasCollision, HasModel {
    
//    var quemAtirou: BitMasks // variável q mantém uma bitmask
    
    var model: ModelEntity
    var animationRoot: Entity
    var modelShape: ShapeResource
    
    required init(/*quemAtirou: BitMasks*/) {
        
//        self.quemAtirou = quemAtirou
        self.model = ModelEntity()
        self.animationRoot = Entity()
        self.modelShape = .generateSphere(radius: 0.1)
        
        self.model.components[ModelComponent.self] = ModelComponent(mesh: .generateBox(size: 0.2), materials: [SimpleMaterial(color: .purple, isMetallic: true)])
        
        //Colisão
        self.model.generateCollisionShapes(recursive: true)
        
        // tenho q lidar com o filtro aqui
        
        self.model.collision = CollisionComponent(shapes: [modelShape], mode: .trigger, filter: .sensor)
        
        super.init()
        
        self.components[GameCollisionComponent.self] = GameCollisionComponent(/*entityBitMask:*/ )
        self.addChild(self.model)
        self.addChild(self.animationRoot)
        
    }
    
//    required init() {
//        fatalError("sem init")
//        
////        self.quemAtirou = .enemyEntityBitMask
////        self.model = ModelEntity()
////        self.animationRoot = Entity()
////        self.modelShape = .generateSphere(radius: 0.1)
////        
////        self.model.components[ModelComponent.self] = ModelComponent(mesh: .generateBox(size: 0.2), materials: [SimpleMaterial(color: .green, isMetallic: true)])
////        
////        //Colisão
////        self.model.generateCollisionShapes(recursive: true)
////        
////        // tenho q lidar com o filtro aqui
////        
////        self.model.collision = CollisionComponent(shapes: [modelShape], mode: .trigger, filter: .sensor)
////        
////        super.init()
////        
////        self.components[GameCollisionComponent.self] = GameCollisionComponent(entityBitMask: quemAtirou)
////        self.addChild(self.model)
//    }
}
