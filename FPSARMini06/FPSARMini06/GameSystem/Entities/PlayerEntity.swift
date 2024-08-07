//
//  PlayerEntity.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

import Foundation
import RealityKit

class PlayerEntity: Entity, HasCollision, HasModel {
    
    var model: ModelEntity?
    var animationRoot: Entity?
    var modelShape: ShapeResource? // Ferramenta para definir o shape da colisao
    var bullet: BulletEntity?
    var ar: ARView?
    
    required init() {
        super.init()
    }
    required init(ar: ARView) {
        
        self.model = ModelEntity()
        self.animationRoot = Entity()
        self.modelShape = .generateBox(width: 0, height: 0, depth: 0)
        self.ar = ar
        self.model?.components[ModelComponent.self] = ModelComponent(mesh: .generateBox(size: 0), materials: [SimpleMaterial(color: .blue, isMetallic: true)])
    
        //Defino o comportamento de colisao aqui
        self.model?.generateCollisionShapes(recursive: true)
        
        bullet = BulletEntity()
        
        super.init()
        
        self.components[PlayerComponent.self] = PlayerComponent()
        self.components[GameCollisionComponent.self] = GameCollisionComponent()
        self.components[HealthComponent.self] = HealthComponent(totalHealth: .playerEntityHealth)
//        self.model?.collision = CollisionComponent(shapes: [modelShape])

        movement()
        
        self.name = "PlayerEntity"
        self.addChild(self.model!)
        self.addChild(self.animationRoot!)
    }
}

extension PlayerEntity{
    
    func addBullet() async {
        guard var component = bullet?.components[AttackComponent.self] as? AttackComponent else { return }

        guard let cameraTransform = self.ar?.session.currentFrame?.camera.transform else {
            print("error")
            return
        }

        var startPosition = simd_make_float3(cameraTransform.columns.3.x, cameraTransform.columns.3.y, cameraTransform.columns.3.z)
        var direction = normalize(simd_make_float3(-cameraTransform.columns.2.x, -cameraTransform.columns.2.y, -cameraTransform.columns.2.z))

        startPosition.y -= 0.1
        startPosition.x += 0.05

        direction.y += 0.08
        direction.x -= 0.03

        component.startPosition = startPosition
        component.direction = direction
        component.duration = 1
        component.attackSpeed = 2
        component.hit = false
        
        bullet?.components[AttackComponent.self] = component
        let anchorBullet = AnchorEntity(world: startPosition)
        let clone = bullet?.clone(recursive: true)

        self.addChild(clone!)
    }

    func movement(){
        guard let component = self.components[PlayerComponent.self] as? PlayerComponent else {return}
        
        component.arView = ar
        self.components[PlayerComponent.self] = component
    }
    
    
}
