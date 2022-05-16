//
//  AddView.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 02/05/2022.
//

import SwiftUI



struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var cdViewModel: ListViewModel
    @State var seconds: TimeInterval = Double(60 * 60 * 12)
    
    static let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
    
    var label = "Alarm"
    var body: some View {
        let hours = Int(seconds / 3600)
        let minutes = Int(seconds.truncatingRemainder(dividingBy: 3600) / 60)
        
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    NavigationLink(destination: TimePicker(seconds: $seconds)) {
                        Text(Self.formatter.string(from: seconds)!)
                    }
                    Button("Change time") { }
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
                    cdViewModel.addAlarm(time: seconds)
                    presentationMode.wrappedValue.dismiss()
                    NotificationManager.instance.scheduleNotification(hour: hours, minutes: minutes)
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
            AddView(seconds: 100)
        }
        .environmentObject(ListViewModel())
    }
}
