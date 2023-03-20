//
//  ContentView.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 06.03.23.
//

import SwiftUI

struct CustomColor {
    static let grisClair1 = Color("GrisClair1")
    static let grisClair2 = Color("GrisClair2")
    
    // Add more here...
}


struct ContentView: View {
    
    
    
    @ObservedObject var data : PersoViewModel
    @ObservedObject var data2 : UserViewModel
    
    // Booleans for 3 sheet views
    @State var addIntakeSheet = false
    
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                
                Spacer()
                
                VStack {
                    HStack{
                        Text("Bonjour,")
                            .font(.custom("Roboto-Regular", size: 24))
                            .padding(.leading, 5)
                        Text(data2.nom)
                            .font(.custom("Roboto-Medium", size: 24))
                            .fontWeight(.semibold)
                        
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
                    
                    //            DonutChart
                    ZStack{
                        ProgressRing(progress: data.progress, complete: (data.progress == 1))
                        
                    }
                    .padding(.top, 10)
                    
                    
                    //        But et reste
                    HStack{
                        VStack{
                            Text("But")
                                .font(.custom("Roboto-Regular", size: 15))
                                .foregroundColor(.gray)
                                .padding(.leading, 35)
                            Text("\(data.goal)mL")
                                .font(.custom("Roboto-Medium", size: 15))
                            
                        }
                        Text("|")
                        VStack{
                            Text("Actuel")
                                .font(.custom("Roboto-Regular", size: 15))
                                .foregroundColor(.gray)
                                .padding(.trailing, 20)
                            Text("\(data.totalIntake)mL")
                                .font(.custom("Roboto-Medium", size: 15))
                            
                        }
                    }
                    
                    //            Conteneur avec bouteilles
                    HStack{
                        Button{
                            data.addIntake(amount: 250)
                        }label: {
                            VStack{
                                Image("icon_bottle_25_hp")
                                Text("250 mL")
                                    .font(.custom("Roboto-Medium", size: 17))
                                
                            }
                        }.buttonStyle(.plain)
                        
                        Button{
                            data.addIntake(amount: 500)
                            
                        }label: {
                            VStack{
                                Image("icon_bottle_50_hp")
                                Text("500 mL")
                                    .font(.custom("Roboto-Medium", size: 17))
                                
                            }
                        }.buttonStyle(.plain)
                        
                        
                        Button{
                            data.addIntake(amount: 1000)
                            
                        }label: {
                            VStack{
                                Image("icon_bottle_100_hp")
                                Text("1000 mL")
                                    .font(.custom("Roboto-Medium", size: 17))
                                    .padding(.bottom, 20)
                            }
                            
                        }
                        .buttonStyle(.plain)
                        
                    }
                    // Add intake
                    Button(action: { addIntakeSheet.toggle()}, label: {
                        HStack {
                            Text("Ajouter une conso")
                                .font(.custom("Roboto-Medium", size: 17))
                            Image(systemName: "plus.circle")
                                .bold()
                        }
                    })
                    .sheet(isPresented: $addIntakeSheet, content: {
                        AjoutConsoView(conso: Constants.sampleModel)
                        
                    }
                    )
                    .buttonStyle(customButtonStyle())
                    
                    Spacer()
                    
                    
                    VStack{
                        HStack{
                            Text("HISTORIQUE")
                                .font(.custom("Roboto-Medium", size: 20))
                                .padding(20)
                            Spacer()
                        }
                        
                        
                        ZStack{
                            Rectangle()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .opacity(0.05)
                                .frame(height: 125)
                                .padding(-5)
                            VStack{
                                ForEach(data.intake.suffix(3)) { it in
                                    Historique(historique: it)
                                }
                            }
                            .padding(10)
                            
                            
                        }
                        
                    }.padding(.top, 20)
                    
                    Spacer()
                    
                }
                .padding(15)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(data: Constants.sampleModel, data2: Constants.sampleModel2)
    }
}
