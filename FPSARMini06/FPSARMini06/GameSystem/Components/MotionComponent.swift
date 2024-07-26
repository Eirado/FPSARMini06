//
//  MovementComponent.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

import Foundation
import RealityKit

struct MotionComponent: RealityKit.Component {
    
    let acceleration: SIMD3<Float>
    let multiplier: Float
    var velocity: SIMD3<Float> = SIMD3<Float>.zero
    
}
