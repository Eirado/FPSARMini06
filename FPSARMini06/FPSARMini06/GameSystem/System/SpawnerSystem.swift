import RealityKit
import Combine
import UIKit.UIColor

class SpawnerSystem: RealityKit.System {

    private static let query = EntityQuery(where: .has(MotionComponent.self))

    var querySpawner = EntityQuery(where: .has(SpawnerComponent.self))

    private var cancellables = Set<AnyCancellable>()

    var spawner: Entity?

    var spawnerComponent: SpawnerComponent? = nil

    required init(scene: Scene) { }

    func update(context: SceneUpdateContext) {

        context.scene.performQuery(self.querySpawner).forEach { entity in

            if spawnerComponent == nil {
                
                self.spawner = entity

                var component = entity.components[SpawnerComponent.self]

                self.spawnerComponent = component as? SpawnerComponent
            
                spawnEntities(component: spawnerComponent!)
                
            }
        }
    }


    func spawnEntities(component: SpawnerComponent) {
        
        let spawnPublisher = Publishers.Sequence(sequence: 0...component.entityCount!)
            .flatMap { _ -> AnyPublisher<Void, Never> in
                Future { promise in
                    let entityCopy = component.entity!.clone(recursive: true)

                    DispatchQueue.main.async { [self] in
                        
                        self.spawner?.addChild(entityCopy)
                        
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
