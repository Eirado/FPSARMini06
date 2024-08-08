//
//  ContentView.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 19/07/24.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    @Environment(PageManager.self) var pageManager
    @Binding var toggleOn: Bool
    
    var body: some View {
        Navigator(toggleOn: $toggleOn).edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    @Binding var carregou: Bool
    
    func makeUIView(context: Context) -> ARView {
        let arView = MainScene(carregou: $carregou)
        arView.addCoaching()
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

#Preview {
    struct ContentViewPreviewContainer: View {
        @State private var toggleOn = false
        
        var body: some View {
            ContentView(toggleOn: $toggleOn)
                .environment(PageManager())
        }
    }
    return ContentViewPreviewContainer()
}
