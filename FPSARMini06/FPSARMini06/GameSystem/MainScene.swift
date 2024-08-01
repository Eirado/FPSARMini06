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
    var spawner: SpawnerEntity? = nil
    var player: PlayerEntity? = nil
    var player2: PlayerEntity? = nil
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
        
        enemy?.position.x += 0.3
        self.installGestures(.all, for: enemy!)
        
        
        player = PlayerEntity()
        self.installGestures(.all, for: player!)
        
        player2 = PlayerEntity()
        self.installGestures(.all, for: player2!)
        
        let enemyClone = enemy?.clone(recursive: true)
        let enemyClone2 = enemy?.clone(recursive: true)
        let worldAnchor = AnchorEntity(world: simd_float3(x: 0, y: 0, z: 0))
        
//        worldAnchor.addChild(enemyClone2!)
//        worldAnchor.addChild(enemyClone!)
        
        self.pos = worldAnchor.position
        
        self.scene.addAnchor(worldAnchor)
        
        arViewGestureSetup()
        
        _ = SpawnerEntity(entity: enemy!, anchor: worldAnchor, spawnerRadius: 3, entityCount: 50)
    }
    
    func arViewGestureSetup() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnARView))
        self.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func tappedOnARView(_ sender: UITapGestureRecognizer) {
    }
}
