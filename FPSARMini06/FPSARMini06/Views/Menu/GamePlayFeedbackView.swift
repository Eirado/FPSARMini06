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

struct GamePlayFeedbackView: View {
    @Environment(PageManager.self) var pageManager
    
    var body: some View {
                ZStack {
                    //MARK: Fundo
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray.opacity(0.8))
                        .stroke(Color.black, lineWidth: 2)
                        .frame(height: 715)
                        .padding(.horizontal,4)
                    
                    VStack {
                        Rectangle()
                            .fill(Color.white.opacity(0.8))
                            .stroke(Color.black, lineWidth: 2)
                            .frame(width: 170, height: 170)
                        
                        Text("defeat-title")
                            .font(.system(size: 64, weight: .bold))
                        Text("waveNumber-text")
                            .font(.system(size: 36, weight: .bold))
                        
                        VStack {
                            HStack{
                                Text("bots-title")
                                    .font(.system(size: 24))
                                Spacer()
                                Text("numberOfBots-text")
                                    .font(.system(size: 24))
                            }
                            
                            HStack {
                                Text("health-title")
                                    .font(.system(size: 24))
                                Spacer()
                                Text("health-text")
                                    .font(.system(size: 24))
                            }
                            .padding(.vertical, 12)
                            
                            HStack {
                                Spacer()
                                Text("reward-title")
                                    .font(.system(size: 24, weight: .bold))
                                Spacer()
                                Text("reward-text")
                                    .font(.system(size: 24, weight: .bold))
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
                                Text("playAgain-button")
                                    .font(.system(size: 20, weight: .bold))
                                    .tint(.black)
                            }
                        }
                        
                        Button {
                            pageManager.page = .menu
                        } label: {
                            ZStack {
                                Image("Default")
                                Text("quitGame-button")
                                    .font(.system(size: 20, weight: .bold))
                                    .tint(.black)
                            }
                        }
                    }
                    .padding(.vertical, 20)
                    .frame(height: 715)
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 12)
                .ignoresSafeArea(.all)
            }
        }

#Preview {
    GamePlayFeedbackView()
        .environment(PageManager())
}
