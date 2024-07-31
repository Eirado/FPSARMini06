//
//  MenuView.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

/*
 Página que contém a view do menu inicial do jogo
 */

import SwiftUI

struct MenuView: View {
    @Environment(PageManager.self) var pageManager
    @Binding var toggleOn: Bool
    
    var body: some View {
        ZStack{
            //MARK: Fundo
            Color.red.opacity(0.2)
            
            VStack{
                //MARK: Topo
                HStack{
                    Button{
                        pageManager.page = .howToPlay
                    } label: {
                        Image("Top Bar")
                            .overlay{
                                Image(systemName: "questionmark")
                                    .font(.system(size: 36, weight: .bold))
                                    .tint(.black)
                            }
                    }
                    Spacer()
                    Button{
                        pageManager.page = .settings
                    } label: {
                        Image("Top Bar")
                            .overlay{
                                Image(systemName: "gear")
                                    .font(.system(size: 36, weight: .bold))
                                    .tint(.black)
                            }
                    }
                    
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                Button{
                    pageManager.page = .gameScene
                } label: {
                    Image("Default")
                        .overlay{
                            Text("play-button")
                                .font(.system(size: 20, weight: .bold))
                                .tint(.black)
                                .minimumScaleFactor(0.5)
                        }
                }
                
                Button{
                    pageManager.page = .inventory
                } label: {
                    Image("Default")
                        .overlay{
                            Text("inventory-button")
                                .font(.system(size: 20, weight: .bold))
                                .tint(.black)
                                .minimumScaleFactor(0.5)
                        }
                }
            }
            .padding(.vertical, 20)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    struct MenuPreviewContainer: View{
        @State private var toggleOn = false
        
        var body: some View {
            MenuView(toggleOn: $toggleOn)
                .environment(PageManager())
        }
    }
    return MenuPreviewContainer()
}
