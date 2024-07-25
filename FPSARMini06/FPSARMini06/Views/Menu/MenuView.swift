//
//  MenuView.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

/*
 Página que contém a view do menu inicial do jogo
 */

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack{
            Color.red
                .opacity(0.5)
                .ignoresSafeArea()
            Text("MENUVIEW")
                .font(.largeTitle)
                .bold()
        }
    }
}

#Preview {
    MenuView()
}
