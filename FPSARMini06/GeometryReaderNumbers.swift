//
//  GeometryReaderNumbers.swift
//  FPSARMini06
//
//  Created by Letícia Malagutti on 01/08/24.
//

import Foundation

// MARK: ---------- GENERAL ----------
// MARK: Button Sizes
// Small Button Size
let buttonSmallW = 0.188
let buttonSmallH = 0.058

// Regular Button Size
let buttonRegW = 0.770
let buttonRegH = 0.071

// Big Button Size
let buttonBigW = 0.770
let buttonBigH = 0.100

// Claim Button Size
let buttonClaimW = 0.247
let buttonClaimH = 0.058

// MARK: Overlay
// Overlay Box Size
let overlayBoxW = 0.944
let overlayBoxH = 0.767


// MARK: ---------- VIEW SPECIFIC ----------
// MARK: HowToPlayView
// HowToPlayView Text Box Size
let h2pTextBoxW = 0.944
let h2pTextBoxH = 0.165

// MARK: SettingsView e PauseView
// ComponenteFG, ComponenteBG3 e ComponenteBG5 Box Sizes
let cFGW = 0.821
let cFGH = 0.058
let cBG3W = 0.826
let cBG3H = 0.199
let cBG5W = 0.826
let cBG5H = 0.333

// MARK: GamePlayFeedbackView
// Caveira Derrota Size
let caveiraDerrotaW = 0.396
let caveiraDerrotaH = 0.183

// Defeat [BOTS, HEALTH e REWARD] Text Box Size (VStack Frame)
let defeatTextBoxW = 0.721
let defeatTextBoxH = 0.191

// MARK: GameScene
// Life Box
let lifeBoxW = 0.293
let lifeBoxH = 0.031
//padding = 8 e text life % = 19.52

// MARK: InventoryView
// Frame Topo
let frameTopoW = 0.294
let frameTopoH = 0.116

// Frame VStack Interno
let insideVsW = 0.294
let insideVsH = 0.090

// Frame Ícone Interno
let insideIconW = 0.089
let insideIconH = 0.041

// Frame Imagem Central
let cntrImgW = 0.906
let cntrImgH = 0.526

// Frame Cores de Tiros
let shotColorsW = 0.120
let shotColorsH = 0.055

// Frame BG Claim Cores de Tiros
let bgClaimClrW = 0.906
let bgClaimClrH = 0.271

// Frame BG Pill Tipo
let bgTypePillW = 0.134
let bgTypePillH = 0.027

// Frame BG Pill $$
let bg$$PillW = 0.193
let bg$$PillH = 0.027

// Frame Imagem Claim
let claimImgW = 0.851
let claimImgH = 0.135

//
//struct ComponentePauseMenuBG3: View {
//    @Binding var toggleOn: Bool
//    var body: some View {
//        ZStack{
//            // MARK: Background
//            RoundedRectangle(cornerRadius: 8)
//                .fill(.gray.opacity(0.8))
//                .stroke(Color.black, lineWidth: 2)
//                .frame(width: 355, height: 186)
//            Rectangle()
//                .fill(.white.opacity(0.5))
//                .frame(width: 353, height: 62)
//            
//            // MARK: Foreground
//            VStack{
//                // TODO: Adicionar componente parte escrita
//                ComponentePauseMenuFG(toggleOn: toggleOn)
//                ComponentePauseMenuFG(toggleOn: toggleOn)
//                ComponentePauseMenuFG(toggleOn: toggleOn)
//            }
//            .frame(width: 355, height: 186)
//            .padding()
//        }
//    }
//}
//
//struct ComponentePauseMenuBG5: View {
//    @Binding var toggleOn: Bool
//    var body: some View {
//        ZStack{
//            // MARK: Background
//            RoundedRectangle(cornerRadius: 8)
//                .fill(.gray.opacity(0.8))
//                .stroke(Color.black, lineWidth: 2)
//                .frame(width: 355, height: 310)
//            VStack{
//                Rectangle()
//                    .fill(.white.opacity(0.5))
//                    .frame(width: 353, height: 62)
//                Spacer()
//                Rectangle()
//                    .fill(.white.opacity(0.5))
//                    .frame(width: 353, height: 62)
//            }
//            .frame(height: 186)
//            // MARK: Foreground
//            VStack{
//                // TODO: Adicionar componente parte escrita
//                ComponentePauseMenuFG(toggleOn: toggleOn)
//                ComponentePauseMenuFG(toggleOn: toggleOn)
//                ComponentePauseMenuFG(toggleOn: toggleOn)
//                ComponentePauseMenuFG(toggleOn: toggleOn)
//                ComponentePauseMenuFG(toggleOn: toggleOn)
//            }
//            .frame(width: 355, height: 186)
//            .padding()
//        }
//    }
//}
//
//struct ComponentePauseMenuFG: View {
//    @State var toggleOn = false
//    
//    var togglePause: LocalizedStringKey = ""
//    
//    var body: some View {
//        ZStack{
////            RoundedRectangle(cornerRadius: 8)
////                .fill(.red.opacity(0.5))
//            HStack{
//                Rectangle()
//                    .frame(width: 30, height: 30)
//                    .padding(.leading)
//                Text("sound-text")
//                    .font(.system(size: 18, weight: .bold))
//                    .minimumScaleFactor(0.5)
//                Spacer()
//                Text("on-text")
//                    .font(.system(size: 18))
//                    .minimumScaleFactor(0.5)
//                Toggle(togglePause, isOn: $toggleOn)
//                    .padding(.trailing)
//            }
//        }
//        .frame(width: 353, height: 54)
//    }
//}
//
//#Preview {
//    struct BindingViewWxamplePreviewContainer: View{
//        @State private var toggleOn = false
//        
//        var body: some View {
//            ComponentePauseMenuBG5(toggleOn: $toggleOn)
//        }
//    }
//    return BindingViewWxamplePreviewContainer()
//}
