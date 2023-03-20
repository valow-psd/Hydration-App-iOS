//
//  PersoModel.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 08.03.23.
//

import Foundation

struct PersoModel : Identifiable, Codable {
    var id:UUID
    var amount: Int
    var date: Date
    
    init(amount : Int){
        self.amount = amount
        self.date = Date()
        self.id = UUID()
    }
    
}


