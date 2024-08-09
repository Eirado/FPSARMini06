//
//  spawnerSystem.swift
//  FPSARMini06
//
//  Created by Gabriel Eirado on 09/08/24.
//

import RealityKit
import Combine
import UIKit.UIColor

class SpawnerSystem: RealityKit.System {
    
    static var dependencies: [SystemDependency] { [.before(MotionSystem.self)] }
    
    private static let query = EntityQuery(where: .has(MotionComponent.self))
    
    var querySpawner = EntityQuery(where: .has(SpawnerComponent.self))
    
    private var cancellables = Set<AnyCancellable>()
    
    var spawner: Entity?
    
    var spawnerComponent: SpawnerComponent? = nil
    
    required init(scene: Scene) {  }

    func update(context: SceneUpdateContext) {
        
        context.scene.performQuery(SpawnerSystem.query).forEach { entity in
            
            print("aa")
            
            if spawnerComponent == nil {
                
                let spawnerEntity = context.scene.performQuery(querySpawner).map { $0 }
                
                self.spawnerComponent = spawnerEntity.first?.components[SpawnerComponent.self]
                
                if var spawnerComponent = spawnerComponent {
                    setupEntity(component: &spawnerComponent)
                    self.spawnerComponent = spawnerComponent
                }
            }
        }
    }
    
    private func setupEntity(component: inout SpawnerComponent) {
        
        guard let radius = component.spawnerRadius, let anchor = component.anchor else {
            return
        }
        
        let sphere = MeshResource.generateSphere(radius: radius)
        let material = SimpleMaterial(color: UIColor(white: .zero, alpha: 0.3), isMetallic: false)
        let modelEntity = ModelEntity(mesh: sphere, materials: [material])

        anchor.addChild(modelEntity)
        
        component.entity = modelEntity // Store the modelEntity in the component
    }
    
    func spawnEntities() {
        guard let spawnerComponent = spawnerComponent,
              let entity = spawnerComponent.entity,
              let anchor = spawnerComponent.anchor else {
            return
        }
        
        let spawnPublisher = Publishers.Sequence(sequence: 0...spawnerComponent.entityCount!)
            .flatMap { _ -> AnyPublisher<Void, Never> in
                Future { promise in
                    let entityCopy = entity.clone(recursive: true)
                   
                    DispatchQueue.main.async {
                        anchor.addChild(entityCopy)
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
            }, receiveValue: { _ in })
            .store(in: &cancellables)
    }
}
