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
                    .transition(.topSlide)
            }
            Spacer()
            
            Button(action: buttonAction) {
                Text(showSmile ? "Not Smile" : "Smile")
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
    static var topSlide: AnyTransition {
        let insertion = AnyTransition.move(edge: .top)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .bottom)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
