//
//  ListViewModel.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 04/05/2022.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var alarms: [AlarmModel] = []
    
    init() {
        getAlarms()
    }
    
    func getAlarms() {
        let newAlarms = [
            AlarmModel(time: "06:00", label: "alarm", isActive: true),
            AlarmModel(time: "07:00", label: "alarm 2", isActive: true)
        ]
        alarms.append(contentsOf: newAlarms)
    }
    
    func deleteAlarm(indexSet: IndexSet) {
        alarms.remove(atOffsets: indexSet)
    }
    
    func addAlarm(time: String, label: String, isActive: Bool = true) {
        let newAlarm = AlarmModel(time: time, label: label, isActive: isActive)
        alarms.append(newAlarm)
    }
    
}
