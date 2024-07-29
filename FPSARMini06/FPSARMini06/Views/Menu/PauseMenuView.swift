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
    @Binding var toggleOn: Bool
    var body: some View {
        ZStack{
            //MARK: Fundo
            RoundedRectangle(cornerRadius: 20)
                .fill(.gray.opacity(0.8))
                .stroke(Color.black, lineWidth: 2)
                .frame(height: 715)
                .padding(.horizontal,4)
            
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
                        .foregroundStyle(Color.black)
                        .padding(.trailing, 56)
                    Spacer()

                }
                .padding(.horizontal, 12)
                
                Spacer()
                
                //MARK: Componentes
                ComponentePauseMenuBG3(toggleOn: $toggleOn)
                
                Spacer()
                
                Button{
                    
                } label: {
                    ZStack{
                        Image("Default")
                        Text("RESUME")
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

//#Preview {
//    PauseMenuView()
//}
#Preview {
    struct PauseMenuPreviewContainer: View{
        @State private var toggleOn = false
        
        var body: some View {
            PauseMenuView(toggleOn: $toggleOn)
        }
    }
    return PauseMenuPreviewContainer()
}