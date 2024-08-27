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
                        
                        ///    -----------    -HUD ANTIGA
                        //        Image("Target")
                        //                        VStack {
                        //                            Text("Tempo restante: \(gameState.timeRemaining)")
                        //                                .font(.largeTitle)
                        //                                .foregroundColor(.white)
                        //                                .padding()
                        //                                .background(Color.black.opacity(0.7))
                        //                                .cornerRadius(10)
                        //                                .padding(.top, 50)
                        //                            HStack {
                        //                                Spacer()
                        //                                Button(action: {
                        //                                    pageManager.page = .pause
                        //                                }, label: {
                        //                                    Image(systemName: "pause.circle.fill")
                        //                                        .font(.system(size: 30))
                        //                                        .foregroundStyle(.gray)
                        //                                })
                        //                                .padding(.top, 35)
                        //                                .padding(.horizontal, 15)
                        //                            }
                        //                            Spacer()
                        //                        }
                        
                        ///    ------------ HUD ANTIGA
                        
                        Image("Target")
                            .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 5)
                        
                        VStack(alignment: .leading) {
                            //HUD Game Scene
                            HStack(alignment: .top) {
                                VStack {
                                    //Bullet Feedback
                                    HStack {
                                        Image("bullet_HUD")
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                            .overlay {
                                                Image("bullet")
                                                    .resizable()
                                                    .frame(width: 35,height: 35)
                                            }
                                        
                                        RoundedRectangle(cornerRadius: 2.0)
                                            .fill(Color("orange_dark"))
                                            .stroke(Color.orange, lineWidth: 2)
                                            .frame(width: 140,height: 35)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 2.0)
                                                    .fill(
                                                        LinearGradient(
                                                            gradient: Gradient(colors: [Color("orange_medium"), Color("orange_light")]),
                                                            startPoint: .leading,
                                                            endPoint: .trailing
                                                        ))
                                                    .stroke(Color.orange, lineWidth: 2)
                                                    .frame(width: 140,height: 35)
                                            }
                                        Spacer()
                                    }
                                    //Health Feedback
                                    
                                    HStack {
                                        Image("health_HUD")
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                            .overlay {
                                                Image("health")
                                                    .resizable()
                                                    .frame(width: 25,height: 25)
                                            }
                                        // Health Status
                                        RoundedRectangle(cornerRadius: 2.0)
                                            .fill(.red.opacity(0.3))
                                            .stroke(Color("blue_dark"), lineWidth: 2)
                                            .frame(width: 140,height: 35)
                                            .overlay{
                                                RoundedRectangle(cornerRadius: 2.0)
                                                    .fill(Color("blue_dark"))
                                                    .stroke(Color("blue_light"), lineWidth: 2)
                                                    .frame(width: 140,height: 35)
                                            }
                                        Spacer()
                                    }
                                    
                                }
                                
                                // Timer
                                Image("timer")
                                    .resizable()
                                    .frame(width: 100,height: 60)
                                    .overlay{
                                        Text("\(gameState.timeRemaining)")
                                            .font(.largeTitle).bold().italic()
                                            .foregroundColor(.white)
                                        
                                    }.padding()
                                
                            }
                            
                            
                            HStack {
                                
                                //PAUSE BUTTON
                                Button(action: {
                                    pageManager.page = .pause
                                }, label: {
                                    
                                    Image("button_nav")
                                        .resizable()
                                        .opacity(0.75)
                                        .frame(width: 50, height: 50)
                                        .overlay {
                                            Image(systemName: "pause")
                                                .font(.system(size: 28, weight: .bold))
                                                .tint(.white) .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                                        }
                                })
                                .padding(.top, 35)
                                .padding(.horizontal, 15)
                            }
                            Spacer()
                        }.padding(.vertical, 32)
                        
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
            } else {
                gameState.timerRunning = false
                timer.invalidate()
                updateScore()
                pageManager.page = .feedbackView
            }
        }
    }
}
