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
    var startPosition: SIMD3<Float>?
    var worldAnchor: AnchorEntity? = nil
    private var firstTap: Bool = false
    
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
        
        self.worldAnchor = AnchorEntity(world: .zero)
       
        self.scene.addAnchor(self.worldAnchor!)
        
        self.worldAnchor!.addChild(player!)
        
        setupEnemies(anchor: self.worldAnchor!)
        
    }
    
    func setupEnemies(anchor: AnchorEntity) {
        enemy = EnemyEntity()
        
        spawner = SpawnerEntity()
        
        guard let component = spawner?.components[SpawnerComponent.self] as? SpawnerComponent else { return }

        component.entity = enemy!
        component.entityCount = 5
        component.spawnerRadius = 1
        
        spawner?.components[SpawnerComponent.self] = component
        
        anchor.addChild(spawner!)
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
}

