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
            // MARK: Background
            RoundedRectangle(cornerRadius: 8)
                .fill(.gray.opacity(0.8))
                .stroke(Color.black, lineWidth: 2)
                .frame(width: UIScreen.main.bounds.width * cBG3W, height: UIScreen.main.bounds.height * cBG3H)
            Rectangle()
                .fill(.white.opacity(0.5))
                .frame(width: (UIScreen.main.bounds.width * cBG3W) - 2, height: UIScreen.main.bounds.height * (cBG3H/3)) // width - 2 por conta do lineWidth e height/3 já que queremos somente a altura de uma das linhas
            
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
                    let generator = UIImpactFeedbackGenerator(style: .rigid)
                    generator.impactOccurred()
                    settingsPersistence.defaults.set(toggleOn, forKey: "vibration")
                }
            }
            .frame(width: UIScreen.main.bounds.width * cBG3W, height: UIScreen.main.bounds.height * cBG3H)
        }
    }
}

struct ComponentePauseMenuBG5: View {
    @Binding var toggleOn: Bool
    let defaults = UserDefaults.standard
    
    var body: some View {
        ZStack{
            // MARK: Background
            RoundedRectangle(cornerRadius: 8)
                .fill(.gray.opacity(0.8))
                .stroke(Color.black, lineWidth: 2)
                .frame(width: UIScreen.main.bounds.width * cBG5W, height: UIScreen.main.bounds.height * cBG5H)
            VStack{
                Rectangle()
                    .fill(.white.opacity(0.5))
                    .frame(width: (UIScreen.main.bounds.width * cBG5W) - 2, height: UIScreen.main.bounds.height * (cBG5H/5)) // width - 2 por conta do lineWidth e height/5 já que queremos somente a altura de uma das linhas
                Spacer()
                Rectangle()
                    .fill(.white.opacity(0.5))
                    .frame(width: (UIScreen.main.bounds.width * cBG5W) - 2, height: UIScreen.main.bounds.height * (cBG5H/5)) // width - 2 por conta do lineWidth e height/5 já que queremos somente a altura de uma das linhas
            }
            .frame(height:  UIScreen.main.bounds.height * cBG3H)
            // MARK: Foreground
            VStack(spacing: 0){
                // TODO: Adicionar componente parte escrita
                ComponentePauseMenuFG(toggleOn: toggleOn, tittle: "sound-text") {
                    print("action")
                }
                ComponentePauseMenuFG(toggleOn: toggleOn, tittle: "music-text") {
                    print("action")
                }
                
                ComponentePauseMenuFG(toggleOn: defaults.bool(forKey: "vibration"), tittle: "vibration-text") {
                    if toggleOn{
                        let generator = UIImpactFeedbackGenerator(style: .rigid)
                        generator.impactOccurred()
                    }
                    settingsPersistence.defaults.set(toggleOn, forKey: "vibration")
                    toggleOn.toggle()
                }
                
                ComponentePauseMenuFG(toggleOn: toggleOn, tittle: "light-dark") {
                    print("action")
                }
                ComponentePauseMenuFG(toggleOn: toggleOn, tittle: "daltonism-text") {
                    print("action")
                }
            }
            .frame(width: UIScreen.main.bounds.width * cBG5W, height: UIScreen.main.bounds.height * cBG5H)
        }
    }
}

struct ComponentePauseMenuFG: View {
    @State var toggleOn:Bool
    
    @State var tittle: LocalizedStringKey
    var action: () -> Void
    var togglePause: LocalizedStringKey = ""
    
    var body: some View {
        HStack{
            Rectangle()
                .frame(width: 30, height: 30)
                .padding(.leading)
            Text(tittle)
                .font(.system(size: 18, weight: .bold))
                .minimumScaleFactor(0.5)
                .foregroundStyle(.white)
            Spacer()
            //            Text("on-text")
            //                .font(.system(size: 18))
            //                .minimumScaleFactor(0.5)
            
            Toggle(togglePause, isOn: $toggleOn)
                .toggleStyle(CustomToggleStyle(toggleOn: $toggleOn))
                .padding(.trailing)
                .onChange(of: toggleOn, {
                    action()
                })
            
        }
        .padding(.vertical, 12.5)
    }
    
    
}

struct CustomToggleStyle: ToggleStyle {
    @Binding var toggleOn:Bool
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            // Label on the left
            configuration.label
                .font(.headline)
                .foregroundColor(.white)
            
            Spacer()
            
            // The toggle switch
            
            Rectangle()
                .frame(width: 80, height: 25)
                .foregroundColor(configuration.isOn ? Color.orange : Color.gray)
                .overlay {
                    HStack {
                        if configuration.isOn {
                            Text("on")
                                .foregroundStyle(.white)
                                .padding(2)
                            Spacer()
                        }
                        
                        Rectangle()
                            .frame(width: 40, height: 20)
                            .foregroundColor(.white)
                            .padding(configuration.isOn ? .trailing : .leading, 5)
                        
                        if !configuration.isOn {
                            Spacer()
                            Text("off")
                                .foregroundStyle(.white)
                                .padding(2)
                        }
                    }
                }.onAppear(perform: {
                    configuration.isOn = toggleOn
                })
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
