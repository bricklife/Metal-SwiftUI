//
//  MetalView.swift
//  Metal-SwiftUI
//
//  Created by Shinichiro Oba on 2022/09/01.
//

import SwiftUI
import MetalKit

class MetalViewModel: ObservableObject {
    
    fileprivate lazy var mtkView: MTKView = {
        let view = MTKView()
        view.device = MTLCreateSystemDefaultDevice()
        view.backgroundColor = .black
        return view
    }()
    
    fileprivate lazy var renderer: Renderer = {
        let renderer = Renderer(metalKitView: mtkView)!
        mtkView.delegate = renderer
        return renderer
    }()
    
    func doSomething() {
        print(renderer.rotation)
    }
}

struct MetalView: UIViewRepresentable {
    
    @ObservedObject var viewModel: MetalViewModel
    
    func makeCoordinator() -> Renderer {
        return viewModel.renderer
    }
    
    func makeUIView(context: Context) -> MTKView {
        return viewModel.mtkView
    }
    
    func updateUIView(_ view: MTKView, context: Context) {
    }
}
