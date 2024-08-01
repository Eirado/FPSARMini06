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
        GeometryReader{ geometry in
            ZStack{
                Color.blue.opacity(0.2)
                VStack {
                    HStack {
                        Button(action: {
                            pageManager.page = .menu
                        }, label: {
                            Image("Top Bar")
                                .resizable()
                                .frame(width: geometry.size.width * buttonSmallW, height: geometry.size.height * buttonSmallH)
                                .overlay{
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 36, weight: .bold))
                                        .tint(.black)
                                }
                        })
                        
                        Spacer()
                        
                        Text("howToPlayView-title")
                            .font(.system(size: 20, weight: .bold))
                            .tint(.black)
                            .padding(.trailing, geometry.size.width * buttonSmallW)
                            .minimumScaleFactor(0.5)
                        
                        Spacer()
                    }
                    .padding(.vertical, 50)
                    .padding(.horizontal, 12)
                    
                    Spacer()
                    
                    Text("LoremIpsum")
                        .padding()
                        .minimumScaleFactor(0.5)
                    
                    Spacer()
                    
                    Button(action: {
                        pageManager.page = .gameScene
                    }, label: {
                        Image("Default")
                            .resizable()
                            .frame(width: geometry.size.width * buttonRegW, height: geometry.size.height * buttonRegH)
                            .overlay {
                                Text("ready-button")
                                    .font(.system(size: 20, weight: .bold))
                                    .tint(.black)
                                    .minimumScaleFactor(0.5)
                            }
                    })
                    .padding(.vertical)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    HowToPlayView()
        .environment(PageManager())
}
