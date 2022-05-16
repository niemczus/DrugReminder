//
//  CoreDataViewModel.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 06/05/2022.
//

import SwiftUI
import CoreData

class ListViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var alarms: [Alarm] = []
    
    init() {
        container = NSPersistentContainer(name: "DrugReminder")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            } else {
                self.fetchAlarms()
                print("Successfully loading CoreData")
            }
        }
    }
    
    func fetchAlarms() {
        let request = NSFetchRequest<Alarm>(entityName: "Alarm")
        
        do {
            let fetchedEntities = try container.viewContext.fetch(request)
            alarms = fetchedEntities
        } catch {
            print("Error fetching \(error)")
        }
    }
    
    func addAlarm(time: Double) {
        let newAlarm = Alarm(context: container.viewContext)
        newAlarm.time = time
        newAlarm.id = UUID()
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchAlarms()
        } catch {
            print("Error saving. \(error)")
        }
    }
}
