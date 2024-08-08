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
    
    func makeUIView(context: Context) -> ARView {
        let arView = MainScene()
        arView.addCoaching()
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

extension ARView: ARCoachingOverlayViewDelegate {
    
    func addCoaching() {
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.goal = .horizontalPlane
        coachingOverlay.session = self.session
        coachingOverlay.delegate = self
        self.addSubview(coachingOverlay)
    }
    
    public func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
            // Ação que você deseja executar após 5 segundos
            print("Timer disparado após 5 segundos")
            
            // Atualiza o binding para true, ativando a lógica na GameScene
        }
    }
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
