//
//  FrogEntity.swift
//  FPSARMini06
//
//  Created by Luiz Felipe on 31/07/24.
//
import Foundation
import RealityKit
import Combine

class FrogEntity: Entity, HasCollision, HasModel {
    var model: ModelEntity?
    var animationRoot: Entity
    var modelShape: ShapeResource
    private var cancellable:AnyCancellable?
    
    required init() {
        self.animationRoot = Entity()
        self.modelShape = .generateSphere(radius: 0.1)
         
        super.init()
        asyncLoadModel()
        self.addChild(self.animationRoot)
           
    }
    
    func asyncLoadModel() {
        let fileName = "frogDrone.usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: fileName).sink(receiveCompletion: { loadCompletion in
            switch loadCompletion{
            case .failure(let erro):
                fatalError("Unable to load modelEntity for \(fileName).\nError:\(erro.localizedDescription)")
            case .finished:
                break
            }
        }, receiveValue: { modelEntity in
            self.model = modelEntity
            self.addChild(self.model ?? ModelEntity())
        })
    }
}
