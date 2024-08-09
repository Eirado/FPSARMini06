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
    
    var body: some View {
        Navigator().edgesIgnoringSafeArea(.all)
    }
}

class ARViewManager {
    static let shared = MainScene()
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        return ARViewManager.shared
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

#Preview {
    struct ContentViewPreviewContainer: View {
        @State private var toggleOn = false
        
        var body: some View {
            ContentView()
                .environment(PageManager())
        }
    }
    return ContentViewPreviewContainer()
}
