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
        self.model.components[GameCollisionComponent.self] = GameCollisionComponent(entityBitMask: .otherEnemyEntityBitMask)
        
        self.model.generateCollisionShapes(recursive: true)
        
        let extractedEntityBitMask = GameCollisionComponent(entityBitMask: .otherEnemyEntityBitMask)
        let bitMask = extractedEntityBitMask.entityBitMask
        
        let enemyGroup = CollisionGroup(rawValue: bitMask!.rawValue)
        
        let entityMask = CollisionGroup.all.subtracting(enemyGroup)
//        let entityMask = CollisionGroup(rawValue: bitMask!.rawValue)
        
        self.model.collision = CollisionComponent(shapes: [modelShape])
        
        super.init()
        
        self.model.name = "EnemyEntity"
        
        let clone = self.model.clone(recursive: true)

        self.addChild(clone)
        self.addChild(self.animationRoot)
           
    }
}
