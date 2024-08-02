//
//  AttackComponent.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

import RealityKit
import Foundation

struct AttackComponent: RealityKit.Component {
    var startPosition:SIMD3<Float> = .zero
    var direction:SIMD3<Float> = .zero
    var attackSpeed:Float = 0
    var damage: Float = 0
    var duration:TimeInterval = 0
}
