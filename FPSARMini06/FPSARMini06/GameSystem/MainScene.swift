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
    var enemy2: EnemyEntity? = nil
    var pos: SIMD3<Float> = simd_float3(x: 0.0, y: 0.0, z: 0.0)
    
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("coder init has not been implemented")
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        
        enemy = EnemyEntity()
        enemy2 = EnemyEntity()
        
        
        let planeAnchor = AnchorEntity(world: simd_float3(x: 0, y: 0, z: 0))
        planeAnchor.addChild(enemy!)
        planeAnchor.addChild(enemy2!)
        
        self.pos = planeAnchor.position
        
        self.scene.addAnchor(planeAnchor)
        
        arViewGestureSetup()
    }
    
    func arViewGestureSetup() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnARView))
        self.addGestureRecognizer(tapGesture)

    }
    
    @objc func tappedOnARView(_ sender: UITapGestureRecognizer) {
        _ = sender.location(in: self)
        
        print(pos)
        enemy?.position = pos
    }
}
