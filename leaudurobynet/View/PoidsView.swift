//
//  PoidsView.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 13.03.23.
//

import SwiftUI

struct PoidsView: View {
    @ObservedObject var data:UserViewModel
    
    @Environment(\.presentationMode) var presentationMode
    @State var existingIndex:Int
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Header
            Text("VOTRE POIDS")
                .font(.largeTitle)
                .bold()
                .padding(.vertical)
            
            
            
            // Goal amount picker
            Picker(selection: $existingIndex, label: Text("Picker"), content: {
                ForEach(45..<190) { number in
                    Text("\(number) Kg")
                }
            })
            .pickerStyle(WheelPickerStyle())
            
            
            // Save button
            Button(action: {
                
                data.updatePoids(newWeight: existingIndex)
                self.presentationMode.wrappedValue.dismiss()
                
            }, label: {
                HStack {
                    Text("Sauver votre Poids")
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

struct PoidsView_Previews: PreviewProvider {
    static var previews: some View {
        PoidsView(data: Constants.sampleModel2, existingIndex: 16)
    }
}
