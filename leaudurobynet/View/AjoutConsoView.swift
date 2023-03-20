//
//  AjoutConsoView.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 07.03.23.
//

import SwiftUI

struct AjoutConsoView: View {
    
    var conso : PersoViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var volume: Int = 0
    
    @State var amountIndex = 9
    @State var drinkIndex = 0
    
    
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    Text("Ajouter une conso")
                        .font(.custom("Roboto-Regular", size: 24))
                        .padding(.leading, 5)
                    
                    Spacer()
                    NavigationLink(
                        destination: ProfilView(data: Constants.sampleModel, data2: Constants.sampleModel2), label: {
                            Image("avatar")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 50, height: 50)
                                .padding(.trailing, 5)
                        }
                    )
                }
                
                
                
                //            Conteneur avec bouteilles
                VStack{
                    HStack{
                        Text("QUANTITÉ PRÉDÉFINIE")
                            .font(.custom("Roboto-Medium", size: 20))
                            .padding(20)
                            .padding(.bottom, -20)
                        Spacer()
                    }
                    HStack{
                        Button{
                            conso.addIntake(amount: 250)
                            self.presentationMode.wrappedValue.dismiss()
                        }label: {
                            VStack{
                                Image("icon-bottle-250")
                                Text("250 mL")
                                    .font(.custom("Roboto-Medium", size: 17))
                                
                            }
                            .padding(10)
                        }
                        .buttonStyle(.plain)
                        
                        
                        Button{
                            conso.addIntake(amount: 330)
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }label: {
                            VStack{
                                Image("icon-bottle-330")
                                Text("330 mL")
                                    .font(.custom("Roboto-Medium", size: 17))
                                
                            }
                            .padding(10)
                        }
                        .buttonStyle(.plain)
                        
                        Button{
                            conso.addIntake(amount: 500)
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }label: {
                            VStack{
                                Image("icon-bottle-500")
                                Text("500 mL")
                                    .font(.custom("Roboto-Medium", size: 17))
                                
                            }
                            .padding(10)
                        }
                        .buttonStyle(.plain)
                        
                        
                    }
                    HStack{
                        Button{
                            conso.addIntake(amount: 750)
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }label: {
                            VStack{
                                Image("icon-bottle-750")
                                Text("750 mL")
                                    .font(.custom("Roboto-Medium", size: 17))
                                
                            }
                            .padding(10)
                        }
                        .buttonStyle(.plain)
                        
                        
                        Button{
                            conso.addIntake(amount: 1000)
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }label: {
                            VStack{
                                Image("icon-bottle-1000")
                                Text("1000 mL")
                                    .font(.custom("Roboto-Medium", size: 17))
                                
                            }
                            .padding(10)
                        }
                        .buttonStyle(.plain)
                        
                        
                        Button{
                            conso.addIntake(amount: 1500)
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }label: {
                            VStack{
                                Image("icon-bottle-1500")
                                Text("1500 mL")
                                    .font(.custom("Roboto-Medium", size: 17))
                                
                            }
                            .padding(.top, 5)
                            .padding(10)
                        }
                        .buttonStyle(.plain)
                        
                        
                    }
                    
                    
                }
                .padding(.top, 10)
                
                VStack{
                    HStack{
                        Text("QUANTITÉ PERSO")
                            .font(.custom("Roboto-Medium", size: 20))
                            .padding(20)
                        Spacer()
                    }
                    
                    //                TextField("Quantité d'eau à ajouter ... (en mL)", value: $volume, formatter: NumberFormatter())
                    //                    .padding(.horizontal)
                    //                    .frame(height: 55)
                    //                    .background(Color(.systemGray4))
                    //                    .cornerRadius(10)
                    
                    
                    
                    
                    Picker(selection: $amountIndex, label: Text("Picker"), content: {
                        ForEach(1..<51) { number in
                            Text("\(number * Constants.Config.intakeIncrement) mL")
                        }
                    })
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 120)
                    
                    HStack{
                        Button() {
                            
                            conso.addIntake(amount: ((amountIndex + 1) * Constants.Config.intakeIncrement))
                            
                            self.presentationMode.wrappedValue.dismiss()
                        }label: {
                            Text("Ajouter de l'eau")
                                .font(.custom("Roboto-Medium", size: 20))
                        }
                        .padding(12)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        
                    }
                    .padding(.top, 10)
                }
                
                
                Spacer()
                
            }
            .padding()
        }
        
    }
    
}


struct AjoutConsoView_Previews: PreviewProvider {
    static var previews: some View {
        AjoutConsoView(conso: Constants.sampleModel, volume: 0)
    }
}
