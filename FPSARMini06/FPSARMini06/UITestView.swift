//
//  UITestView.swift
//  FPSARMini06
//
//  Created by Maria Clara Reis Guimarães on 21/08/24.
//

import SwiftUI

struct UITestView: View {
    
    @StateObject private var gameState = GameState()
    
    
    var body: some View {
            Image("Target")
            VStack {
                Text("Tempo restante: \(gameState.timeRemaining)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                    .padding(.top, 50)
                HStack {
                    Spacer()
                    Button(action: {
//                        pageManager.page = .pause
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
}

#Preview {
    UITestView()
}
