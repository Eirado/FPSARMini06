//
//  spawnerSystem.swift
//  FPSARMini06
//
//  Created by Gabriel Eirado on 09/08/24.
//


import RealityKit

class SpawnerSystem: RealityKit.System {
    
    var query = EntityQuery(where: .has(MotionComponent.self))
    
    var querySpawner = EntityQuery(where: .has(SpawnerComponent.self))
    
    private var cancellables = Set<AnyCancellable>()
    
    var spawner: Entity?
    
    required init(scene: Scene) {
      
    }
    
  

    func update(context: SceneUpdateContext) {
        
        context.scene.performQuery(self.query).forEach{ entity in
            
           
            
            
        }
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
}
