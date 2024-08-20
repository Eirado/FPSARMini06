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
    @Environment(PageManager.self) var pageManager
    @State var toggleOn: Bool = false
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10.0))
                    .frame(width: UIScreen.main.bounds.width * overlayBoxW, height: UIScreen.main.bounds.height * overlayBoxH)
                
                VStack {
                    HStack {
                        Button {
                            pageManager.page = .gameScene
                        } label: {
                            ZStack{
                                Image("button_nav")
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width * buttonSmallW, height: UIScreen.main.bounds.height * buttonSmallH)
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 28, weight: .bold))
                                    .tint(.white) .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                            }
                        }
//                        Spacer()
                        Text("pauseMenuView-title")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(Color.white)
                            .padding(.trailing, UIScreen.main.bounds.width * buttonSmallW)
                            .minimumScaleFactor(0.5)
                        Spacer()
                        
                    }
                    .padding(.horizontal, 12)
                    
                    Spacer()
                    
                    ComponentePauseMenuBG3(toggleOn: $toggleOn)
                    
                    Spacer()
                    
                    Button {
                        pageManager.page = .gameScene
                    } label: {
                        ZStack{
                            Image("button_default")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width * buttonRegW, height: UIScreen.main.bounds.height * buttonRegH)
                            Text("resumeGame-button")
                                .font(.system(size: 20, weight: .bold))
                                .minimumScaleFactor(0.5).tint(.white) .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        }
                    }
                    
                    Button {
                        pageManager.page = .menu
                    } label: {
                        ZStack{
                            Image("button_default")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width * buttonRegW, height: UIScreen.main.bounds.height * buttonRegH)
                            Text("quitGame-button")
                                .font(.system(size: 20, weight: .bold))
                                .minimumScaleFactor(0.5).tint(.white) .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
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

#Preview {
    struct PauseMenuPreviewContainer: View{
        @State private var toggleOn = false
        
        var body: some View {
            PauseMenuView()
                .environment(PageManager())
        }
    }
    return PauseMenuPreviewContainer()
}
