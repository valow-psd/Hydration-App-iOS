//
//  BarChart.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 09.03.23.
//

import SwiftUI
import Charts

struct BarChart: View {
    var body: some View {
        VStack(alignment: .center)  {
            Chart(BarData.data) { shape in
                BarMark (
                    x: .value("Jour", shape.jour),
                    y: .value("Litres", shape.litres)
                )
                .cornerRadius(20)
                .annotation(position: .top, alignment: .top) {
                    Text("\(shape.litres, format: .number.precision(.fractionLength(1)))L")
                        .foregroundColor(.black)
                        .opacity(0.3)
                        .font(.custom("Roboto-Medium", size: 12))
                    
                }
            }
            .chartYAxis {
                AxisMarks(position: .top) { _ in
                    //                    AxisValueLabel()
                }
            }
            .chartXAxis {
                AxisMarks(position: .bottom) { _ in
                    AxisGridLine().foregroundStyle(.clear)
                    AxisTick().foregroundStyle(.clear)
                    AxisValueLabel()
                        .font(.custom("Roboto-Medium", size: 14))
                }
            }
        }
        .frame(width: 250, height: 200)
    }
}

struct ShapeModel: Identifiable {
    var jour: String
    var litres: Double
    var id = UUID()
}

struct BarData {
    static let data: [ShapeModel] = [
        .init(jour: "Lun.",    litres: 2),
        .init(jour: "Mar.",     litres: 2.2),
        .init(jour: "Mer.", litres: 1.4),
        .init(jour: "Jeu.",      litres: 1.8),
        .init(jour: "Ven.",    litres: 2.1),
        .init(jour: "Sam.",  litres: 1.8),
        .init(jour: "Dim.",  litres: 2.1)
    ]
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart()
    }
}
