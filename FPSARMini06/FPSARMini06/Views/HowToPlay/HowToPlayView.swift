//
//  HowToPlayView.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 29/07/24.
//

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    print("voltou")
                }, label: {
                    Image("Backbutton")
                })
                
                Spacer()
                
                Text("How to play")
                
                Spacer()
            }
            
            Spacer()
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dignissim efficitur odio, sed auctor ipsum interdum at. Aenean tortor nisi, molestie condimentum venenatis quis, dapibus a velit. Ut eu ante ut libero molestie aliquet vel a velit. Integer sed luctus libero, vestibulum tempus sem.")
            
            Spacer()
            
            Button(action: {
                print("apertou")
            }, label: {
                Image("ImReadybutton")
                    .overlay {
                        Text("I'M READY")
                    }
            })
        }
        .padding()
    }
}

#Preview {
    HowToPlayView()
}
