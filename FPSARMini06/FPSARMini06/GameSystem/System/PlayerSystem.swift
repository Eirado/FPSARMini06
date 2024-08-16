//
//  PlayerSystem.swift
//  FPSARMini06
//
//  Created by Luiz Felipe on 02/08/24.
//

import Foundation
import RealityKit
import Combine

class PlayerSystem:RealityKit.System {
    
    
    required init(scene: Scene) {
    }

    private static let query = EntityQuery(where: .has(PlayerComponent.self))

    
    func update(context: SceneUpdateContext) {
        guard !settingsPersistence.pauseGame else {return}
        context.scene.performQuery(PlayerSystem.query).forEach{ entity in
            guard let component = entity.components[PlayerComponent.self] as? PlayerComponent else {return}
            
            guard let cameraTransform = component.arView?.session.currentFrame?.camera.transform else { return }
            
            let startPosition = simd_make_float3(cameraTransform.columns.3.x, cameraTransform.columns.3.y, cameraTransform.columns.3.z)
            component.currentPos = startPosition
            entity.position = startPosition
            
        }
    }
}

