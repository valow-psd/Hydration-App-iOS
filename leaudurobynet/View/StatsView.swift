//
//  ProfilView.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 08.03.23.
//

import SwiftUI
import Combine

struct CustomColorP {
    static let grisClair1 = Color("GrisClair1")
    static let grisClair2 = Color("GrisClair2")
    
    // Add more here...
}

struct StatsView: View {
    
    @ObservedObject var data : PersoViewModel
    @ObservedObject var data2 : UserViewModel
    
    
    @State var addGoalSheet = false
    
    
    var poids : Int = 78
    var taille : Int = 181
    
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    Text("Les stats et objectifs")
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
                
                HStack{
                    Text("STATISTIQUES")
                        .font(.custom("Roboto-Medium", size: 24))
                        .padding(.leading, 5)
                    
                    Spacer()
                    
                    Text("par semaine")
                        .foregroundColor(CustomColorP.grisClair2)
                        .font(.custom("Roboto-Regular", size: 14))
                        .padding(.trailing, 5)
                    
                }
                .padding(.top, 25)
                
                BarChart()
                
                HStack{
                    Text("OBJECTIFS")
                        .font(.custom("Roboto-Medium", size: 24))
                        .padding(.leading, 5)
                    
                    Spacer()
                    
                    Text("cette semaine")
                        .foregroundColor(CustomColorP.grisClair2)
                        .font(.custom("Roboto-Regular", size: 14))
                        .padding(.trailing, 5)
                    
                }
                .padding(.top, 25)
                
                GoalReachedChart(progressed: data.progress, completed: (data.progress == 1))
                
                // Save button
                Button(action: {
                    data.resetData1()
                }, label: {
                    HStack {
                        Text("Réinitialiser les stats")
                            .font(.custom("Roboto-Regular", size: 15))
                            .foregroundColor(.red)
                    }
                    
                    .frame(width: 200, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                })
                .padding(.top, 60)
                .buttonStyle(.borderless)
                
                Spacer()
            }
            .padding()
            
        }
    }
    
    
}



struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(data: Constants.sampleModel, data2: Constants.sampleModel2)
    }
}
