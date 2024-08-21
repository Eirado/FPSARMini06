//
//  EnemyEntity.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

import Foundation
import RealityKit
import Combine

class EnemyEntity: Entity, HasCollision, HasModel {
    
    var model: ModelEntity
    var animationRoot: Entity
    var modelShape: ShapeResource // Tool to define the collision shape
    
    private var cancellables: Set<AnyCancellable> = []

    required init() {
        self.animationRoot = Entity()
        self.modelShape = .generateSphere(radius: 0.1)
        
//        self.animationRoot = .gene
        
        self.model = ModelEntity()
    
        super.init()
        
        self.name = "Enemy"
        
        Entity.loadModelAsync()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    fatalError("Failed to load model: \(error)")
                }
            }, receiveValue: { [weak self] assetDict in
                guard let self = self else { return }
                
                if let modelEntity = assetDict[.diver_anim_stand_idle] {
                    self.model = modelEntity.clone(recursive: true)
                    self.model.generateCollisionShapes(recursive: true)
                    self.model.collision = CollisionComponent(shapes: [modelShape])
                    self.model.components[GameCollisionComponent.self] = GameCollisionComponent()
                    self.model.components[HealthComponent.self] = HealthComponent(totalHealth: .enemyEntityHealth)
                    self.model.name = "EnemyEntity"

                    self.addChild(self.model)
                }
                self.components[MotionComponent.self] = MotionComponent()
                self.addChild(self.animationRoot)
                
                
            })
            .store(in: &cancellables)
    }
}
