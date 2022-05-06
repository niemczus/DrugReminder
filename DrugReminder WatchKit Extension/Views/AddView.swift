//
//  AddView.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 02/05/2022.
//

import SwiftUI



struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var seconds: TimeInterval = Double(60 * 60 * 12)
    
    static let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
//    var midDay: Double = 60 * 60 * 12
    var label = "Alarm"
    var body: some View {
//        let hours = Int(seconds / 3600)
//        let minutes = Int(seconds.truncatingRemainder(dividingBy: 3600) / 60)
        
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    NavigationLink(destination: TimePicker(seconds: $seconds)) {
//                        Text(minutes < 10 ? "\(hours):0\(minutes)" : "\(hours):\(minutes)")
//                            .font(.title3)
                        Text(Self.formatter.string(from: seconds)!)
                    }
                    Button("Change time") {
                        
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
                    listViewModel.addAlarm(time: seconds, label: label)
                    presentationMode.wrappedValue.dismiss()
//                    ListView().defaultAlarms.sequence.append(AlarmModel(time: time, label: label, isActive: true))
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
