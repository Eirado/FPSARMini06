//
//  SettingsView.swift
//  FPSARMini06
//
//  Created by Letícia Malagutti on 29/07/24.
//

import SwiftUI

struct SettingsView: View {
    @Binding var toggleOn: Bool
    var body: some View {
        ZStack{
            //MARK: Fundo
            Color.green.opacity(0.2)
            
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
                    
                    Text("SETTINGS")
                        .font(.system(size: 20, weight: .bold))
                        .tint(.black)
                        .padding(.trailing, 56)
                    
                    Spacer()
                }
                .padding(.vertical, 50)
                .padding(.horizontal, 12)
                
                Spacer()
                
                ComponentePauseMenuBG5(toggleOn: $toggleOn)
                    .padding(.bottom, 104)
                
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
            SettingsView(toggleOn: $toggleOn)
        }
    }
    return SettingsPreviewContainer()
}
