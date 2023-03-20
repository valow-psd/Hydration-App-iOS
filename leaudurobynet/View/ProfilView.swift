//
//  ProfilView.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 13.03.23.
//

import SwiftUI

struct ProfilView: View {
    
    @ObservedObject var data : PersoViewModel
    @ObservedObject var data2 : UserViewModel
    
    
    @State var newName: String = ""
    
    
    @State var addGoalSheet = false
    @State var addTailleSheet = false
    @State var addPoidsSheet = false
    
    var poids : Int = 78
    var taille : Int = 181
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack{
                    HStack{
                        Text("Mon Profil")
                            .font(.custom("Roboto-Regular", size: 24))
                            .padding(.leading, 5)
                        
                        Spacer()
                        
                        Image("avatar")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 50, height: 50)
                            .padding(.trailing, 5)

                    }
                    
                    
                    
                    HStack{
                        Text("ATTENDUS")
                            .font(.custom("Roboto-Medium", size: 24))
                            .padding(.leading, 5)
                        
                        Spacer()
                        
                    }
                    .padding(.top, 25)
                    
                    Text("Nous vous recommendons de boire :")
                        .foregroundColor(CustomColor.grisClair2)
                        .font(.custom("Roboto-Regular", size: 14))
                        .padding(.leading, 5)
                        .padding(.top, 10)
                    
                    Button(action: {addGoalSheet.toggle()}, label:{
                        ZStack(alignment: .center){
                            Rectangle()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .opacity(0.05)
                                .frame(width: 100, height: 40)
                            Text("\(data.goal) mL")
                                .multilineTextAlignment(.center)
                                .font(.custom("Roboto-Medium", size: 20))
                            
                        }
                    })
                    .sheet(isPresented: $addGoalSheet, content: {
                        AjoutObjectif(data: data, existingIndex: data.goalIndex)
                    })
                    .buttonStyle(.plain)
                    
                    
                    HStack{
                        Text("VOS MESURES")
                            .font(.custom("Roboto-Medium", size: 24))
                            .padding(.leading, 5)
                        
                        Spacer()
                        
                    }
                    .padding(.top, 25)
                    
                    HStack{
                        
                        Button(action: {addTailleSheet.toggle()}, label:{
                            ZStack{
                                Rectangle()
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .opacity(0.05)
                                    .frame(width: 100, height: 100)
                                VStack{
                                    Image("icon_rule")
                                        .padding(.bottom, 10)
                                        .padding(.top, 5)
                                    Text("Taille")
                                        .font(.custom("Roboto-Medium", size: 18))
                                    Text("\(data2.taille + 100) cm")
                                        .font(.custom("Roboto-Regular", size: 13))
                                }
                            }
                            .padding()
                        })
                        .sheet(isPresented: $addTailleSheet, content: {
                            TailleView(data: data2, existingIndex: data2.taille)
                        })
                        .buttonStyle(.plain)
                        
                        Button(action: {addPoidsSheet.toggle()}, label:{
                            ZStack{
                                Rectangle()
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .opacity(0.05)
                                    .frame(width: 100, height: 100)
                                VStack{
                                    Image("icon_weight")
                                        .padding(.bottom, 10)
                                        .padding(.top, 5)
                                    Text("Poids")
                                        .font(.custom("Roboto-Medium", size: 18))
                                    Text("\(data2.poids + 45) Kg")
                                        .font(.custom("Roboto-Regular", size: 13))
                                }
                            }
                            .padding()
                        })
                        .sheet(isPresented: $addPoidsSheet, content: {
                            PoidsView(data: data2, existingIndex: data2.poids)
                        })
                        .buttonStyle(.plain)
                    }
                    
                    HStack{
                        Text("VOS INFORMATIONS")
                            .font(.custom("Roboto-Medium", size: 24))
                            .padding(.leading, 5)
                        
                        Spacer()
                        
                    }
                    .padding(.top, 25)
                    
                    VStack{
                        TextField("Entrez votre prénom", text: $newName)
                            .padding(.horizontal)
                            .frame(height: 55)
                            .background(Color(.systemGray4))
                            .cornerRadius(10)
                        
                        
                        // Save button
                        Button(action: {
                            data2.updateNom(newName: newName)
                            
                        }, label: {
                            HStack {
                                Text("Sauver votre prénom")
                                    .font(.custom("Roboto-Medium", size: 20))
                                
                            }
                            .frame(width: 200, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                        .padding(.top, 20)
                        .buttonStyle(customButtonStyle())
                        
                    }
                    Spacer()
                }
                .padding(20)
                
                
            }
        }
        
    }
}


struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView(data: Constants.sampleModel, data2: Constants.sampleModel2)
    }
}
