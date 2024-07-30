//
//  BulletEntyty.swift
//  FPSARMini06
//
//  Created by Luiz Felipe on 30/07/24.
//

import Foundation
import RealityKit

class BulletEntity: Entity, HasCollision, HasModel{
    
    var model: ModelEntity
    var animationRoot: Entity
    var modelShape: ShapeResource // Ferramenta para definir o shape da colisao
    var attackComponent: AttackComponent{
        get{return components[AttackComponent.self] ?? AttackComponent(attackSpeed: 5, isHidden: false)}
        set{ components[AttackComponent.self] = newValue}
    }
    var arView:ARView?
    
    
    required init(arView:ARView) {
        
        self.model = ModelEntity()
        self.animationRoot = Entity()
        self.modelShape = .generateSphere(radius: 0.1)
        
        self.model.generateCollisionShapes(recursive: true)
        
        super.init()
        
        self.model.components[AttackComponent.self] = attackComponent
        self.components[gameCollisionComponent.self] = gameCollisionComponent(entityBitMask: .bulletEntity)
        self.model.collision = CollisionComponent(shapes: [modelShape], mode: .trigger, filter: .sensor)
        
        self.addChild(self.model)
        self.addChild(self.animationRoot)
        self.arView = arView
        
        
    }
    
    @MainActor required init() {
        fatalError("init() has not been implemented")
    }
    
    
}
extension BulletEntity{
    func movementOfBullet(){
        
        print("entrou na funcao")
        self.attackComponent.isHidden = true
        
        if attackComponent.isHidden{
            self.model.components[ModelComponent.self] = ModelComponent(mesh: .generateSphere(radius: 0.1), materials: [SimpleMaterial(color: .purple, isMetallic: true)])
            
            guard let cameraTransform = arView?.session.currentFrame?.camera.transform else { return }
            var startPosition = simd_make_float3(cameraTransform.columns.3.x, cameraTransform.columns.3.y, cameraTransform.columns.3.z)
            startPosition.y -= 0.1
            self.position = startPosition
            
            let direction = normalize(simd_make_float3(-cameraTransform.columns.2.x, -cameraTransform.columns.2.y, -cameraTransform.columns.2.z))
            
            // Calcular a posição final com base na direção e velocidade
            let endPosition = startPosition + direction * attackComponent.attackSpeed
            
            // Animação da bala
            let animationDuration: TimeInterval = 1.0
            self.move(to: Transform(translation: endPosition), relativeTo: nil, duration: animationDuration, timingFunction: .linear)
            // Remover a bala após a animação
            DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                //self.position = reference.position
                self.attackComponent.isHidden = false
                self.model.components[ModelComponent.self] = .none
            }
        }
    }
}
