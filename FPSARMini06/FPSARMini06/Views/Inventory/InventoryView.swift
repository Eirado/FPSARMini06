//
//  InventoryView.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

import SwiftUI

struct InventoryView: View {
    @Environment(PageManager.self) var pageManager
    
    var body: some View {
        
        ZStack {
            Color.gray
                .opacity(0.5)
                .ignoresSafeArea()
            
            ScrollView(.vertical){
                VStack (spacing: 10){
                    HStack {
                        Button(action: {
                            pageManager.page = .menu
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
                        Text("INVENTORY")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(Color.black)
                            .padding(.trailing, 56)
                        Spacer()
                    }
                    
                    
                    HStack(spacing: 5) {
                        ExtractedView()
                        ExtractedView()
                        ExtractedView()
                    }
                    
                    RoundedRectangle(cornerRadius: 25.0)// Image
                        .fill(.white.opacity(0.6))
                        .stroke(Color.black, lineWidth: 2)
                        .overlay{
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 35, height: 27)
                                .padding()
                        }
                        .frame(width: 390, height: 490)
                    
                    HStack(spacing: 11) {
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.black, lineWidth: 2)
                            .fill(.white.opacity(0.5))
                            .overlay{
                                Image(systemName: "paintbrush.pointed.fill")
                                    .font(.system(size: 16))
                            }
                            .frame(width: 50, height: 50)
                        
                        ExtractedView2()
                        ExtractedView3()
                        ExtractedView3()
                        ExtractedView3()
                        ExtractedView3()
                    }
                    
                    ExtractedView4()
                    
                }
                .padding()
            }
            
        }
    }
}

#Preview {
    InventoryView()
        .environment(PageManager())
}

struct ExtractedView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 6.0)
                .stroke(Color.black, lineWidth: 2)
                .fill(.black.opacity(0.4))
                .frame(width: 126, height: 108)
            
            VStack{
                RoundedRectangle(cornerRadius: 2)
                    .fill(.white.opacity(0.7))
                    .stroke(Color.black, lineWidth: 1.5)
                    .overlay {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .padding(5)
                    }
                    .frame(width: 38, height: 38)
                Text("Best Score")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(Color.black)
                Text("XXXXX")
            }
        }
    }
}

struct ExtractedView2: View {
    var body: some View {
        Ellipse()
            .fill(.white.opacity(0.8))
            .stroke(Color.black, lineWidth: 2)
            .overlay {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            .frame(width: 50, height: 50)
    }
}

struct ExtractedView3: View {
    var body: some View {
        ZStack{
            Ellipse()
                .fill(.white)
                .stroke(Color.black, lineWidth: 2)
            
            Image(systemName: "lock")
                .resizable()
                .scaledToFit()
                .padding()
            
        }
        .frame(width: 50, height: 50)
        .opacity(0.5)
    }
}

struct ExtractedView4: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(.black.opacity(0.3))
                .stroke(Color.black, lineWidth: 2)
            
            VStack{
                HStack{
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 2)
                        .fill(.white.opacity(0.8))
                        .frame(width: 58, height: 25)
                        .overlay{
                            Text("Type")
                                .font(.system(size: 14))
                                .minimumScaleFactor(0.5)
                        }
                    Spacer()
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 2)
                        .fill(.white.opacity(0.8))
                        .frame(width: 83, height: 25)
                        .overlay{
                            Text("$$$ $$$")
                                .font(.system(size: 14))
                                .minimumScaleFactor(0.5)
                        }
                    
                }
                .padding(.horizontal)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white.opacity(0.3))
                    .stroke(Color.black, lineWidth: 1.5)
                    .overlay {
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 35, height: 27)
                            .padding()
                    }
                    .frame(width: 366, height: 126)
                
                HStack{
                    Text("Customization Name")
                    Spacer()
                    Image("Claim")
                        .overlay{
                            Text("CLAIM")
                                .font(.system(size: 16, weight: .bold))
                        }
                }
                .padding(.horizontal)
                
            }
        }
        .frame(width: 390, height: 253)
    }
}
