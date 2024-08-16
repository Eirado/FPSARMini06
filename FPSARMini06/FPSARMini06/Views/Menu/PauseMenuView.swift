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
    @StateObject var timerManager: TimerManager
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray.opacity(0.8))
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: UIScreen.main.bounds.width * overlayBoxW, height: UIScreen.main.bounds.height * overlayBoxH)
                
                VStack {
                    HStack {
                        Button {
                            timerManager.resumeTimer()
                            settingsPersistence.pauseGame = false
                        } label: {
                            ZStack{
                                Image("button_nav")
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
                            .foregroundStyle(.white)
                            .padding(.trailing, UIScreen.main.bounds.width * buttonSmallW)
                            .minimumScaleFactor(0.5)
                        Spacer()
                        
                    }
                    .padding(.horizontal, 12)
                    
                    Spacer()
                    
                    ComponentePauseMenuBG3(toggleOn: $toggleOn)
                    
                    Spacer()
                    
                    Button {
                        timerManager.resumeTimer()
                        settingsPersistence.pauseGame = false
                    } label: {
                        ZStack{
                            Image("button_default")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width * buttonRegW, height: UIScreen.main.bounds.height * buttonRegH)
                            Text("resumeGame-button")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundStyle(.white)
                                .minimumScaleFactor(0.5)
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
                                .foregroundStyle(.white)
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

//#Preview {
//    struct PauseMenuPreviewContainer: View{
//        @State private var toggleOn = false
//        
//        var body: some View {
//            PauseMenuView( pause: .constant(true), timerManager: <#TimerManager#>)
//                .environment(PageManager())
//        }
//    }
//    return PauseMenuPreviewContainer()
//}
