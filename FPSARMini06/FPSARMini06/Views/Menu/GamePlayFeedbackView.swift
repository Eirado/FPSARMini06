//
//  GamePlayFeedbackView.swift
//  FPSARMini06
//
//  Created by Letícia Malagutti on 26/07/24.
//
/*
 Página que contém a view do menu de feedback do jogo
 */

import SwiftUI
import SwiftData

struct GamePlayFeedbackView: View {
    @Environment(PageManager.self) var pageManager
    @Environment (\.modelContext)  var context
    @Query private var data:[UserData]
    
    var body: some View {
        ZStack {
        
            RoundedRectangle(cornerRadius: 20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10.0))
                .frame(width: UIScreen.main.bounds.width * overlayBoxW, height: UIScreen.main.bounds.height * overlayBoxH)
            
            VStack {
                Image("defeat icon")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * caveiraDerrotaW, height: UIScreen.main.bounds.height * caveiraDerrotaH).shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                
                Text("defeat-title")
                    .font(.system(size: 48, weight: .bold))
                    .minimumScaleFactor(0.5)
                    .foregroundStyle(.white)
                Text("waveNumber-text")
                    .font(.system(size: 28, weight: .bold))
                    .minimumScaleFactor(0.5)
                    .foregroundStyle(.white)
                
                VStack {
                    VStack{
                        HStack{
                            Text("bots-title") .foregroundStyle(.white)
                                .font(.system(size: 24))
                                .minimumScaleFactor(0.5)
                            Spacer()
                            Text("numberOfBots-text") .foregroundStyle(.white)
                                .font(.system(size: 24))
                                .minimumScaleFactor(0.5)
                        }
                        
                        HStack {
                            Text("health-title") .foregroundStyle(.white)
                                .font(.system(size: 24))
                                .minimumScaleFactor(0.5)
                            Spacer()
                            Text("health-text") .foregroundStyle(.white)
                                .font(.system(size: 24))
                                .minimumScaleFactor(0.5)
                        }
                    }
                    .padding(.bottom, 12)
                    
                    HStack {
                        Spacer()
                        Text("reward-title") .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .bold))
                            .minimumScaleFactor(0.5)
                        Spacer()
                        Text("reward-text")
                            .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .bold))
                            .minimumScaleFactor(0.5)
                        Spacer()
                    }
                }
                .padding(.horizontal, 48)
                .padding(.vertical)
                
                Spacer()
                
                Button {
                    
                    pageManager.page = .gameScene
                    
                } label: {
                    ZStack {
                        Image("button_defeatView")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * buttonRegW, height: UIScreen.main.bounds.height * buttonRegH)
                        Text("playAgain-button")
                            .font(.system(size: 20, weight: .bold))
                            .tint(.white)
                            .minimumScaleFactor(0.5)
                    }
                }
                
                Button {
                    pageManager.page = .menu
                } label: {
                    ZStack {
                        Image("button_defeatView")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * buttonRegW, height: UIScreen.main.bounds.height * buttonRegH)
                        Text("quitGame-button")
                            .font(.system(size: 20, weight: .bold))
                            .tint(.white)
                            .minimumScaleFactor(0.5)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    }
                }
            }
            .padding(.vertical, 20)
            .frame(height: UIScreen.main.bounds.height * overlayBoxH)
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 12)
    }
}


extension GamePlayFeedbackView{
    func updateScore(){
        
        let score = 0
        
        data.first?.score = score
        
        
        do{
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
    }
}

#Preview {
    GamePlayFeedbackView()
        .environment(PageManager())
}
