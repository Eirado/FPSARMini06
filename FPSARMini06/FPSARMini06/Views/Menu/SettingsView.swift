//
//  SettingsView.swift
//  FPSARMini06
//
//  Created by Letícia Malagutti on 29/07/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(PageManager.self) var pageManager
    @State var toggleOn: Bool = false
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.2)
            
            VStack{
                HStack {
                    Button {
                        pageManager.page = .menu
                    } label: {
                        ZStack {
                            Image("button_nav")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width * buttonSmallW, height: UIScreen.main.bounds.height * buttonSmallH)
                                .overlay{
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 36, weight: .bold))
                                        .tint(.black)
                                }
                        }
                    }
                    
                    Spacer()
                    
                    Text("settingsView-title")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.trailing, UIScreen.main.bounds.width * buttonSmallW)
                        .minimumScaleFactor(0.5)
                    
                    Spacer()
                }
                .padding(.vertical, 50)
                .padding(.horizontal, 12)
                
                Spacer()
                
                ComponentePauseMenuBG5(toggleOn: $toggleOn)
                    .padding(.bottom, 110)
                
                Spacer()
            }
            .padding(.vertical, 20)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    struct SettingsPreviewContainer: View{
        @State private var toggleOn = false
        
        var body: some View {
            SettingsView()
                .environment(PageManager())
        }
    }
    return SettingsPreviewContainer()
}
