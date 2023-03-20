//
//  DonutGraph.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 06.03.23.
//

import SwiftUI


struct InnerCircle: Shape {
    let ratio: CGFloat
    func path(in rect: CGRect) -> Path {
         let center = CGPoint.init(x: (rect.origin.x + rect.width)/2, y: (rect.origin.y + rect.height)/2)
        let radii = min(center.x, center.y) * ratio
         let path = Path { p in
             p.addArc(center: center,
                      radius: radii,
                      startAngle: Angle(degrees: 0),
                      endAngle: Angle(degrees: 360),
                      clockwise: true)
             p.addLine(to: center)
         }
         return path
    }
}

struct DonutGraph: View {
    @State private var selectedCell: UUID = UUID()
    
    let dataModel: ChartDataModel
    let onTap: (ChartCellModel?) -> ()
    var body: some View {
            ZStack {
                PieChart(dataModel: dataModel, onTap: onTap)
                InnerCircle(ratio: 1/3).foregroundColor(.white)
            }
    }
}


struct DonutGraph_Previews: PreviewProvider {
    static var previews: some View {
        DonutGraph()
    }
}
