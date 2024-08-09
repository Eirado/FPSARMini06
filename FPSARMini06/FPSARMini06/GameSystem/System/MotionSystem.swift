import Foundation
import RealityKit
import UIKit

class MotionSystem: RealityKit.System {
    private static let query = EntityQuery(where: .has(MotionComponent.self))
    private static let playerQuery = EntityQuery(where: .has(PlayerComponent.self))
    private var nodes: [SIMD3<Float>] = []
    private var currentTargetIndex: Int?
    private let sphereRadius: Float = 0.8
    
    private var playerEntity: [Entity]? = nil // this is a test
    required init(scene: Scene) {
        
    }
    
    func update(context: SceneUpdateContext) {
        let deltaTime = Float(context.deltaTime)
        
        if playerEntity == nil {
            self.playerEntity = context.scene.performQuery(Self.playerQuery).map { $0 }
        }
        let player = context.scene.performQuery(Self.playerQuery).map { $0 }
        
        context.scene.performQuery(Self.query).forEach { entity in
            guard var motion = entity.components[MotionComponent.self] as? MotionComponent else { return }
            
            defer {
                entity.components[MotionComponent.self] = motion
            }
            
            if motion.nodes.isEmpty{
                generateNodes(for: &motion)
            }

            
            var newTransform = entity.transform
            
            let targetNode = getCurrentTargetNode(for: entity, with: &motion)
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
                selectNewTargetNode(for: &motion)
            }
            
            let playerComponent = player.first?.components[PlayerComponent.self] as? PlayerComponent
            
            if let playerPosition = playerComponent?.currentPos {
                let directionToPlayer = playerPosition - entity.position
                let oppositeDirection = -directionToPlayer
                let targetPosition = entity.position + oppositeDirection
                
                entity.look(at: targetPosition, from: entity.position, relativeTo: nil)
            } else {
                entity.look(at: simd_float3(x: 0, y: 0, z: 0), from: entity.position, relativeTo: nil)
            }
        }
    }
    
    private func getCurrentTargetNode(for entity: Entity, with motion: inout MotionComponent) -> SIMD3<Float> {

        selectNewTargetNode(for: &motion)
    
        return motion.nodes[self.currentTargetIndex!]
    }
    
    private func selectNewTargetNode(for motion: inout MotionComponent) {
        currentTargetIndex = Int.random(in: 0..<motion.nodes.count)
    }
    
    private func combinedForces(values: [MotionComponent.Force]) -> SIMD3<Float> {
        values.reduce(.zero) { result, force in
            result + (force.acceleration * force.multiplier)
        }
    }
    
    private func generateNodes(for motion: inout MotionComponent) {
        let numberOfNodes = 10
        motion.nodes.removeAll()
        
        for i in 0..<numberOfNodes {
            let theta = Float(i) * (2.0 * .pi / Float(numberOfNodes))
            let phi = acos(1.0 - 2.0 * Float(i) / Float(numberOfNodes))
            
            let x = sphereRadius * sin(phi) * cos(theta)
            let y = sphereRadius * sin(phi) * sin(theta)
            let z = sphereRadius * cos(phi)
            
            let node = SIMD3<Float>(x, y, z)
            motion.nodes.append(node)
        }
    }
}



