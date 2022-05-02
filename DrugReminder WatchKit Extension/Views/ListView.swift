//
//  ListView.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 02/05/2022.
//

import SwiftUI

struct ListView: View {
    @State var firstAlertActive = false
    @State var secondAlertActive = false
    @State var thirdAlertActive = false
    @State var fourthAlertActive = false
    
    @State var alarms: [String] = ["First Drug", "Second Drug", "Third Drug", "Fourth Drug"]
    
    var body: some View {
        NavigationView{
            List {
                ForEach(alarms, id: \.self) { alarm in
                    ListRowView(title: alarm)
                }
                Button("New Alarm") {
                    //action to create new alarm
                }
                .padding()
                .foregroundColor(.mint)
              
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
