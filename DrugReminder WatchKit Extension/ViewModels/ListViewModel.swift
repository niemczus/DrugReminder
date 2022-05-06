//
//  ListViewModel.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 04/05/2022.
//

import Foundation
import CoreData

class ListViewModel: ObservableObject {
    
    @Published var alarms: [AlarmModel] = []
    
    let persistenceController = PersistenceController.shared
    
    init() {
        getAlarms()
    }
    
    func getAlarms() {
        loadFromCD()
        let newAlarms: [AlarmModel] = []
        alarms.append(contentsOf: newAlarms)
    }
    
    func deleteAlarm(indexSet: IndexSet) {
        alarms.remove(atOffsets: indexSet)
    }
    
    func addAlarm(time: Double, label: String, isActive: Bool = true) {
        let newAlarm = AlarmModel(time: time, label: label, isActive: isActive)
        alarms.append(newAlarm)
        
        saveToCD(newAlarm: newAlarm)
    }
    
    func loadFromCD() {
        let context = persistenceController.container.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Alarm")
        do {
            let fetchedObjects = try context.fetch(fetchRequest)
            guard let alarms = fetchedObjects as? [AlarmModel] else { return }
            self.alarms = alarms
        } catch {
            print(error)
        }
    }
    
    func saveToCD(newAlarm: AlarmModel) {
        let context = persistenceController.container.viewContext
        
        let newObject = Alarm(context: context)
        newObject.id = UUID()
        newObject.time = newAlarm.time
            
        persistenceController.save()
    }
}
