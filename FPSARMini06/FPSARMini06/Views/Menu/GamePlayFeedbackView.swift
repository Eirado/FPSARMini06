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
    var body: some View {
                ZStack{
                    //MARK: Fundo
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray.opacity(0.8))
                        .stroke(Color.black, lineWidth: 2)
                        .frame(height: 715)
                        .padding(.horizontal,4)
                    
                    VStack{
                        Rectangle()
                            .fill(Color.white.opacity(0.8))
                            .stroke(Color.black, lineWidth: 2)
                            .frame(width: 170, height: 170)
                        
                        Text("DEFEAT")
                            .font(.system(size: 64, weight: .bold))
                        Text("Wave Number")
                            .font(.system(size: 36, weight: .bold))
                        
                        VStack{
                            HStack{
                                Text("BOTS")
                                    .font(.system(size: 24))
                                Spacer()
                                Text("XXXX")
                                    .font(.system(size: 24))
                            }
                            
                            HStack{
                                Text("HEALTH")
                                    .font(.system(size: 24))
                                Spacer()
                                Text("XXXX")
                                    .font(.system(size: 24))
                            }
                            .padding(.vertical, 12)
                            
                            HStack{
                                Spacer()
                                Text("REWARD")
                                    .font(.system(size: 24, weight: .bold))
                                Spacer()
                                Text("XXXX")
                                    .font(.system(size: 24, weight: .bold))
                                Spacer()
                            }
                        }
                        .padding(.horizontal, 48)
                        .padding(.vertical)
                        
                        Spacer()
                        
                        //MARK: Componentes
                        Button{
                            
                        } label: {
                            ZStack{
                                Image("Default")
                                Text("PLAY AGAIN")
                                    .font(.system(size: 20, weight: .bold))
                                    .tint(.black)
                            }
                        }
                        
                        Button{
                            
                        } label: {
                            ZStack{
                                Image("Default")
                                Text("QUIT GAME")
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
}
