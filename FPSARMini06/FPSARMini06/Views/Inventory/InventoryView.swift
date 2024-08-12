//
//  InventoryView.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//

import SwiftUI
import SwiftData

struct InventoryView: View {
    @Environment(PageManager.self) var pageManager
    
    @Environment (\.modelContext) private var context
    @Query private var data:[UserData]
    
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.5)
                .ignoresSafeArea()
            
            ScrollView(.vertical) {
                VStack (spacing: 10) {
                    HStack {
                        Button(action: {
                            pageManager.page = .menu
                        }, label: {
                            Image("button_nav")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width * buttonSmallW, height: UIScreen.main.bounds.height * buttonSmallH)
                                .overlay {
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 36, weight: .bold))
                                        .foregroundStyle(.white)
                                }
                        })
                        .padding(.leading)
                        Spacer()
                        Text("inventoryView-title")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(.white)
                            .padding(.trailing, UIScreen.main.bounds.width * buttonSmallW)
                            .minimumScaleFactor(0.5)
                        Spacer()
                    }
                    HStack(spacing: 5) {
                        ExtractedView(score: data.first?.score ?? 000)
                        ExtractedView(score: data.first?.score ?? 000)
                        ExtractedView(score: data.first?.score ?? 000) 
                    }
                    RoundedRectangle(cornerRadius: 25.0)// Image
                        .fill(.white.opacity(0.6))
                        .stroke(Color.black, lineWidth: 2)
                        .overlay{
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 35, height: 27)
                        }
                        .frame(width: UIScreen.main.bounds.width * cntrImgW, height: UIScreen.main.bounds.height * cntrImgH)
                    
                    HStack(spacing: 11) {
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.black, lineWidth: 2)
                            .fill(.white.opacity(0.5))
                            .overlay {
                                Image(systemName: "paintbrush.pointed.fill")
                                    .font(.system(size: 16))
                                    .minimumScaleFactor(0.5)
                            }
                            .frame(width: UIScreen.main.bounds.width * shotColorsW, height: UIScreen.main.bounds.height * shotColorsH)
                        
                        ExtractedView2()
                        ExtractedView3()
                        ExtractedView3()
                        ExtractedView3()
                        ExtractedView3()
                    }
                    ExtractedView4()
                }
            }.padding(.top, 40)
        }
        
        
    }
}


#Preview {
    InventoryView()
        .environment(PageManager())
}


struct ExtractedView: View {
    @State var score:Int
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6.0)
                .stroke(Color.black, lineWidth: 2)
                .fill(.black.opacity(0.4))
                .frame(width: UIScreen.main.bounds.width * frameTopoW, height: UIScreen.main.bounds.height * frameTopoH)
            
            VStack {
                RoundedRectangle(cornerRadius: 2)
                    .fill(.white.opacity(0.7))
                    .stroke(Color.black, lineWidth: 1.5)
                    .frame(width: UIScreen.main.bounds.width * insideIconW, height: UIScreen.main.bounds.height * insideIconH)
                    .overlay {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .padding(5)
                    }
                Text("bestScore-title")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                    .minimumScaleFactor(0.5)
                Text("bestScore-text: \(score)")
                    .minimumScaleFactor(0.5)
                    .foregroundStyle(.white)
            }
            .frame(width: UIScreen.main.bounds.width * insideVsW, height: UIScreen.main.bounds.height * insideVsH)
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
            .frame(width: UIScreen.main.bounds.width * shotColorsW, height: UIScreen.main.bounds.height * shotColorsH)
    }
}

struct ExtractedView3: View {
    var body: some View {
        ZStack {
            Ellipse()
                .fill(.white)
                .stroke(Color.black, lineWidth: 2)
            
            Image(systemName: "lock")
                .resizable()
                .scaledToFit()
                .padding()
            
        }
        .frame(width: UIScreen.main.bounds.width * shotColorsW, height: UIScreen.main.bounds.height * shotColorsH)
        .opacity(0.5)
    }
}

struct ExtractedView4: View {
    @Environment (\.modelContext)  var context
    @Query private var data:[UserData]
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.black.opacity(0.3))
                .stroke(Color.black, lineWidth: 2)
            
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 2)
                        .fill(.white.opacity(0.8))
                        .frame(width: UIScreen.main.bounds.width * bgTypePillW, height: UIScreen.main.bounds.height * bgTypePillH)
                        .overlay {
                            Text("type-title")
                                .font(.system(size: 14))
                                .minimumScaleFactor(0.5)
                                .foregroundStyle(.white)
                        }
                    Spacer()
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 2)
                        .fill(.white.opacity(0.8))
                        .overlay {
                            Text("money-text")
                                .font(.system(size: 14))
                                .minimumScaleFactor(0.5)
                                .foregroundStyle(.white)
                                .frame(width: UIScreen.main.bounds.width * bgTypePillW, height: UIScreen.main.bounds.height * bgTypePillH)
                        }
                        .frame(width: UIScreen.main.bounds.width * bgTypePillW, height: UIScreen.main.bounds.height * bgTypePillH)
                    
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
                    .frame(width: UIScreen.main.bounds.width * claimImgW, height: UIScreen.main.bounds.height * claimImgH)
                
                HStack {
                    Text("customizationName-title")
                        .minimumScaleFactor(0.5)
                        .foregroundStyle(.white)
                    Spacer()
                    
                    Button(action: {
                        
                        //adicionar o ID do cosmetico
                        
                        addCosmetic(cosmeticID: 0, item: data.first!)
                    }, label: {
                        Image("Claim")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * buttonClaimW, height: UIScreen.main.bounds.height * buttonClaimH)
                            .overlay{
                                Text("claim-button")
                                    .font(.system(size: 16, weight: .bold))
                                    .minimumScaleFactor(0.5)
                                    .foregroundStyle(.white)
                            }
                    })
                    
                }
                .padding(.horizontal)
                
            }
        }
        .frame(width: UIScreen.main.bounds.width * bgClaimClrW, height: UIScreen.main.bounds.height * bgClaimClrH)
    }
    
    func addCosmetic(cosmeticID:Int, item:UserData){
        
        item.box_itens_ID.append(cosmeticID)
        
        do{
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
    }
}
