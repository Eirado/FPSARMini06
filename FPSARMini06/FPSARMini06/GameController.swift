//
//  GameController.swift
//  FPSARMini06
//
//  Created by Gabriel Eirado on 22/07/24.
//

import Foundation
import ARKit
import RealityKit


class GameController: UIViewController{
    
    override func viewDidLoad() {
        
        let arView = ARView(frame: .zero)
        
        arView.automaticallyConfigureSession = false
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection=[.horizontal, .vertical]
        configuration.environmentTexturing = .automatic
        arView.session.run(configuration)
        
        
    }
}
