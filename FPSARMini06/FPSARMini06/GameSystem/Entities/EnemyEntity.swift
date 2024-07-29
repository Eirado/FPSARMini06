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
    var esfera: ShapeResource
    
    required init() {
        
        esfera = .generateSphere(radius: 0.2)
        
        self.model = ModelEntity()
        self.animationRoot = Entity()
        
        self.model.components[ModelComponent.self] = ModelComponent(mesh: .generateSphere(radius: 0.2), materials: [SimpleMaterial(color: .red, isMetallic: true)])
        
        //Defino o comportamento de colisao aqui
        self.model.components[gameCollisionComponent.self] = gameCollisionComponent(entityBitMask: .enemyEntityBitMask)
        self.model.generateCollisionShapes(recursive: true)
        self.model.collision = CollisionComponent(shapes: [esfera], mode: .trigger, filter: .sensor)
        
        super.init()
        self.addChild(self.model)
        self.addChild(self.animationRoot)
           
    }
}
