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
    private var firstTap: Bool = false
    let generator = UIImpactFeedbackGenerator(style: .rigid)
    var worldAnchor: AnchorEntity? = nil

    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        arViewGestureSetup()
    }
    
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("coder init has not been implemented")
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        setupScene()
    }
    
    func setupScene() {
        // Inicializa o player e adiciona gestos
        player = PlayerEntity(ar: self)
        self.installGestures(.all, for: player!)
        
        // Configura os anchors
        worldAnchor = AnchorEntity(world: .zero)
        worldAnchor?.name = "worldAnchor"
        
        let planeAnchor = AnchorEntity(plane: .horizontal)
        planeAnchor.name = "Plane Anchor"
        
        self.scene.addAnchor(planeAnchor)
        self.scene.addAnchor(worldAnchor!)
        
        // Adiciona o player e configura os inimigos
        worldAnchor?.addChild(player!)
        setupEnemies(anchor: worldAnchor!)
    }
    
    func setupEnemies(anchor: AnchorEntity) {
        enemy = EnemyEntity()
        spawner = SpawnerEntity()
        
        guard var component = spawner?.components[SpawnerComponent.self] as? SpawnerComponent else { return }
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
        if settingsPersistence.defaults.bool(forKey: "vibration") && !settingsPersistence.pauseGame {
            generator.impactOccurred()
        }
        Task {
            await player?.addBullet()
        }
    }
    
    func resetScene() {
        // Remove todas as entidades da cena
        worldAnchor?.children.forEach { $0.removeFromParent() }
        player = nil
        enemy = nil
        spawner = nil
        
        // Reinicia a configuração da cena
        setupScene()
    }
}
