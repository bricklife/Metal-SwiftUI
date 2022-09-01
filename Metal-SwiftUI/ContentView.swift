//
//  ContentView.swift
//  Metal-SwiftUI
//
//  Created by Shinichiro Oba on 2022/09/01.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var metalViewModel = MetalViewModel()
    
    var body: some View {
        MetalView(viewModel: metalViewModel)
        Button("doSomething") {
            metalViewModel.doSomething()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
