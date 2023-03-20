//
//  PersoViewModel.swift
//  leaudurobynet
//
//  Created by Valentin Munch on 08.03.23.
//

import Foundation


class PersoViewModel: ObservableObject{
    
    @Published var goal : Int
    
    @Published var date : Date
    
    @Published var progress : Double
    
    @Published var totalIntake : Int
    
    @Published var goalIndex : Int
    
    @Published private(set) var intake:[PersoModel]{
        didSet{
            save()
        }
    }

    
    init(persoModel : PersoModel){
        self.goalIndex = Constants.defaultValues.goalIndex
        self.goal = Constants.defaultValues.goal
        self.progress = 0.0
        self.totalIntake = 0
        self.date = Date()
        
        if let data = UserDefaults.standard.data(forKey: Constants.Config.saveKey) {
            if let decoded = try? JSONDecoder().decode([PersoModel].self, from: data) {
                self.intake = decoded
            } else {
                self.intake = [PersoModel]()
            }
        } else {
            self.intake = [PersoModel]()
        }
        
        
        if let dateData = UserDefaults.standard.data(forKey: Constants.Config.dateKey) {
            if let decodedDate = try? JSONDecoder().decode(Date.self, from: dateData) {
                
                if !Calendar.current.isDateInToday(decodedDate) {
                    self.intake = [PersoModel]()
                }
            }
        }
        
        if let goalData = UserDefaults.standard.data(forKey: Constants.Config.goalKey) {
            if let decodedGoalIndex = try? JSONDecoder().decode(Int.self, from: goalData) {
                self.goalIndex = decodedGoalIndex
            }
        }
        
        self.updateData()
        
    }
    
    init(amounts:[Int]){
        self.date = Date()
        self.goalIndex = Constants.defaultValues.goalIndex
        self.goal = Constants.defaultValues.goal
        self.progress = 0.0
        self.totalIntake = 0
        self.intake = [PersoModel]()
        
        
        for i in (0..<amounts.count) {
            self.addIntake(amount: amounts[i])
        }
        
    }
    
    private func save(){
        if let encoded = try? JSONEncoder().encode(intake) {
            UserDefaults.standard.set(encoded, forKey: Constants.Config.saveKey)
        }
        
        if let encodedDate = try? JSONEncoder().encode(date) {
            UserDefaults.standard.set(encodedDate, forKey: Constants.Config.dateKey)
        }
        
        if let encodedGoalIndex = try? JSONEncoder().encode(goalIndex) {
            UserDefaults.standard.set(encodedGoalIndex, forKey: Constants.Config.goalKey)
        }
    }
    
    private func updateTotal(){
        var total = 0
        for i in (0..<self.intake.count){
            total += self.intake[i].amount
        }
        self.totalIntake = total
    }
    
    private func updateProgress(){
        self.progress = min(Double(totalIntake)/Double(goal), 1.0)
    }
    
    private func updateData() {
        self.goal = self.goalIndex * Constants.Config.goalIncrement + Constants.Config.baseGoal
        self.updateTotal()
        self.updateProgress()
    }
    
    func addIntake(amount:Int){
        self.intake.append(PersoModel(amount: amount))
        self.updateData()
    }
    
    func removeIntake(offset: IndexSet) {
        self.intake.remove(atOffsets: offset)
        self.updateData()
    }
    

    func logIntake() {
        self.intake = [PersoModel]()
        self.updateData()
    }
    
    func resetData1(){
        self.progress = 0
        self.totalIntake = 0
    }
    

    func saveGoal(index: Int) {
        self.goalIndex = index
        self.goal = self.goalIndex * Constants.Config.goalIncrement + Constants.Config.baseGoal
        updateData()
        save()
    }
    
    
    
    
}
