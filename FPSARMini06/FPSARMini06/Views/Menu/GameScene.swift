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
                    //                    ARViewManager.shared.resetScene()
                    gameState.timerRunning = true
                    startTimer()
                }
                .overlay {
                    if gameState.timerRunning {
                        

                        
                        Image("Target")
                            .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 5)
   
                        ComponentHUDView(timer: $gameState.timeRemaining)
                        
                    }
                }
                .ignoresSafeArea()
                .statusBar(hidden: true)
            
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
                print("\(gameState.timeRemaining)")
            } else {
                gameState.timerRunning = false
                timer.invalidate()
                updateScore()
                pageManager.page = .feedbackView
            }
        }
    }
}
