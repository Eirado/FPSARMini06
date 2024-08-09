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
    var spawner: SpawnerEntity? = nil
    var player: PlayerEntity? = nil
    var cameraTransforms: simd_float4x4 = simd_float4x4(0)
    var startPosition:SIMD3<Float>?
    private var firstTap:Bool = false
    
    func mata() {
        enemy = nil
        player = nil
    }
    
    required init(frame frameRect: CGRect) {
        
        super.init(frame: frameRect)
        arViewGestureSetup()
    }
    
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("coder init has not been implemented")
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
                        
        player = PlayerEntity(ar: self)
    
        self.installGestures(.all, for: player!)
    
        let worldAnchor = AnchorEntity(world: .zero)
        
        worldAnchor.name = "worldAnchor"
        
        
        let planeAnchor = AnchorEntity(plane: .horizontal)
        
        planeAnchor.name = "Plane Anchor"
//  
        self.scene.addAnchor(planeAnchor)
        self.scene.addAnchor(worldAnchor)
        
        worldAnchor.addChild(player!)
       
        setupEnemies(anchor: worldAnchor)
    }
    
    func setupEnemies(anchor: AnchorEntity) {
        enemy = EnemyEntity()
        spawner = SpawnerEntity(entity: enemy!, anchor: anchor, spawnerRadius: 0.3, entityCount: 10)
    }
    
    func arViewGestureSetup() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnARView))
        self.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func tappedOnARView(_ sender: UITapGestureRecognizer) {
        Task {
            await player?.addBullet()
        }
    }
    
    func destroyEntities() {
            player = nil
            enemy = nil
            spawner = nil
        }
    
    func resetScene() {
            // Destrua entidades antigas
            destroyEntities()
            
            // Reconfigure o ARView
            self.scene.anchors.removeAll()
            
            player = PlayerEntity(ar: self)
            self.installGestures(.all, for: player!)
            
            let worldAnchor = AnchorEntity(world: .zero)
            worldAnchor.name = "worldAnchor"
            self.scene.addAnchor(worldAnchor)
            worldAnchor.addChild(player!)
            
            setupEnemies(anchor: worldAnchor)
        }
    
}
