//
//  PlayerEntity.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

import Foundation
import RealityKit

class PlayerEntity: Entity, HasCollision, HasModel {
    
    var model: ModelEntity
    var animationRoot: Entity
    var modelShape: ShapeResource // Ferramenta para definir o shape da colisao
    
    required init() {
        
        self.model = ModelEntity()
        self.animationRoot = Entity()
        self.modelShape = .generateBox(width: 0.2, height: 0.2, depth: 0.2)
        
        self.model.components[ModelComponent.self] = ModelComponent(mesh: .generateBox(size: 0.2), materials: [SimpleMaterial(color: .blue, isMetallic: true)])
        
        //Defino o comportamento de colisao aqui
        self.model.components[GameCollisionComponent.self] = GameCollisionComponent()
        self.model.components[HealthComponent.self] = HealthComponent(totalHealth: .playerEntityHealth)
        
        self.model.generateCollisionShapes(recursive: true)
        self.model.collision = CollisionComponent(shapes: [modelShape])
        
        super.init()
        
        self.model.name = "PlayerEntity"
        
        self.addChild(self.model)
        self.addChild(self.animationRoot)
    }
}
