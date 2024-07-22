//
//  EnemyEntity.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

import Foundation
import GameplayKit
import RealityKit

class EnemyEntity: GKEntity{
    
    public lazy var visualComponent: VisualComponent = {
        guard let component = component(ofType: VisualComponent.self) else {
            fatalError("VisualComponent not found")
        }
        return component
    }()
    
    var model: ModelEntity{
        return visualComponent.model
    }
    
    override init() {
        super.init()
    
        self.addComponent(VisualComponent(mesh: .generateSphere(radius: 0.5), material: [SimpleMaterial(color: .red, isMetallic: true)]))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
