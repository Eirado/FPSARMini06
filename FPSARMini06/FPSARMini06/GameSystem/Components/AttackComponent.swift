//
//  AttackComponent.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

import RealityKit
import Foundation

struct AttackComponent: Component{
    var startPosition:SIMD3<Float>
    var direction:SIMD3<Float>
    var attackSpeed:Float
    var damage: Float
    var duration:TimeInterval
}
