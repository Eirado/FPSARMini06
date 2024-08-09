//
//  SpawnerEntity.swift
//  FPSARMini06
//
//  Created by Gabriel Eirado on 01/08/24.
//

import Combine
import RealityKit
import UIKit.UIColor

class SpawnerEntity {
    
    private var entity: Entity
    private var anchor: AnchorEntity
    private var spawnerRadius: Float
    private var entityCount: Int
    private var cancellables = Set<AnyCancellable>()
    
    init(entity: Entity, anchor: AnchorEntity, spawnerRadius: Float, entityCount: Int) {
        self.entity = entity
        self.anchor = anchor
        self.spawnerRadius = spawnerRadius
        self.entityCount = entityCount
        setupEntity()
        spawnEntities()

    }
    
    private func setupEntity() {
        
        let sphere = MeshResource.generateSphere(radius: spawnerRadius)
        let material = SimpleMaterial(color: UIColor(white: .zero, alpha: 0), isMetallic: false)
        let modelEntity = ModelEntity(mesh: sphere, materials: [material])

        
        anchor.addChild(modelEntity)
    }
    
    func spawnEntities() {
        let spawnPublisher = Publishers.Sequence(sequence: 0..<entityCount)
            .flatMap { _ -> AnyPublisher<Void, Never> in
                Future { promise in
                    let entityCopy = self.entity.clone(recursive: true)
                   
                    DispatchQueue.main.async {
                        self.anchor.addChild(entityCopy)
                        
                        promise(.success(()))
                    }
                }
                .delay(for: .milliseconds(100), scheduler: DispatchQueue.global())
                .eraseToAnyPublisher()
            }
            .collect()
            .eraseToAnyPublisher()
        
        spawnPublisher
            .sink(receiveCompletion: { _ in
                print("All entities spawned.")
            }, receiveValue: { _ in
               
            })
            .store(in: &cancellables)
    }

}
