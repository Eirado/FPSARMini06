//
//  SpawnerEntity.swift
//  FPSARMini06
//
//  Created by Gabriel Eirado on 01/08/24.
//


import RealityKit


class SpawnerEntity: Entity{
    
    required init() {
        super.init()
        
        self.components[SpawnerComponent.self] = SpawnerComponent()
        
//        self.components[ModelComponent.self] = ModelComponent(mesh: .generateSphere(radius: 0.1), materials: [SimpleMaterial(color: .black, isMetallic: true)])
//        
        
    }
}
    
   
 
