//
//  AddView.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 02/05/2022.
//

import SwiftUI


struct AddView: View {
    
    static let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
    
   
    var time = formatter.string(from: TimePicker().seconds)
    var label = "Alarm"
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    NavigationLink(destination: TimePicker()) {
                        Text(time ?? "00:00")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    Button("Change time"){
                        
                    }
                        .foregroundColor(.orange)
                }
                VStack(alignment: .leading) {
                    Text(label)
                        .font(.title3)
                    Button("Label"){
                        
                    }
                        .foregroundColor(.orange)
                }
                Button("Set Alarm") {
                    
                }
                .foregroundColor(.green)
                .font(.system(size: 25))
            }
            .navigationTitle("New Alarm")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        AddView()
        }
    }
}
