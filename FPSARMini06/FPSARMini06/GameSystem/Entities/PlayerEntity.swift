//
//  PlayerEntity.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

import Foundation
import RealityKit

class PlayerEntity: Entity, HasCollision, HasModel {
    
    var model: ModelEntity
    var animationRoot: Entity
    var modelShape: ShapeResource // Ferramenta para definir o shape da colisao
    var bullet:BulletEntity?
    required init() {
        
        self.model = ModelEntity()
        self.animationRoot = Entity()
        self.modelShape = .generateBox(width: 0.2, height: 0.2, depth: 0.2)
        
        self.model.components[ModelComponent.self] = ModelComponent(mesh: .generateBox(size: 0.2), materials: [SimpleMaterial(color: .blue, isMetallic: true)])
        
        //Defino o comportamento de colisao aqui
        self.model.components[gameCollisionComponent.self] = gameCollisionComponent(entityBitMask: .playerEntityBitMask)
        self.model.generateCollisionShapes(recursive: true)
        
        let extractedEntityBitMask = gameCollisionComponent(entityBitMask: .playerEntityBitMask)
        let bitMask = extractedEntityBitMask.entityBitMask
        
        let entityGroup = CollisionGroup(rawValue: bitMask.rawValue)
        
        let entityMask = CollisionGroup.all.subtracting(entityGroup)
        
        self.model.collision = CollisionComponent(shapes: [modelShape], mode: .trigger, filter: .init(group: entityGroup, mask: entityMask))
        
        super.init()
        self.addChild(self.model)
        self.addChild(self.animationRoot)
    }
}
extension PlayerEntity{
    func addBullet(cameraPosition: simd_float4x4){
        print("entrou na funcao")
        let direction = normalize(simd_make_float3(-cameraPosition.columns.2.x, -cameraPosition.columns.2.y, -cameraPosition.columns.2.z))
        var startPosition = simd_make_float3(cameraPosition.columns.3.x, cameraPosition.columns.3.y, cameraPosition.columns.3.z)
        print(startPosition.debugDescription)

        startPosition.y -= 0.1
        
        bullet = BulletEntity(startPosition: startPosition, direction: direction, attackSpeed: 8, damage: 2)
        print(bullet?.startPosition.debugDescription)
        let clone = bullet?.clone(recursive: true)
        self.addChild(clone!)
    }
}
