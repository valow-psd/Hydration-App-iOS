//
//  TailleView.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 13.03.23.
//

import SwiftUI

struct TailleView: View {
    @ObservedObject var data:UserViewModel
    
    @Environment(\.presentationMode) var presentationMode
    @State var existingIndex:Int
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Header
            Text("VOTRE TAILLE")
                .font(.largeTitle)
                .bold()
                .padding(.vertical)
            
            
            
            // Goal amount picker
            Picker(selection: $existingIndex, label: Text("Picker"), content: {
                ForEach(100..<210) { number in
                    Text("\(number) cm")
                }
            })
            .pickerStyle(WheelPickerStyle())
            
            
            // Save button
            Button(action: {
                
                data.updateTaille(newHeight: existingIndex)
                self.presentationMode.wrappedValue.dismiss()
                
            }, label: {
                HStack {
                    Text("Sauver votre taille")
                        .font(.custom("Roboto-Medium", size: 20))
                    
                }
                .frame(width: 200, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            })
            .buttonStyle(customButtonStyle())
            
            
            Spacer()
        }
        .padding()
    }
}

struct TailleView_Previews: PreviewProvider {
    static var previews: some View {
        TailleView(data: Constants.sampleModel2, existingIndex: 16)
    }
}
