//
//  ContentView.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 19/07/24.
//

import SwiftUI
import RealityKit
import ARKit
import SwiftData

struct ContentView : View {
    @Environment(PageManager.self) var pageManager
    @Environment(\.modelContext)  var context
    @Query private var data:[UserData]
    
    var body: some View {
        Navigator().edgesIgnoringSafeArea(.all)
            .onAppear() {
            
                requestCameraAccess()

                fetchData()
            
    }
    
    func fetchData() {
        if data.isEmpty{
            let data = UserData(score: 0, box_itens_ID: [])
            context.insert(data)
        }
        
        
    }
    
    func requestCameraAccess() {
            switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                // Já autorizado
                print("Camera access authorized")
            case .notDetermined:
                // Requisição de permissão
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        print("Camera access granted")
                    } else {
                        print("Camera access denied")
                    }
                }
            case .denied, .restricted:
                // Permissão negada ou restrita
                print("Camera access denied or restricted")
            @unknown default:
                fatalError("Unknown camera authorization status")
            }
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
