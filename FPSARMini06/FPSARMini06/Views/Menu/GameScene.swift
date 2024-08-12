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
    @State private var carregou: Bool = false
    @State private var timeRemaining: Int = 5
    @State private var timerRunning: Bool = false
    
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
                    if gameState.carregou {
                        Image("Mira")
                        Image("Target")
                        VStack{
                            HStack{
                                Spacer()
                                Button(action: {
                                    //adicionar açoes do pause
                                    //pageManager.page = .pause
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
    }
    func updateScore(){
        
        if data.first!.score < ScoreController.score{
            data.first?.score = ScoreController.score
            print("score final \(String(describing: data.first?.score))")
            do{
                try context.save()
            }catch{
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

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("Loading...")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(1.5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.8))
        .edgesIgnoringSafeArea(.all)
    }
}
