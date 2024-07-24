//
//  Game.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//


import Foundation
import ARKit
import RealityKit
import Combine
import SwiftUI

class MainScene: ARView {
    
    var enemy: EnemyEntity? = nil
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("coder init has not been implemented")
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        
        enemy = EnemyEntity()
        
        let planeAnchor = AnchorEntity(world: simd_float3(x: 0, y: 0, z: 0))
        planeAnchor.addChild(enemy!)
        
        self.scene.addAnchor(planeAnchor)
    }
}
