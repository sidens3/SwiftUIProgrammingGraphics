//
//  SmileView.swift
//  SwiftUIProgrammingGraphics
//
//  Created by Михаил Зиновьев on 07.02.2022.
//

import SwiftUI

struct SmileView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let startingCoordinate = 10
            let radius = size * 0.9
            let miniRadius = size * 0.1
            let color = Color.yellow
            
            
            Path { path in
                path.addEllipse(in: CGRect(origin: CGPoint(x: startingCoordinate,
                                                           y: startingCoordinate),
                                           size: CGSize(width: radius,
                                                        height: radius)
                                          ))
            }.stroke(color, lineWidth: 2)
            
            Path { path in
                path.addEllipse(in: CGRect(origin: CGPoint(x: radius * 0.3,
                                                           y: radius * 0.3),
                                           size: CGSize(width: miniRadius,
                                                        height: miniRadius)
                                          ))
            }.stroke(color, lineWidth: 2)
            
            Path { path in
                path.addEllipse(in: CGRect(origin: CGPoint(x: radius * 0.6,
                                                           y: radius * 0.3),
                                           size: CGSize(width: miniRadius,
                                                        height: miniRadius)
                                          ))
            }.stroke(color, lineWidth: 2)
            
            Path { path in
                path.move(to: CGPoint(x: radius * 0.25, y: radius * 0.8))
                
                path.addQuadCurve(to: CGPoint(x: radius * 0.75,
                                              y: radius * 0.8),
                                  control: CGPoint(x: radius * 0.5,
                                                   y: radius * 0.95)
                )
            }.stroke(color, lineWidth: 2)
        }
    }
}


struct SmileView_Previews: PreviewProvider {
    static var previews: some View {
        SmileView().frame(width: 250, height: 250)
    }
}
