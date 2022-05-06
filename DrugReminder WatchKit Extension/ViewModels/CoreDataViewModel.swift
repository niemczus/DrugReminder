//
//  CoreDataViewModel.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 06/05/2022.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [Alarm] = []
    
    init() {
        container = NSPersistentContainer(name: "DrugReminder")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            } else {
                print("Successfully loading CoreData")
            }
        }
        fetchAlarms()
    }
    func fetchAlarms() {
        let request = NSFetchRequest<Alarm>(entityName: "Alarm")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
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
