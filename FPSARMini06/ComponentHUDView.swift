//
//  ComponentHUDView.swift
//  FPSARMini06
//
//  Created by Maria Clara Reis Guimarães on 28/08/24.
//

import SwiftUI

struct ComponentHUDView: View {
    
    @Binding var timer: Int
    @Environment(PageManager.self) var pageManager
    
    var body: some View {
        
        VStack(alignment: .leading) {
            //HUD Game Scene
            HStack(alignment: .top) {
                VStack {
                    //Bullet Feedback
                    HStack {
                        Image("bullet_HUD")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .overlay {
                                Image("bullet")
                                    .resizable()
                                    .frame(width: 35,height: 35)
                            }
                        
                        RoundedRectangle(cornerRadius: 2.0)
                            .fill(Color("orange_dark"))
                            .stroke(Color.orange, lineWidth: 2)
                            .frame(width: 140,height: 35)
                            .overlay {
                                RoundedRectangle(cornerRadius: 2.0)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color("orange_medium"), Color("orange_light")]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        ))
                                    .stroke(Color.orange, lineWidth: 2)
                                    .frame(width: 140,height: 35)
                            }
                        Spacer()
                    }
                    
        //Health Feedback
                    HStack {
                        Image("health_HUD")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .overlay {
                                Image("health")
                                    .resizable()
                                    .frame(width: 25,height: 25)
                            }
                // Health Status
                        RoundedRectangle(cornerRadius: 2.0)
                            .fill(.red.opacity(0.3))
                            .stroke(Color("blue_dark"), lineWidth: 2)
                            .frame(width: 140,height: 35)
                            .overlay{
                                RoundedRectangle(cornerRadius: 2.0)
                                    .fill(Color("blue_dark"))
                                    .stroke(Color("blue_light"), lineWidth: 2)
                                    .frame(width: 140,height: 35)
                            }
                        Spacer()
                    }
                }.padding()
                
                // Timer
                Image("timer")
                    .resizable()
                    .frame(width: 100,height: 60)
                    .overlay{
                        Text("\(timer)")
                            .font(.largeTitle).bold().italic()
                            .foregroundColor(.white)
                    }
            .padding()
                
            }
            
            
            HStack {
                
                //PAUSE BUTTON
                Button(action: {
                    pageManager.page = .pause
                }, label: {
                    
                    Image("button_nav")
                        .resizable()
                        .opacity(0.75)
                        .frame(width: 50, height: 50)
                        .overlay {
                            Image(systemName: "pause")
                                .font(.system(size: 28, weight: .bold))
                                .tint(.white) .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        }
                })
//                .padding(.top, 35)
                .padding(.horizontal, 15)
            }
            Spacer()
        }.padding(.vertical, 32)
   
    }
}

//#Preview {
//    ComponentHUDView()
//}
