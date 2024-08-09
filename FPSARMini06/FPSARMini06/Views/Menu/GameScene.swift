//
//  GameScene.swift
//  FPSARMini06
//
//  Created by Letícia Malagutti on 23/07/24.
//

import Foundation
import SwiftUI

struct GameScene: View {
    @Environment(PageManager.self) var pageManager
    @StateObject private var gameState = GameState()

    var body: some View {
        ZStack {
            ARViewContainer()
                .onAppear {
                    ARViewManager.shared.resetScene()
                    gameState.timerRunning = true
                    startTimer()
                }
                .overlay {
                    if gameState.carregou {
                        Image("Mira")
                    }
                }
            
            if gameState.timerRunning {
                Text("Tempo restante: \(gameState.timeRemaining)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                    .padding(.top, 50)
            }
        }
        .ignoresSafeArea()
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if gameState.timeRemaining > 0 {
                gameState.timeRemaining -= 1
            } else {
                gameState.timerRunning = false
                timer.invalidate()
                pageManager.page = .feedbackView
            }
        }
    }
}
