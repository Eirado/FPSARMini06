//
//  MovementComponent.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

import Foundation
import RealityKit

struct MotionComponent: RealityKit.Component {
    
    struct Force {
        let acceleration: SIMD3<Float>
        let multiplier: Float
        let name: String
    }

    var forces = [Force]()

    var velocity: SIMD3<Float> = SIMD3<Float>.zero
    
    var lookAtEntity: Entity?
}
    

