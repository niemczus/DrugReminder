//
//  DrugReminderApp.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 02/05/2022.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 VievModel - manages Models for View
 
 */


@main
struct DrugReminderApp: App {
    
    let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) var scenePhase
   
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            .environmentObject(listViewModel)
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .background:
                print("Scene is in background")
                persistenceController.save()
            case .inactive:
                print("Scene is inactive")
            case .active:
                print("Scene is active")
            @unknown default:
                print("default scene :)")
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
