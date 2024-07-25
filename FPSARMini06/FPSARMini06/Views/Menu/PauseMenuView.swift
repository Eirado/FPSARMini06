//
//  PauseMenuView.swift
//  FPSARMini06
//
//  Created by Letícia Malagutti on 25/07/24.
//

/*
 Página que contém a view do menu de pause do jogo
 */

import SwiftUI

struct PauseMenuView: View {
    var body: some View {
        ZStack{
            //MARK: Fundo
            RoundedRectangle(cornerRadius: 20)
                .fill(.gray.opacity(0.8))
                .stroke(Color.black, lineWidth: 2)
                .frame(height: 715)
            
            VStack{
                //MARK: Topo
                HStack{
                    Button{
                        
                    } label: {
                        ZStack{
                            Image("Top Bar")
                            Image(systemName: "chevron.left")
                                .font(.system(size: 36, weight: .bold))
                                .tint(.black)
                        }
                    }
                    Spacer()
                    Text("PAUSE")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(Color.gray.opacity(0.8))
                        .padding(.trailing, 56)
                    Spacer()

                }
                .padding(.horizontal, 12)
                
                //MARK: Componentes
                
                Spacer()
            }
            .padding(.vertical)
            .frame(height: 715)
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 12)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    PauseMenuView()
}
