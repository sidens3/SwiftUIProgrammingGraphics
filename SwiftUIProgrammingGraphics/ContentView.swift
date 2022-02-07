//
//  ContentView.swift
//  SwiftUIProgrammingGraphics
//
//  Created by Михаил Зиновьев on 07.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showSmile = false
    
    var body: some View {
        
        VStack {
            Spacer()
            if showSmile {
                SmileView()
                    .frame(width: 250, height: 250)
                    .transition(showSmile ? .slide: .leadingSlide)
            }
            Spacer()
            
            Button(action: buttonAction) {
                Text(showSmile ? "Hide Smile" : "Smile")
            }
        }
    }
    
    private func buttonAction() {
        withAnimation {
            showSmile.toggle()
        }
    }
}

extension AnyTransition {
    static var leadingSlide: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .scale)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
