//
//  PlayerComponent.swift
//  FPSARMini06
//
//  Created by Luiz Felipe on 02/08/24.
//

import RealityKit
import SwiftUI
class PlayerComponent: RealityKit.Component {
   
    var arView: ARView?
    var currentPos: SIMD3<Float>?
    var score: Int = 0
}
