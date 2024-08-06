//
//  EnemyEntity.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

import Foundation
import RealityKit

import Foundation
import RealityKit
import Combine

class EnemyEntity: Entity, HasCollision, HasModel {
    
    var model: Entity
    var animationRoot: Entity
    var modelShape: ShapeResource // Tool to define the collision shape
    
    private var cancellables: Set<AnyCancellable> = []

    required init() {
        self.animationRoot = Entity()
        self.modelShape = .generateSphere(radius: 0.1)
        
        self.model = Entity()
        
        super.init()
        
        Entity.loadModelAsync()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Model loading completed.")
                case .failure(let error):
                    print("Failed to load model: \(error)")
                }
            }, receiveValue: { [weak self] assetDict in
                guard let self = self else { return }
                

                if let modelEntity = assetDict[.diver_anim_stand_idle] {
                    
                    self.model = modelEntity.clone(recursive: true)
                    
//                    self.model.generateCollisionShapes(recursive: true)
//                    
//                    self.model.components[gameCollisionComponent.self] = gameCollisionComponent(entityBitMask: .enemyEntityBitMask)
                    
                    self.addChild(self.model)
                }
               
                self.addChild(self.animationRoot)
                
                self.components[MotionComponent.self] = MotionComponent()
            })
            .store(in: &cancellables)
    }
    

}
