//
//  Historique.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 11.03.23.
//

import SwiftUI

struct Historique: View {
    
    var historique : PersoModel
    
    var body: some View {
        ZStack {
            
            
            // Info
            HStack {
                Image("tick_circle")
                    .padding(.leading, 20)
                // Amount
                Text(String(historique.amount)+" mL")
                    .font(.custom("Roboto-Medium", size: 17))
                Spacer()
                
                
                // Time entered
                Text(DateHelper.getTimeString(time: historique.date))
                    .font(.custom("Roboto-Regular", size: 15))
                    .foregroundColor(CustomColor.grisClair2)
                Image("icon_calendar")
                    .padding(.trailing, 20)
            }
        }
        
        
    }
}


struct Historique_Previews: PreviewProvider {
    static var previews: some View {
        Historique(historique: Constants.sampleModel.intake[0])
    }
}
