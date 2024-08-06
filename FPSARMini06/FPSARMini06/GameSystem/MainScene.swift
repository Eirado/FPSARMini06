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

// Mudanças para teste de componente

class MainScene: ARView {
    
    var enemy: EnemyEntity? = nil
    
    var player: PlayerEntity? = nil
    var player2: PlayerEntity? = nil
    var pos: SIMD3<Float> = simd_float3(x: 0.0, y: 0.0, z: 0.0)
    var cameraTransforms: simd_float4x4 = simd_float4x4(0)
    var startPosition:SIMD3<Float>?
    private var firstTap:Bool = false
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        
        arViewGestureSetup()
    }
    
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("coder init has not been implemented")
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        
        
//        enemy = EnemyEntity()
//
//        enemy?.position.x += 0.3
//        self.installGestures(.all, for: enemy!)
//
        
        player = PlayerEntity(ar:self)
        
        
        self.installGestures(.all, for: player!)
    
        
        let worldAnchor = AnchorEntity(world: .zero)
        
        worldAnchor.name = "worldAnchor"
        
        self.scene.addAnchor(worldAnchor)
        
        worldAnchor.addChild(player!)

    }
    
    func arViewGestureSetup() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnARView))
        self.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func tappedOnARView(_ sender: UITapGestureRecognizer) {
        player?.addBullet()
    }
}

