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
    
     required init() {
         
        self.model = ModelEntity()
        self.animationRoot = Entity()
        self.modelShape = .generateSphere(radius: 0.1)

        
        //self.model.generateCollisionShapes(recursive: true)
//        print("entrou no primeiro, startPosition\(startPosition)")
        super.init()
                //self.components[gameCollisionComponent.self] = gameCollisionComponent(entityBitMask: .bulletEntity)
        //self.model.collision = CollisionComponent(shapes: [modelShape], mode: .trigger, filter: .sensor)
        self.model.components[ModelComponent.self] = ModelComponent(mesh: .generateSphere(radius: 0.1), materials: [SimpleMaterial(color: .purple, isMetallic: true)])
        
        self.components[AttackComponent.self] = AttackComponent()
        
        self.addChild(self.model)
        self.addChild(self.animationRoot)
        
        
    }
    
//    required init() {
//        print("a")
//
//        self.model = ModelEntity()
//        self.animationRoot = Entity()
//        self.modelShape = .generateSphere(radius: 0.1)
//        self.startPosition = .zero
//        self.direction = .zero
//        self.attackSpeed = 0
//        self.damage = 0
//        print("entrou no segundo, startPosition\(startPosition)")
//
//        //self.model.generateCollisionShapes(recursive: true)
//        
//        super.init()
//        
//        self.model.components[AttackComponent.self] = AttackComponent(startPosition: startPosition, direction: direction, attackSpeed: attackSpeed,damage: damage, duration: 5)
//        //self.components[gameCollisionComponent.self] = gameCollisionComponent(entityBitMask: .bulletEntity)
//        //self.model.collision = CollisionComponent(shapes: [modelShape], mode: .trigger, filter: .sensor)
//        self.model.components[ModelComponent.self] = ModelComponent(mesh: .generateSphere(radius: 0.2), materials: [SimpleMaterial(color: .yellow, isMetallic: true)])
        
        
        
//    }
    
    
    
}
extension BulletEntity{
//    func movementOfBullet(){
//        
//        print("entrou na funcao")
//        self.attackComponent.isHidden = true
//        
//        if attackComponent.isHidden{
//            self.model.components[ModelComponent.self] = ModelComponent(mesh: .generateSphere(radius: 0.1), materials: [SimpleMaterial(color: .purple, isMetallic: true)])
//            
//            guard let cameraTransform = arView?.session.currentFrame?.camera.transform else { return }
//            var startPosition = simd_make_float3(cameraTransform.columns.3.x, cameraTransform.columns.3.y, cameraTransform.columns.3.z)
//            startPosition.y -= 0.1
//            self.position = startPosition
//            
//            let direction = normalize(simd_make_float3(-cameraTransform.columns.2.x, -cameraTransform.columns.2.y, -cameraTransform.columns.2.z))
//            
//            // Calcular a posição final com base na direção e velocidade
//            let endPosition = startPosition + direction * attackComponent.attackSpeed
//            
//            // Animação da bala
//            let animationDuration: TimeInterval = 1.0
//            self.move(to: Transform(translation: endPosition), relativeTo: nil, duration: animationDuration, timingFunction: .linear)
//            // Remover a bala após a animação
//            DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
//                //self.position = reference.position
//                self.attackComponent.isHidden = false
//                self.model.components[ModelComponent.self] = .none
//            }
//        }
//    }
}
