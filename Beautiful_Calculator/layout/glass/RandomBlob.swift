//
//  RandomBlob.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-06.
//

import SwiftUI

struct CubicSegment {
    let point: CGPoint
    let control1: CGPoint
    let control2: CGPoint
}

struct RandomBlob: Shape {
    var sides:Int
    
    func path(in rect: CGRect) -> Path {
        let c = CGPoint(x: rect.width/2.0, y: rect.height/2.0)
        let r = Double(min(rect.width,rect.height)) / 2.0
        let segments = CreateRandomShape3(
            sides: sides,
            radius: r,
            center: c)
        var path = Path()
        path.move(to: segments[0].point)
        for i in 1..<segments.count {
            path.addCurve(to: segments[i].point,
                          control1: segments[i].control1,
                          control2: segments[i].control2)
        }
        path.closeSubpath()
        return path
    }
}

fileprivate func CreateRandomShape3(sides:Int, radius r: Double, center c: CGPoint) -> [CubicSegment] {
    var segments:[CubicSegment] = []
    
    let sectorAngle = 2.0 * Double.pi / Double(sides)
    var previousSectorIn = true
    for i in 0..<sides {
        let segmentAngle = sectorAngle * Double.random(in: 0.7...1.3)
        let angle = (sectorAngle * Double(i-0)) + segmentAngle
        let radius = r * Double.random(in: 0.45...0.85)
        let pt = Cartesian(length: radius, angle: angle)
        
        let ctlAngle1 = angle - (segmentAngle * 0.75)
        let ctlDistance1 = previousSectorIn ? radius*1.45 : radius*0.55
        let ctl1 = Cartesian(length: ctlDistance1, angle: ctlAngle1)
        
        let ctlAngle2 = angle - (segmentAngle * 0.25)
        let ctlDistance2 = radius * Double.random(in: 0.55...1.45)
        previousSectorIn = ctlDistance2 < radius
        let ctl2 = Cartesian(length: ctlDistance2, angle: ctlAngle2)
        
        let s:CubicSegment = CubicSegment(point: CGPoint(x: pt.x + c.x, y: pt.y + c.y),
                                          control1: CGPoint(x: ctl1.x + c.x, y: ctl1.y + c.y),
                                          control2: CGPoint(x: ctl2.x + c.x, y: ctl2.y + c.y))
        segments.append(s)
    }
    segments.append(segments[0])
    return segments
}

func Cartesian(length:Double, angle:Double) -> CGPoint {
    return CGPoint(x: length * cos(angle), y: length * sin(angle))
}

