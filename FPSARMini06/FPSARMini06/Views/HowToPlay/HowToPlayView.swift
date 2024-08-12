//
//  HowToPlayView.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 29/07/24.
//

import SwiftUI

struct HowToPlayView: View {
    @Environment(PageManager.self) var pageManager
    
    var body: some View {
        ZStack {
            Image("Background Gradient")
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack {
                HStack {
                    Button(action: {
                        pageManager.page = .menu
                    }, label: {
                        Image("button_nav")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * buttonSmallW, height: UIScreen.main.bounds.height * buttonSmallH)
                            .overlay{
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 36, weight: .bold))
                                    .tint(.white)
                            }
                    })
                                        
                    Text("howToPlayView-title")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.trailing, UIScreen.main.bounds.width * buttonSmallW)
                        .minimumScaleFactor(0.5)
                    
                    Spacer()
                }
                .padding(.vertical, 50)
                .padding(.horizontal, 12)
                
                Spacer()
                
                Text("LoremIpsum")
                    .padding()
                    .minimumScaleFactor(0.5)
                    .foregroundStyle(.white)

                Spacer()
                
                Button(action: {
                    pageManager.page = .gameScene
                }, label: {
                    Image("button_default")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * buttonRegW, height: UIScreen.main.bounds.height * buttonRegH)
                        .overlay {
                            Text("ready-button")
                                .font(.system(size: 20, weight: .bold))
                                .tint(.white)
                                .minimumScaleFactor(0.5)
                        }
                })
                .padding(.vertical)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .ignoresSafeArea()
    }
}

//#Preview {
//    HowToPlayView()
//        .environment(PageManager())
//}
