//
//  VisualComponent.swift
//  FPSARMini06
//
//  Created by Gabriel Eirado on 22/07/24.
//

import Foundation
import GameplayKit
import ARKit
import RealityKit

class VisualComponent: GKComponent{
    
    var model: ModelEntity
    
    
    init(mesh: MeshResource, material: [any Material]){
       
        self.model = ModelEntity(mesh: mesh, materials: material)
        
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
