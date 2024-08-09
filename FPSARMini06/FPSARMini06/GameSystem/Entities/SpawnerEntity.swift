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
        let material = SimpleMaterial(color: UIColor(white: .zero, alpha: 0.3), isMetallic: false)
        let modelEntity = ModelEntity(mesh: sphere, materials: [material])
        anchor.addChild(modelEntity)
    }
    
    func spawnEntities() {
        let spawnPublisher = Publishers.Sequence(sequence: 0..<entityCount)
            .flatMap { _ -> AnyPublisher<Void, Never> in
                Future { promise in
                    let randomPosition = self.randomPointInSemiSphere(radius: self.spawnerRadius)
                    let entityCopy = self.entity.clone(recursive: true)
                    entityCopy.position = randomPosition
                    
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
    
    private func randomPointInSemiSphere(radius: Float) -> SIMD3<Float> {
            let u = Float.random(in: 0...1)
            let v = Float.random(in: 0...1)
            let theta = 2 * Float.pi * u
            let phi = acos(v)  // Adjusted to only use the top half of the sphere
            let r = radius * pow(Float.random(in: 0...1), 1/3)
            
            let x = r * sin(phi) * cos(theta)
            let y = r * sin(phi) * sin(theta)
            let z = r * cos(phi)
            
            return SIMD3<Float>(x, y, z)
        }
}
