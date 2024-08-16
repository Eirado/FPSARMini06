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
    @StateObject var timerManager = TimerManager()
    @State var pause:Bool = false
    
    var body: some View {
        ZStack {
            ARViewContainer()
                .onAppear {
                    ARViewManager.shared.resetScene()
                    timerManager.startTimer()

                }
                .overlay {
                    if timerManager.timerRunning {
                        TimerHud(timerManager: timerManager, pause: $pause)
                        
                    }else if timerManager.timeRemaining == 0{
                        Text("fim").onAppear {
                            pageManager.page = .feedbackView
                        }
                        
                    }
                    if pause{
                        PauseMenuView(timerManager: timerManager, pause: $pause)
                    }
                }
                .ignoresSafeArea()
        }
        
        
        
        
        //    func startTimer() {
        //        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
        //            if gameState.timeRemaining > 0 {
        //                gameState.timeRemaining -= 1
        //            } else {
        //                gameState.timerRunning = false
        //                timer.invalidate()
        //                updateScore()
        //                pageManager.page = .feedbackView
        //            }
        //
        //        }
        //    }
    }
}
struct TimerHud:View {
    @StateObject var timerManager : TimerManager
    @Binding var pause:Bool
    var body: some View {
        Image("Target")
        VStack {
            Text("Tempo restante: \(timerManager.timeRemaining)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.7))
                .cornerRadius(10)
                .padding(.top, 50)
            HStack {
                Spacer()
                Button(action: {
                    timerManager.pauseTimer()
                    self.pause = true
                    //                                    pageManager.page = .pause
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

struct hudArView:View{
    
    var body: some View{
        ZStack{
            ZStack{
                Rectangle()
                    .fill(Color.white.opacity(0.2)) // Ajuste a opacidade para criar o efeito fosco
                    .background(
                        Color.black.opacity(0.1) // Fundo adicional para criar mais profundidade
                    )
                    .blur(radius: 10) // Desfoque para suavizar
                    .frame(width: 150, height: 150) // Tamanho do quadrado
                    .cornerRadius(10) // Borda arredondada opcional
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1) // Borda externa sutil
                    )
                
                
                
            }
            Spacer()
            
            
        }
    }
}


