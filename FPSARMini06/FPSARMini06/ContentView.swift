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
    @Environment (\.modelContext)  var context
    @Query private var data:[UserData]
    
    var body: some View {
        Navigator().edgesIgnoringSafeArea(.all)
            .task {
                fetchData()
            }
    }
    
    func fetchData(){
        if data.isEmpty{
            let data = UserData(score: 0, box_itens_ID: [])
            context.insert(data)
        }
        
        
    }
}

class ARViewManager {
    static let shared = MainScene()
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = MainScene()
        return arView
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
