//
//  ComponentePauseMenu.swift
//  FPSARMini06
//
//  Created by Letícia Malagutti on 25/07/24.
//
/*
 Página que contém o componente com os itens do menu de pause e seus respectivos controles
 */

import SwiftUI

struct ComponentePauseMenuBG3: View {
    @Binding var toggleOn: Bool
    var body: some View {
        ZStack{
            // MARK: Foreground
            VStack(spacing: 0){
                // TODO: Adicionar componente parte escrita
                ComponentePauseMenuFG(toggleOn: toggleOn, tittle: "sound-text") {
                    print("action")
                }
                ComponentePauseMenuFG(toggleOn: toggleOn, tittle: "music-text") {
                    print("action")
                }
                ComponentePauseMenuFG(toggleOn: toggleOn, tittle: "vibration-text") {
                    print("action")
                }
            }
            .frame(width: UIScreen.main.bounds.width * cBG3W, height: UIScreen.main.bounds.height * cBG3H)
        }
    }
}

struct ComponentePauseMenuBG5: View {
    @Binding var toggleOn: Bool
    var body: some View {
   
            // MARK: Foreground
            VStack(spacing: 0){
                // TODO: Adicionar componente parte escrita
                ComponentePauseMenuFG(toggleOn: toggleOn, tittle: "sound-text") {
                    print("action")
                }
                ComponentePauseMenuFG(toggleOn: toggleOn, tittle: "music-text") {
                    print("action")
                }
                ComponentePauseMenuFG(toggleOn: toggleOn, tittle: "vibration-text") {
                    print("action")
                }
                ComponentePauseMenuFG(toggleOn: toggleOn, tittle: "light-dark") {
                    print("action")
                }
                ComponentePauseMenuFG(toggleOn: toggleOn, tittle: "daltonism-text") {
                    print("action")
                }
            }
           
        }
    }


struct ComponentePauseMenuFG: View {
    @State var toggleOn = false
    
    @State var tittle: LocalizedStringKey
    var action: () -> Void
    var togglePause: LocalizedStringKey = ""
    
    var body: some View {
        VStack {
            HStack{
                Rectangle()
                    .frame(width: 20, height: 20)
                    .padding(.leading).foregroundColor(.white)
//                    .cornerRadius(10.0)
                Text(tittle)
//                    .font(.system(size: 20, weight: .bold))
                    .minimumScaleFactor(0.5).foregroundColor(.white)
    //            Spacer()
                
                Toggle(togglePause, isOn: $toggleOn)
                    .toggleStyle(CustomToggleStyle())
                    .task {
                        if toggleOn{
                            action()
                        }
                    }
                   
//                    .padding(.trailing)
                
            }
            .padding(.vertical, 12.5)
            .padding(.horizontal,5)
            Divider()
                .background(Color.white)
                .frame(maxWidth: .maximum(340, 3))
        }
    }
    
    
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            // Label on the left
            configuration.label
                .font(.headline)
            
            Spacer()
            
            // The toggle switch
            
            Rectangle()
                .frame(width: 90, height: 42)
                .cornerRadius(1.0)
                .foregroundColor(configuration.isOn ? Color("green_dark") : Color("green_opacity"))
                .overlay {
                    HStack {
                        if configuration.isOn {
                            Text("ON")
                                .foregroundColor(.white)
                                .font(.footnote)
                                .padding(2)
                            
                            Spacer()
                        }
                        
                        Rectangle()
                            .frame(width: 40, height: 30)
                            .foregroundColor(Color("green_light"))
                            .cornerRadius(2.0)
                            .padding(configuration.isOn ? .trailing : .leading, 5)
                        
                        if !configuration.isOn {
                            Spacer()
                            Text("OFF")
                                .font(.footnote)
                                .foregroundColor(.white)
                                .padding(2)
                        }
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)){
                        configuration.isOn.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}

#Preview {
    struct BindingViewWxamplePreviewContainer: View{
        @State private var toggleOn = false
        
        var body: some View {
            ComponentePauseMenuBG5(toggleOn: $toggleOn)
        }
    }
    return BindingViewWxamplePreviewContainer()
}
