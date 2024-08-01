import Foundation
import RealityKit
import UIKit

class MotionSystem: RealityKit.System {
    
    private static let query = EntityQuery(where: .has(MotionComponent.self))
    
    private var nodes: [SIMD3<Float>] = []
    private var currentTargetIndex: Int?
    private let sphereRadius: Float = 0.3
    
    required init(scene: Scene) {
        generateNodes()
        selectNewTargetNode()
//        visualizeSphereAndNodes(in: scene)
    }
    
    func update(context: SceneUpdateContext) {
        
        let deltaTime = Float(context.deltaTime)
        
        context.scene.performQuery(Self.query).forEach { entity in
            
            guard var motion = entity.components[MotionComponent.self] as? MotionComponent else { return }
            
            defer {
                entity.components[MotionComponent.self] = motion
            }
            
            var newTransform = entity.transform
            
            let targetNode = getCurrentTargetNode(for: entity)
            let direction = normalize(targetNode - entity.transform.translation)
            let speed: Float = 1.0
            let acceleration = direction * speed * 0.1
            
            motion.forces = [MotionComponent.Force(acceleration: acceleration, multiplier: 1.0, name: "NodeForce")]
            
            let combinedAcceleration = combinedForces(values: motion.forces)
            let accelerationScaled = combinedAcceleration * deltaTime
            
            motion.velocity += accelerationScaled
            
            let velocityScaled = motion.velocity * deltaTime * 3
            
            newTransform.translation += velocityScaled
            
            entity.move(to: newTransform, relativeTo: nil)
            
            if distance(entity.transform.translation, targetNode) < 0.1 {
                selectNewTargetNode()
            }
        }
    }
    
    private func combinedForces(values: [MotionComponent.Force]) -> SIMD3<Float> {
        values.reduce(.zero) { result, force in
            result + (force.acceleration * force.multiplier)
        }
    }
    
    private func generateNodes() {
        let numberOfNodes = 10
        nodes.removeAll()
        
        for i in 0..<numberOfNodes {
            let theta = Float(i) * (2.0 * .pi / Float(numberOfNodes))
            let phi = acos(1.0 - 2.0 * Float(i) / Float(numberOfNodes))
            
            let x = sphereRadius * sin(phi) * cos(theta)
            let y = sphereRadius * sin(phi) * sin(theta)
            let z = sphereRadius * cos(phi)
            
            let node = SIMD3<Float>(x, y, z)
            nodes.append(node)
        }
    }
    
    private func getCurrentTargetNode(for entity: Entity) -> SIMD3<Float> {
        if currentTargetIndex == nil || distance(entity.transform.translation, nodes[currentTargetIndex!]) < 0.1 {
            selectNewTargetNode()
        }
        return nodes[currentTargetIndex!]
    }
    
    private func selectNewTargetNode() {
        currentTargetIndex = Int.random(in: 0..<nodes.count)
    }
    
    private func visualizeSphereAndNodes(in scene: Scene) {
        
        scene.performQuery(MotionSystem.query).forEach { entity in

            let sphereMesh = MeshResource.generateSphere(radius: sphereRadius)
            let sphereMaterial = SimpleMaterial(color: UIColor(white: .zero, alpha: 0.1), isMetallic: false)
            let sphereEntity = ModelEntity(mesh: sphereMesh, materials: [sphereMaterial])
            entity.addChild(sphereEntity)
            sphereEntity.position = .zero
            
            let nodeRadius: Float = 0.02 
            for nodePosition in nodes {
                let nodeMesh = MeshResource.generateSphere(radius: nodeRadius)
                let nodeMaterial = SimpleMaterial(color: .red, isMetallic: false)
                let nodeEntity = ModelEntity(mesh: nodeMesh, materials: [nodeMaterial])
                nodeEntity.position = nodePosition
                entity.addChild(nodeEntity)
            }
        }
    }
}
