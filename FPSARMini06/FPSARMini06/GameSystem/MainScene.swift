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
    var pos: SIMD3<Float> = simd_float3(x: 0.0, y: 0.0, z: 0.0)
    
    /// Entidades para a bullet do player e do enemy
    var bulletPlayer: BulletEntity? = nil
    var bulletEnemy: BulletEntity? = nil
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("coder init has not been implemented")
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        
        bulletEnemy = BulletEntity(quemAtirou: .enemyEntityBitMask)
        bulletPlayer = BulletEntity(quemAtirou: .playerEntityBitMask)
        
        enemy = EnemyEntity()
        enemy?.position.x += 0.3
        player = PlayerEntity()
        
        let entities: [Entity] = [player!, enemy!, bulletEnemy!, bulletPlayer!]
        
        for entity in entities {
            self.installGestures(.all, for: entity as! HasCollision)
        }
        
        let enemyClone = enemy?.clone(recursive: true)
        self.installGestures(.all, for: enemyClone!)
        enemyClone?.position.x = 0.3
        
        let playerClone = player?.clone(recursive: true)
        self.installGestures(.all, for: playerClone!)
        playerClone?.position.x = -0.3
        
        let enemyBulletClone = bulletEnemy?.clone(recursive: true)
        self.installGestures(.all, for: enemyBulletClone!)
        enemyBulletClone?.position.x = 0.6
        
        let playerBulletClone = bulletPlayer?.clone(recursive: true)
        self.installGestures(.all, for: playerBulletClone!)
        playerBulletClone?.position.x = -0.6
        
        let worldAnchor = AnchorEntity(world: simd_float3(x: 0, y: 0, z: 0))
        
        worldAnchor.addChild(enemyClone!)
        worldAnchor.addChild(playerClone!)
        worldAnchor.addChild(enemyBulletClone!)
        worldAnchor.addChild(playerBulletClone!)
        
        self.pos = worldAnchor.position
        
        self.scene.addAnchor(worldAnchor)
    }
}
