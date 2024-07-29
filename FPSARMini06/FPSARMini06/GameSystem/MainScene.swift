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
        
        let planeAnchor = AnchorEntity(plane: .horizontal)
        planeAnchor.addChild(enemy!)
        planeAnchor.addChild(enemy2!)
        
        self.scene.addAnchor(planeAnchor)
    }
}
