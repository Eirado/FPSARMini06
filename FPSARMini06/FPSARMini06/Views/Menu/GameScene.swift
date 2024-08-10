//
//  GameScene.swift
//  FPSARMini06
//
//  Created by Letícia Malagutti on 23/07/24.
//

import Foundation
import SwiftUI
import SwiftData

struct GameScene: View {
    @Environment(PageManager.self) var pageManager
    @StateObject private var gameState = GameState()

    @Environment (\.modelContext)  var context
    @Query private var data:[UserData]
    
    var body: some View {
        ZStack {
            ARViewContainer()
                .onAppear {
                    ARViewManager.shared.resetScene()
                    gameState.timerRunning = true
                    startTimer()
                }
                .overlay {
                    if gameState.timerRunning {
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
    
    func updateScore() {
        if data.first!.score < ScoreController.score{
            data.first?.score = ScoreController.score
            print("score final \(String(describing: data.first?.score))")
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if gameState.timeRemaining > 0 {
                gameState.timeRemaining -= 1
            } else {
                gameState.timerRunning = false
                timer.invalidate()
                updateScore()
                pageManager.page = .feedbackView
            }
        }
    }
}
