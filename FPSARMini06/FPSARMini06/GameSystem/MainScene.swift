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
    
        self.installGestures(.all, for: player!)
        
        let planeAnchor = AnchorEntity(plane: .horizontal)
        
        self.worldAnchor = AnchorEntity(world: .zero)
        
        worldAnchor.name = "worldAnchor"
        
        
        let planeAnchor = AnchorEntity(plane: .horizontal)
        
        planeAnchor.name = "Plane Anchor"
//
        self.scene.addAnchor(planeAnchor)
       
        self.scene.addAnchor(self.worldAnchor!)
        
        self.worldAnchor!.addChild(player!)
        
        setupEnemies(anchor: self.worldAnchor!)
        
    }

    @MainActor required dynamic init(frame frameRect: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }
    
    func setupEnemies(anchor: AnchorEntity) {
        enemy = EnemyEntity()
        
        spawner = SpawnerEntity()
        
        guard let component = spawner?.components[SpawnerComponent.self] as? SpawnerComponent else { return }

        component.entity = enemy!
        component.entityCount = 10
        component.spawnerRadius = 0.8
        
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

extension MainScene: ARCoachingOverlayViewDelegate {
   
//    func addCoaching() {
//        let coachingOverlay = ARCoachingOverlayView()
//        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        coachingOverlay.goal = .horizontalPlane
//        coachingOverlay.session = self.session
//        coachingOverlay.delegate = self
//        self.addSubview(coachingOverlay)
//    }
//    
////    private func addVirtualObjects() {
////        guard let anchor = self.scene.anchors.first(where: { $0.name == "Plane Anchor" }) else {
////            return
////        }
//        
//        setupEnemies(anchor: anchor as! AnchorEntity)
//    }
//    
//    public func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
//        addVirtualObjects()
//        carregou = true
//    }
    
}
