//
//  GameScene.swift
//  FPSARMini06
//
//  Created by Letícia Malagutti on 23/07/24.
//

/*
 Página que contém o struct que transforma a ARView em uma View em SwiftUI a ser chamada pelo Navigator
 */

import Foundation
import SwiftUI

struct GameScene: View {
    @Environment(PageManager.self) var pageManager
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    
                }
            }
            
            Image("Mira")
            
            ARViewContainer()
        }
        .ignoresSafeArea()
    }
}
