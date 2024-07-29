//
//  HowToPlayView.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 29/07/24.
//

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        ZStack{
            Color.blue.opacity(0.2)
            VStack {
                HStack {
                    Button(action: {
                        print("voltou") // Entra aqui a lógica
                    }, label: {
                        Image("Top Bar")
                            .overlay{
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 36, weight: .bold))
                                    .tint(.black)
                            }
                    })
                    
                    Spacer()
                    
                    Text("HOW TO PLAY")
                        .font(.system(size: 20, weight: .bold))
                        .tint(.black)
                    
                    Spacer()
                }
                .padding(.vertical, 50)
                .padding(.horizontal, 12)
                
                Spacer()
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dignissim efficitur odio, sed auctor ipsum interdum at. Aenean tortor nisi, molestie condimentum venenatis quis, dapibus a velit. Ut eu ante ut libero molestie aliquet vel a velit. Integer sed luctus libero, vestibulum tempus sem.")
                    .padding()
                
                Spacer()
                
                Button(action: {
                    print("apertou") //Entra aqui a lógica
                }, label: {
                    Image("Default")
                        .overlay {
                            Text("I'M READY")
                                .font(.system(size: 20, weight: .bold))
                                .tint(.black)
                        }
                })
                .padding(.vertical)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HowToPlayView()
}
