//
//  MainView.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 11.03.23.
//

import SwiftUI

struct Content: View {
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }

    @State private var selection = 1
    
    var body: some View{
        TabView(selection: $selection){
            
            AjoutConsoView(conso: Constants.sampleModel, volume: 0)
                .tabItem{
                    Label("", systemImage: "plus.circle.fill")
                        .padding(20)
                }
                .tag(0)
            
            ContentView(data: Constants.sampleModel, data2: Constants.sampleModel2)
                .tabItem{
                    Label("", systemImage: "drop.degreesign.fill")
                        .padding(20)
                }
                .tag(1)
            
            
            StatsView(data: Constants.sampleModel, data2: Constants.sampleModel2)
                .tabItem{
                    Label("", systemImage: "person.crop.circle.fill")
                        .padding(20)
                }
                .tag(2)
        
        }
        .accentColor(.blue)
        .onAppear{
            let appearance = UITabBarAppearance()
            
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            
            appearance.backgroundColor = UIColor(Color.white.opacity(0.0))
            
            // Use this appearance when scrolling behind the TabView:
            UITabBar.appearance().standardAppearance = appearance
            // Use this appearance when scrolled all the way up:
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        
        
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Content()
    }
}
