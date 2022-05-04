//
//  ListView.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 02/05/2022.
//

import SwiftUI

struct ListView: View {
    
    @State var alarms = []
    @State var firstAlertActive = false
    @State var secondAlertActive = false
    @State var thirdAlertActive = false
    @State var fourthAlertActive = false
    
    @State var defaultAlarms: [AlarmModel] = [
        AlarmModel(time: "06:00", label: "alarm", isActive: true),
        AlarmModel(time: "07:00", label: "alarm 2", isActive: true)
    ]
    
    var body: some View {
        NavigationView{
            List {
                ForEach(defaultAlarms) { alarm in
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
    }
}
