//
//  AjoutObjectif.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 11.03.23.
//

import SwiftUI

struct AjoutObjectif: View {
    
    @ObservedObject var data:PersoViewModel
    
    @Environment(\.presentationMode) var presentationMode
    @State var existingIndex:Int
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Header
            Text("VOS OBJECTIFS")
                .font(.largeTitle)
                .bold()
                .padding(.vertical)
            
            
            
            // Goal amount picker
            Picker(selection: $existingIndex, label: Text("Picker"), content: {
                ForEach(0..<41) { number in
                    Text("\(number * 50 + 1000) mL")
                }
            })
            .pickerStyle(WheelPickerStyle())
            
            
            // Save button
            Button(action: {

                data.saveGoal(index: existingIndex)
                self.presentationMode.wrappedValue.dismiss()
                
            }, label: {
                HStack {
                    Text("Sauver votre objectif")
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

struct AjoutObjectif_Previews: PreviewProvider {
    static var previews: some View {
        AjoutObjectif(data: Constants.sampleModel, existingIndex: 16)
    }
}
