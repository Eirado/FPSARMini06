//
//  AppDelegate.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 19/07/24.
//

import UIKit
import SwiftUI
import SwiftData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    @State var toggleOn: Bool = true
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        CollisionSystem.registerSystem()
        gameCollisionComponent.registerComponent()
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView(toggleOn: $toggleOn)
            .environment(PageManager())
            .modelContainer(for: UserData.self)

        // Use a UIHostingController as window root view controller.
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
    
}
