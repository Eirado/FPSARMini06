//
//  AppDelegate.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 19/07/24.
//

import UIKit
import SwiftUI
import SwiftData

class GameState: ObservableObject {
    @Published var timeRemaining: Int = 5
    @Published var timerRunning: Bool = false
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        CollisionSystem.registerSystem()
       
        GameCollisionComponent.registerComponent()
        
        MotionComponent.registerComponent()
        
        AttackComponent.registerComponent()
        
        PlayerComponent.registerComponent()
        
        MotionSystem.registerSystem()
        
        HealthComponent.registerComponent()
        
        HealthSystem.registerSystem()
        
        AttackSystem.registerSystem()
        
        PlayerSystem.registerSystem()
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
            .environment(PageManager())
            .environmentObject(GameState())
            .modelContainer(for: UserData.self)

        // Use a UIHostingController as window root view controller.
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
}

