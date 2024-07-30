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
        planeAnchor.name = "plano_principal"
        planeAnchor.addChild(enemy!)
        planeAnchor.addChild(enemy2!)
        planeAnchor.addChild(player!)
        planeAnchor.addChild(player2!)
        planeAnchor.addChild(bullet!)
        
        self.scene.addAnchor(planeAnchor)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        bullet?.movementOfBullet()
        print("clicou")
    }
    
}
