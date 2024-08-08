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
        ZStack {
            ARViewContainer()
                .overlay {
                    Image("Mira")
                    VStack{
                        HStack{
                            Spacer()
                            Button(action: {
                                pageManager.page = .pause
                            }, label: {
                                Image(systemName: "pause.circle.fill")
                                    .font(.system(size: 30))
                                    .foregroundStyle(.gray)
                            })
                            .padding(.top, 35)
                            .padding(.horizontal, 15)
                        }
                        Spacer()
                    }
                }
        }
        .ignoresSafeArea()
    }
}

