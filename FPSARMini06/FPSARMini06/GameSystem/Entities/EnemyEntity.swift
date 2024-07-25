//
//  EnemyEntity.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

import Foundation
import RealityKit

class EnemyEntity: Entity {
    
    var model: Entity
    var animationRoot: Entity
    
    required init() {
        
        self.model = Entity()
        self.animationRoot = Entity()
        
        self.model.components[MotionComponent.self] = ModelComponent(mesh: .generateSphere(radius: 0.2), materials: [SimpleMaterial(color: .red, isMetallic: true)])
        
        self.model.components.set(CollisionComponent(shapes: [.generateSphere(radius: 0.2)]))
        
        
        super.init()
        self.addChild(self.model)
        self.addChild(self.animationRoot)
           
    }
}
