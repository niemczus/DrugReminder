//
//  DrugReminderApp.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 02/05/2022.
//

import SwiftUI

@main
struct DrugReminderApp: App {
    
    @Environment(\.scenePhase) var scenePhase
   
    @StateObject var cdViewModel: ListViewModel = ListViewModel()
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(cdViewModel)
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .background:
                print("Scene is in background")
            case .inactive:
                print("Scene is inactive")
            case .active:
                print("Scene is active")
            @unknown default:
                print("default scene :)")
            }
        }
    }
}
