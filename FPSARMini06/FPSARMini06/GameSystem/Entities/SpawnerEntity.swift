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
    }
}
    
   
 
