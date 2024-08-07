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
    @Environment (\.modelContext) private var context
    @Query private var data:[UserData]
    var body: some View {
        ZStack {
            //MARK: Fundo
            RoundedRectangle(cornerRadius: 20)
                .fill(.gray.opacity(0.8))
                .stroke(Color.black, lineWidth: 2)
                .frame(width: UIScreen.main.bounds.width * overlayBoxW, height: UIScreen.main.bounds.height * overlayBoxH)
            
            VStack {
                Rectangle()
                    .fill(Color.white.opacity(0.8))
                    .stroke(Color.black, lineWidth: 2)
                //                            .resizable()
                    .frame(width: UIScreen.main.bounds.width * caveiraDerrotaW, height: UIScreen.main.bounds.height * caveiraDerrotaH)
                
                Text("defeat-title")
                    .font(.system(size: 64, weight: .bold))
                    .minimumScaleFactor(0.5)
                Text("waveNumber-text")
                    .font(.system(size: 36, weight: .bold))
                    .minimumScaleFactor(0.5)
                
                VStack {
                    VStack{
                        HStack{
                            Text("bots-title")
                                .font(.system(size: 24))
                                .minimumScaleFactor(0.5)
                            Spacer()
                            Text("numberOfBots-text")
                                .font(.system(size: 24))
                                .minimumScaleFactor(0.5)
                        }
                        
                        HStack {
                            Text("health-title")
                                .font(.system(size: 24))
                                .minimumScaleFactor(0.5)
                            Spacer()
                            Text("health-text")
                                .font(.system(size: 24))
                                .minimumScaleFactor(0.5)
                        }
                    }
                    .padding(.bottom, 12)
                    
                    HStack {
                        Spacer()
                        Text("reward-title")
                            .font(.system(size: 24, weight: .bold))
                            .minimumScaleFactor(0.5)
                        Spacer()
                        Text("reward-text")
                            .font(.system(size: 24, weight: .bold))
                            .minimumScaleFactor(0.5)
                        Spacer()
                    }
                }
                .padding(.horizontal, 48)
                .padding(.vertical)
                
                Spacer()
                
                //MARK: Componentes
                Button {
                    pageManager.page = .gameScene
                } label: {
                    ZStack {
                        Image("Default")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * buttonRegW, height: UIScreen.main.bounds.height * buttonRegH)
                        Text("playAgain-button")
                            .font(.system(size: 20, weight: .bold))
                            .tint(.black)
                            .minimumScaleFactor(0.5)
                    }
                }
                
                Button {
                    pageManager.page = .menu
                } label: {
                    ZStack {
                        Image("Default")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * buttonRegW, height: UIScreen.main.bounds.height * buttonRegH)
                        Text("quitGame-button")
                            .font(.system(size: 20, weight: .bold))
                            .tint(.black)
                            .minimumScaleFactor(0.5)
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
    func updateScore(score:Int, item:UserData){
        item.score = score
        do{
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    func fetchData(){
        if data.isEmpty{
            let data = UserData(score: 0, longestWave: 0, coins: 0, box_itens_ID: [])
            context.insert(data)
        }
    }
}

#Preview {
    GamePlayFeedbackView()
        .environment(PageManager())
}
