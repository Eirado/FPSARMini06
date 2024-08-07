//
//  DamageFlashSystem.swift
//  FPSARMini06
//
//  Created by Luiz Felipe on 07/08/24.
//

import Foundation
import RealityKit
import Metal
import MetalKit
import Combine

class DamageFlashSystem: System{
    private var device: MTLDevice
        private var pipelineState: MTLRenderPipelineState
        private var vertexBuffer: MTLBuffer
        private var opacity: Float = 0.0
        private var metalLayer: CAMetalLayer
    
    
    required init(scene: Scene) {
        // Load Metal shader
                device = MTLCreateSystemDefaultDevice()!
                let library = device.makeDefaultLibrary()!
                let vertexFunction = library.makeFunction(name: "vertex_main")!
                let fragmentFunction = library.makeFunction(name: "fragment_main")!
                
                // Configure render pipeline descriptor
                let pipelineDescriptor = MTLRenderPipelineDescriptor()
                pipelineDescriptor.vertexFunction = vertexFunction
                pipelineDescriptor.fragmentFunction = fragmentFunction
                pipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
                
                pipelineState = try! device.makeRenderPipelineState(descriptor: pipelineDescriptor)
                
                // Create a simple vertex buffer
                let vertexData: [Float] = [
                    -1.0, -1.0, 0.0, 1.0,
                     1.0, -1.0, 0.0, 1.0,
                    -1.0,  1.0, 0.0, 1.0,
                     1.0,  1.0, 0.0, 1.0,
                ]
                vertexBuffer = device.makeBuffer(bytes: vertexData, length: vertexData.count * MemoryLayout<Float>.size, options: [])!
                
                // Create CAMetalLayer
                metalLayer = CAMetalLayer()
                metalLayer.device = device
                metalLayer.pixelFormat = .bgra8Unorm
                metalLayer.framebufferOnly = true
                metalLayer.frame = .bounds
                arView.layer.addSublayer(metalLayer)
    }
    
    func update(context: SceneUpdateContext) {
        <#code#>
    }
    
    func flash() {
            opacity = 0.5 // Iniciar o flash com uma opacidade de 50%
        }
    private func renderFlash(arView:ARView) {
        guard let drawable = metalLayer.nextDrawable() else { return }
                
                let passDescriptor = MTLRenderPassDescriptor()
                passDescriptor.colorAttachments[0].texture = drawable.texture
                passDescriptor.colorAttachments[0].loadAction = .load
                passDescriptor.colorAttachments[0].storeAction = .store
                
                let commandQueue = device.makeCommandQueue()!
                let commandBuffer = commandQueue.makeCommandBuffer()!
                let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: passDescriptor)!
                renderEncoder.setRenderPipelineState(pipelineState)
                renderEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
                renderEncoder.setFragmentBytes(&opacity, length: MemoryLayout<Float>.size, index: 0)
                renderEncoder.drawPrimitives(type: .triangleStrip, vertexStart: 0, vertexCount: 4)
                renderEncoder.endEncoding()
                commandBuffer.present(drawable)
                commandBuffer.commit()
        }
}
