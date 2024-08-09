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
    @State private var carregou: Bool = false
    @State private var timeRemaining: Int = 5
    @State private var timerRunning: Bool = false
    
    @Environment (\.modelContext)  var context
    @Query private var data:[UserData]
    
    var body: some View {
        ZStack {
            ARViewContainer(carregou: $carregou)
                .overlay {
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
        timerRunning = true
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timerRunning = false
                timer.invalidate()
                updateScore()
                pageManager.page = .feedbackView
            }
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
