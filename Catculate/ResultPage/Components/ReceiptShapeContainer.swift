//
//  ReceiptShapeContainer.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/5/26.
//

import SwiftUI

struct ReceiptShape: Shape {
    let topCornersRadius: CGFloat
    let trianglesCornerRadius: CGFloat
    let triangleHeight: CGFloat
    let minTriangleWidth: CGFloat
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            // calculate the minimum width of the triangles,
            // such that it is at least minTriangleWidth, and
            // rect.width fits an integer number of such triangles
            let triangleCount = Int(rect.width / minTriangleWidth)
            let actualTriangleWidth = rect.width / CGFloat(triangleCount)
            
            // start from the top left
            path.move(to: .init(x: rect.minX + topCornersRadius, y: rect.minY))
            // draw the rounded corner for the top left corner
            path.addArc(
                tangent1End: rect.origin,
                tangent2End: .init(x: rect.minX, y: rect.minX + topCornersRadius),
                radius: topCornersRadius
            )
            
            // draw the left side of the shape
            var tangent1End = CGPoint(x: rect.minX, y: rect.maxY)
            var tangent2End = tangent1End.applying(.init(translationX: actualTriangleWidth / 2, y: -triangleHeight))
            path.addArc(tangent1End: tangent1End, tangent2End: tangent2End, radius: trianglesCornerRadius / 2)
            
            // draw most of the triangles
            // each iteration draws one side of a triangle
            // we don't draw the right side of the last triangle in the loop,
            // because it will have a different tangent2End
            for i in 0..<(2 * triangleCount - 1) {
                tangent1End = tangent2End
                tangent2End = tangent1End.applying(.init(
                    translationX: actualTriangleWidth / 2,
                    y: triangleHeight * (i.isMultiple(of: 2) ? 1 : -1)
                ))
                path.addArc(tangent1End: tangent1End, tangent2End: tangent2End, radius: trianglesCornerRadius)
            }
            
            // draw the right side of the last triangle
            path.addArc(tangent1End: tangent2End, tangent2End: .init(x: rect.maxX, y: rect.minY), radius: trianglesCornerRadius / 2)
            
            // draw the right side of the shape
            path.addArc(
                tangent1End: .init(x: rect.maxX, y: rect.minY),
                tangent2End: rect.origin,
                radius: topCornersRadius
            )
            
            // connects the top right corner of the shape to the top left corner
            path.closeSubpath()
        }
    }
    
}
