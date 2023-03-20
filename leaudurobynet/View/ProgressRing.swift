//
//  ProgressRing.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 07.03.23.
//

import SwiftUI

struct ProgressRing: View {
    
    var progress:Double
    var complete: Bool
    
    var body: some View {
        ZStack{
            if complete{
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(1.0)
                    .foregroundColor(Color.green)
                    .animation(.linear, value: self.progress)
                    .shadow(color: .green, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            }else{
                Circle()
                    .stroke(lineWidth: 15.0)
                    .opacity(0.3)
                    .foregroundColor(Color.blue)
                    .shadow(color: .blue, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                
                Circle()
                    .trim(from: 0.0, to: min(self.progress, 1.0))
                    .stroke(style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear, value: self.progress)
            }
            
            
            
            HStack(alignment: .center) {
                Text(String(format: "%.0f%%", min(self.progress, 1.0) * 100.0))
                    .font(.custom("Roboto-Medium", size: 40))
                
            }
        }
        .frame(width: 150, height: 150)
        .padding()
    }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing(progress: 0, complete: false)
    }
}
