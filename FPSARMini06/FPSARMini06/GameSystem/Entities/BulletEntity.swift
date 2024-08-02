//
//  BulletEntyty.swift
//  FPSARMini06
//
//  Created by Luiz Felipe on 30/07/24.
//

import Foundation
import RealityKit

class BulletEntity: Entity, HasCollision, HasModel {
    
    var quemAtirou: BitMasks // variável q mantém uma bitmask
    
    var model: ModelEntity
    var animationRoot: Entity
    var modelShape: ShapeResource
    
    required init(quemAtirou: BitMasks) {
        
      
        
        self.quemAtirou = quemAtirou
        self.model = ModelEntity()
        self.animationRoot = Entity()
        self.modelShape = .generateSphere(radius: 0.1)
        
        self.model.components[ModelComponent.self] = ModelComponent(mesh: .generateBox(size: 0.2), materials: [SimpleMaterial(color: .purple, isMetallic: true)])
        
        //Colisão
        self.model.components[GameCollisionComponent.self] = GameCollisionComponent(entityBitMask: quemAtirou)
        self.model.generateCollisionShapes(recursive: true)
        
        let extractedEntityBitMask = GameCollisionComponent(entityBitMask: quemAtirou)
        let bitMask = extractedEntityBitMask.entityBitMask
        
//        let entityMask = CollisionGroup(rawValue: bitMask!.rawValue)
        
//        let entityGroup = CollisionGroup(bitMask)
//        let entityMask = CollisionGroup.all.subtracting(entityMask)
//        
        let entityGroup = CollisionGroup(rawValue: bitMask!.getOther().rawValue)
        
        let entityMask = CollisionGroup.all.subtracting(entityGroup)
        
        // tenho q lidar com o filtro aqui
//        self.model.collision = CollisionComponent(shapes: [modelShape], mode: .trigger, filter: .init(group: entityMask, mask:  entityGroup))
        
        super.init()
        
        self.model.name = "BulletEntity"
        
        self.addChild(self.model)
        self.addChild(self.animationRoot)
        
    }
    
    required init() {
        self.quemAtirou = .enemyEntityBitMask
        self.model = ModelEntity()
        self.animationRoot = Entity()
        self.modelShape = .generateSphere(radius: 0.1)
        
        self.model.components[ModelComponent.self] = ModelComponent(mesh: .generateBox(size: 0.2), materials: [SimpleMaterial(color: .green, isMetallic: true)])
        
        //Colisão
        self.model.generateCollisionShapes(recursive: true)
        
        // tenho q lidar com o filtro aqui
        
        self.model.collision = CollisionComponent(shapes: [modelShape], mode: .trigger, filter: .sensor)
        
        super.init()
        
        self.components[GameCollisionComponent.self] = GameCollisionComponent(entityBitMask: quemAtirou)
        self.addChild(self.model)
    }
}
