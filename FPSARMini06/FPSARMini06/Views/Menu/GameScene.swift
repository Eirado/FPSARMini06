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
    @State private var carregou: Bool = false
    @State private var timeRemaining: Int = 30
    @State private var timerRunning: Bool = false

    var body: some View {
        ZStack {
            ARViewContainer(carregou: $carregou)
                .overlay {
                    Image("Mira")
                }
            
            if timerRunning {
                Text("Tempo restante: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                    .padding(.top, 50)
            }
        }
        .ignoresSafeArea()
        .onChange(of: carregou) { _, newValue in
            if newValue {
                print("MainScene carregou!")
                startTimer()
            }
        }
    }
    
    func startTimer() {
        timerRunning = true
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timerRunning = false
                timer.invalidate()
                pageManager.page = .feedbackView
            }
        }
    }
}
