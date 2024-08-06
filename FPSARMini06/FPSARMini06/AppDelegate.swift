//
//  AppDelegate.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 19/07/24.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    @State var toggleOn: Bool = true
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        CollisionSystem.registerSystem()
       
        GameCollisionComponent.registerComponent()
        
        MotionComponent.registerComponent()
        
        MotionSystem.registerSystem()
        
        HealthComponent.registerComponent()
        
        HealthSystem.registerSystem()
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView(toggleOn: $toggleOn)
            .environment(PageManager())
        
        // Use a UIHostingController as window root view controller.
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
}

