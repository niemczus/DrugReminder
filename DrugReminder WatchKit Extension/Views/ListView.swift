//
//  ListView.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 02/05/2022.
//

import SwiftUI
import CoreData

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @EnvironmentObject var cdViewModel: CoreDataViewModel
    
    init() {
        NotificationManager.instance.requestAuthorization()
    }
  
    var body: some View {
        NavigationView{
            List {
                    ForEach(cdViewModel.savedEntities) { alarm in
                        ListRowView(alarm: alarm)
                    }
//                .onDelete(perform: listViewModel.deleteAlarm)
                NavigationLink(destination: AddView()) {
                    Text("New Alarm")
                        .padding()
                        .font(.callout)
                        .foregroundColor(.white)
                }
            }
            .navigationTitle("Alarms")

        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(CoreDataViewModel())
    }
}
