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
                .frame(width: 355, height: 186)
            Rectangle()
                .fill(.white.opacity(0.5))
                .frame(width: 353, height: 62)
            
            // MARK: Foreground
            VStack{
                // TODO: Adicionar componente parte escrita
                ComponentePauseMenuFG(toggleOn: toggleOn)
                ComponentePauseMenuFG(toggleOn: toggleOn)
                ComponentePauseMenuFG(toggleOn: toggleOn)
            }
            .frame(width: 355, height: 186)
            .padding()
        }
    }
}

struct ComponentePauseMenuBG5: View {
    @Binding var toggleOn: Bool
    var body: some View {
        ZStack{
            // MARK: Background
            RoundedRectangle(cornerRadius: 8)
                .fill(.gray.opacity(0.8))
                .stroke(Color.black, lineWidth: 2)
                .frame(width: 355, height: 310)
            VStack{
                Rectangle()
                    .fill(.white.opacity(0.5))
                    .frame(width: 353, height: 62)
                Spacer()
                Rectangle()
                    .fill(.white.opacity(0.5))
                    .frame(width: 353, height: 62)
            }
            .frame(height: 186)
            // MARK: Foreground
            VStack{
                // TODO: Adicionar componente parte escrita
                ComponentePauseMenuFG(toggleOn: toggleOn)
                ComponentePauseMenuFG(toggleOn: toggleOn)
                ComponentePauseMenuFG(toggleOn: toggleOn)
                ComponentePauseMenuFG(toggleOn: toggleOn)
                ComponentePauseMenuFG(toggleOn: toggleOn)
            }
            .frame(width: 355, height: 186)
            .padding()
        }
    }
}

struct ComponentePauseMenuFG: View {
    @State var toggleOn = false
    
    var togglePause: LocalizedStringKey = ""
    
    var body: some View {
        ZStack{
//            RoundedRectangle(cornerRadius: 8)
//                .fill(.red.opacity(0.5))
            HStack{
                Rectangle()
                    .frame(width: 30, height: 30)
                    .padding(.leading)
                Text("Sound")
                    .font(.system(size: 18, weight: .bold))
                Spacer()
                Text("ON")
                    .font(.system(size: 18))
                Toggle(togglePause, isOn: $toggleOn)
                    .padding(.trailing)
            }
        }
        .frame(width: 353, height: 54)
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
