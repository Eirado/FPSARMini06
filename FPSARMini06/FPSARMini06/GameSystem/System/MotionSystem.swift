//
//  MotionSystem.swift
//  FPSARMini06
//
//  Created by Gabriel Eirado on 25/07/24.
//

import Foundation
import RealityKit
import UIKit

class MotionSystem: RealityKit.System {
    
    private static let query = EntityQuery(where: .has(MotionComponent.self))
    
    private var nodes: [SIMD3<Float>] = []
    private var currentTargetIndex: Int?
    private let sphereRadius: Float = 0.5
    
    required init(scene: Scene) {
        generateNodes()
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
        
        for _ in 0..<numberOfNodes {
            let theta = Float.random(in: 0...2 * .pi)
            let phi = Float.random(in: 0...2 * .pi)
            let x = sphereRadius * sin(theta) * cos(phi)
            let y = sphereRadius * sin(theta) * sin(phi)
            let z = sphereRadius * cos(theta)
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
}
