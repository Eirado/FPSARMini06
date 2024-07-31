//
//  EnemyEntity.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

import Foundation
import RealityKit

class EnemyEntity: Entity, HasCollision, HasModel {
    
    var model: ModelEntity
    var animationRoot: Entity
    var modelShape: ShapeResource // Ferramenta para definir o shape da colisao
    
    required init() {
        
        self.model = ModelEntity()
        self.animationRoot = Entity()
        self.modelShape = .generateSphere(radius: 0.1)
        
        self.model.components[ModelComponent.self] = ModelComponent(mesh: .generateSphere(radius: 0.1), materials: [SimpleMaterial(color: .red, isMetallic: true)])
        
        //Defino o comportamento de colisao aqui
        self.model.components[gameCollisionComponent.self] = gameCollisionComponent(entityBitMask: .enemyEntityBitMask)
        self.model.generateCollisionShapes(recursive: true)
        
<<<<<<< HEAD
//        let extractedEntityBitMask = gameCollisionComponent(entityBitMask: .enemyEntityBitMask)
//        let bitMask = extractedEntityBitMask.entityBitMask
//        
//        let entityGroup = CollisionGroup(rawValue: bitMask.rawValue)
//        
//        let entityMask = CollisionGroup.all.subtracting(entityGroup)
//        
//        self.model.collision = CollisionComponent(shapes: [modelShape], mode: .trigger, filter: .init(group: entityGroup, mask: entityMask))
        
=======
>>>>>>> MotionComponent-
        super.init()
        
        self.components[MotionComponent.self] = MotionComponent()
        
        self.addChild(self.model)
        self.addChild(self.animationRoot)
           
    }
}
