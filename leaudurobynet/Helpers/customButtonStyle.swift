//
//  customButtonStyle.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 11.03.23.
//

import Foundation
import SwiftUI


// Blue fade
struct customButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.6)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 1.02 : 1.0)
    }
}

