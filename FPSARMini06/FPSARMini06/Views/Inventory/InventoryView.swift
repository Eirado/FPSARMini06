//
//  InventoryView.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

import SwiftUI

struct InventoryView: View {
    var body: some View {
        
        ZStack {
            Color.purple
                .opacity(0.5)
                .ignoresSafeArea()
            
            ScrollView {
                    HStack {
                        Button(action: {
                            print("voltar")
                        }, label: {
                            Image("Top Bar")
                                .overlay{
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 36, weight: .bold))
                                        .tint(.black)
                                }
                        })
                        .frame(width: 81, height: 53)
                        
                        Spacer()
                        
                        Text("Inventory")
                        
                        Spacer()
                    }
                    
                    HStack(spacing: 5) {
                        ExtractedView()
                        
                        ExtractedView()
                        
                        ExtractedView()
                    }
                    
                    RoundedRectangle(cornerRadius: 25.0)// Image
                        .foregroundStyle(.blue.opacity(0.6))
                        .frame(width: 390, height: 490)
                    
                    HStack(spacing: 11) {
                        RoundedRectangle(cornerRadius: 7)
                            .foregroundStyle(.black.opacity(0.4))
                            .frame(width: 50, height: 50)
                        
                        ExtractedView2()
                        
                        ExtractedView2()
                        
                        ExtractedView2()
                        
                        ExtractedView2()
                        
                        ExtractedView2()
                    }
                    
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.black.opacity(0.4))
                        .frame(width: 390, height: 253)
                        .overlay {
                            Text("as")
                        }
                    
                    Spacer()
            }
            .padding(.horizontal)
            
        }
    }
}

#Preview {
    InventoryView()
}

struct ExtractedView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .foregroundStyle(.black.opacity(0.4))
            .frame(width: 126, height: 108)
    }
}

struct ExtractedView2: View {
    var body: some View {
        Ellipse()
            .foregroundStyle(.black.opacity(0.4))
            .frame(width: 50, height: 50)
    }
}
