//
//  UserViewModel.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 13.03.23.
//

import Foundation

class UserViewModel : ObservableObject{
    @Published var nom : String
    
    @Published var taille : Int
    
    @Published var poids : Int
    
    init(nom: String, taille: Int, poids: Int) {
        self.nom = nom
        self.taille = taille
        self.poids = poids
    }
    
    func updatePoids(newWeight: Int) {
        self.poids = newWeight
    }
    
    func updateTaille(newHeight: Int){
        self.taille = newHeight
    }
    
    func updateNom(newName: String) {
        self.nom = newName
    }
    
    func resetData2(){
        self.poids = 50
        self.taille = 170
    }
}
