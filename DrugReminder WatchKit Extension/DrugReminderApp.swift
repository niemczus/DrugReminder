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
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
