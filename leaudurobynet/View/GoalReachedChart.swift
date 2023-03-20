//
//  GoalReachedChart.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 16.03.23.
//

import SwiftUI

struct GoalReachedChart: View {
    var progressed:Double
    var completed: Bool
    
    var body: some View {
        ZStack{
            if completed{
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(1.0)
                    .foregroundColor(Color.green)
                    .animation(.linear, value: self.progressed)
                    .shadow(color: .green, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)

                    Image(systemName: "checkmark.seal")
                        .resizable()
                        .foregroundColor(.green)
                        .frame(width: 50, height: 50)
                        .shadow(color: .green, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)

            }else{
                Circle()
                    .stroke(lineWidth: 15.0)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                    .shadow(color: .gray, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                
                Circle()
                    .trim(from: 0.0, to: min(self.progressed, 1.0))
                    .stroke(style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.red)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear, value: self.progressed)
                
                Image(systemName: "x.circle")
                    .resizable()
                    .foregroundColor(.red)
                    .frame(width: 50, height: 50)
                    .shadow(color: .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            }
            
            
            
            
        }
        .frame(width: 150, height: 150)
        .padding()
        
        
    }
}

struct GoalReachedChart_Previews: PreviewProvider {
    static var previews: some View {
        GoalReachedChart(progressed: 0.25, completed: false)
    }
}
