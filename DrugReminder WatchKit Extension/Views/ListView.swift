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
    
    init() {
        NotificationManager.instance.requestAuthorization()
    }
    
    var body: some View {
        NavigationView{
            List {
                ForEach(listViewModel.alarms) { alarm in
                    ListRowView(alarm: alarm)
                }
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
        .environmentObject(ListViewModel())
    }
}
