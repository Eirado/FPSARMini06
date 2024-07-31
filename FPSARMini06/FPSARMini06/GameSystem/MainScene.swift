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
    var enemy2: EnemyEntity? = nil
    var player: PlayerEntity? = nil
    var player2: PlayerEntity? = nil
    var bullet: BulletEntity? = nil
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
        
        enemy2 = EnemyEntity()
        enemy2?.position.x -= 0.3
        self.installGestures(.all, for: enemy2!)
        
        player = PlayerEntity()
        self.installGestures(.all, for: player!)
        
        player2 = PlayerEntity()
        self.installGestures(.all, for: player2!)
        
        bullet = BulletEntity(arView: self)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(tapGesture)
        
        let planeAnchor = AnchorEntity(plane: .horizontal)
//        let worldAnchor = AnchorEntity(world: simd_float3(x: 0, y: 0, z: 0))
        
        planeAnchor.name = "plano_principal"
//        worldAnchor.addChild(enemy!)
//        worldAnchor.addChild(enemy2!)
        planeAnchor.addChild(player!)
        planeAnchor.addChild(player2!)
        planeAnchor.addChild(bullet!)

//        self.pos = worldAnchor.position
        
        self.scene.addAnchor(planeAnchor)
//        self.scene.addAnchor(worldAnchor)
        
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
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        bullet?.movementOfBullet()
        print("clicou")
    }
    
}
