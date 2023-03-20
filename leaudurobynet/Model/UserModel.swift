//
//  UserModel.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 13.03.23.
//

import Foundation

struct UserModel: Identifiable{
    var id = UUID()
    var nom: String
    var poids: Int
    var taille: Int
    
    init(id: UUID = UUID(), nom: String, poids: Int, taille: Int) {
        self.id = id
        self.nom = nom
        self.poids = poids
        self.taille = taille
    }
}
