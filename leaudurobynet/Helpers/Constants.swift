//
//  Constants.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 11.03.23.
//

import Foundation
import SwiftUI

struct Constants {
    
    // Dummy model
    static var sampleModel = PersoViewModel(amounts: [0])
    static var sampleModel2 = UserViewModel(nom: "Valow", taille: 110, poids: 10)
    
    
    
    // Configuration Constants
    struct Config {
        // UserDefaults Keys
        static let saveKey = "key"
        static let dateKey = "date"
        static let goalKey = "goal"
        
        // Picker increments
        static let intakeIncrement = 50
        static let goalIncrement = 50
        static let baseGoal = 1000
    }
    
    
    // Default values
    struct defaultValues {
        
        // Default amounts for men's intake
        static let goalIndex = 17
        static let goal = goalIndex * Constants.Config.goalIncrement + Constants.Config.baseGoal
        
    }
    
    
}
