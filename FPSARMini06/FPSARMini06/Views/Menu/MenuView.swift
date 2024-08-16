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
import SwiftData

struct MenuView: View {
    @Environment(PageManager.self) var pageManager
    @State var toggleOn: Bool = false
    
    var body: some View {
        ZStack {
            Image("Background Gradient")

                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack {
                HStack {
                    Button {
                        pageManager.page = .howToPlay
                    } label: {
                        Image("button_nav")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * buttonSmallW, height: UIScreen.main.bounds.height * buttonSmallH)
                            .overlay {
                                Image(systemName: "questionmark")
                                    .font(.system(size: 36, weight: .bold))
                                    .tint(.white)
                            }
                    }
                    Spacer()
                    Button {
                        pageManager.page = .settings
                    } label: {
                        Image("button_nav")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * buttonSmallW, height: UIScreen.main.bounds.height * buttonSmallH)
                            .overlay {
                                Image(systemName: "gear")
                                    .font(.system(size: 36, weight: .bold))
                                    .tint(.white)
                            }
                    }
                }
                .padding(20)
                
                Spacer()
                
                Button {
                    pageManager.page = .gameScene
                } label: {
                    Image("button_play")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * buttonBigW, height: UIScreen.main.bounds.height * buttonBigH)
                        .overlay {
                            Text("play-button")
                                .font(.system(size: 20, weight: .bold))
                                .tint(.black)
                                .minimumScaleFactor(0.5)
                        }
                }
                
                Button {
                    pageManager.page = .inventory
                } label: {
                    Image("button_default")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * buttonRegW, height: UIScreen.main.bounds.height * buttonRegH)
                        .overlay {
                            Text("inventory-button")
                                .font(.system(size: 20, weight: .bold))
                                .tint(.white)
                                .minimumScaleFactor(0.5)
                        }
                }
            }
            .padding(.vertical, 20)
        }
        .ignoresSafeArea(.all)
        
    }
}

//#Preview {
//    struct MenuPreviewContainer: View{
//        @State private var toggleOn = false
//        
//        var body: some View {
//            MenuView()
//                .environment(PageManager())
//        }
//    }
//    return MenuPreviewContainer()
//}
