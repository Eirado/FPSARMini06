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
    @Binding var toggleOn: Bool
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray.opacity(0.8))
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: UIScreen.main.bounds.width * overlayBoxW, height: UIScreen.main.bounds.height * overlayBoxH)
                
                VStack {
                    HStack {
                        Button {
                            pageManager.page = .gameScene
                        } label: {
                            ZStack {
                                Image("Top Bar")
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width * buttonSmallW, height: UIScreen.main.bounds.height * buttonSmallH)
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 36, weight: .bold))
                                    .tint(.black)
                            }
                        }
                        Spacer()
                        Text("pauseMenuView-title")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(Color.black)
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
                            Image("Default")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width * buttonRegW, height: UIScreen.main.bounds.height * buttonRegH)
                            Text("resumeGame-button")
                                .font(.system(size: 20, weight: .bold))
                                .tint(.black)
                                .minimumScaleFactor(0.5)
                        }
                    }
                    
                    Button {
                        pageManager.page = .menu
                    } label: {
                        ZStack{
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

#Preview {
    struct PauseMenuPreviewContainer: View{
        @State private var toggleOn = false
        
        var body: some View {
            PauseMenuView(toggleOn: $toggleOn)
                .environment(PageManager())
        }
    }
    return PauseMenuPreviewContainer()
}
