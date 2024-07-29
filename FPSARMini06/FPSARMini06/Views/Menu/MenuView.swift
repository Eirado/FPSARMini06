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
        ZStack {
            //MARK: Fundo
            Color.red.opacity(0.2)
            
            VStack {
                //MARK: Topo
                HStack {
                    Button {
                        pageManager.page = .howToPlay
                    } label: {
                        ZStack {
                            Image("Top Bar")
                            Image(systemName: "questionmark")
                                .font(.system(size: 36, weight: .bold))
                                .tint(.black)
                        }
                    }
                    Spacer()
                    Button{
                        pageManager.page = .settings
                    } label: {
                        ZStack {
                            Image("Top Bar")
                            Image(systemName: "gear")
                                .font(.system(size: 36, weight: .bold))
                                .tint(.black)
                        }
                    }
                    
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                Button {
                    pageManager.page = .gameScene
                } label: {
                    ZStack {
                        Image("Default")
                        Text("PLAY")
                            .font(.system(size: 20, weight: .bold))
                            .tint(.black)
                    }
                }
                
                Button {
                    pageManager.page = .inventory
                } label: {
                    ZStack {
                        Image("Default")
                        Text("INVENTORY")
                            .font(.system(size: 20, weight: .bold))
                            .tint(.black)
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

#Preview {
struct ContentViewPreviewContainer: View{
    @State private var toggleOn = false
    
    var body: some View {
        ContentView(toggleOn: $toggleOn)
            .environment(PageManager())
    }
}
return ContentViewPreviewContainer()
}
