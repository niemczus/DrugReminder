//
//  TimePicker.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 02/05/2022.
//

import SwiftUI




struct TimePicker: View {
    
    @Binding var seconds: TimeInterval
    
    static let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
    
    var body: some View {
        VStack {
            Spacer()
            Text(Self.formatter.string(from: seconds)!)
                .font(.largeTitle)
                .focusable()
                .digitalCrownRotation(
                    $seconds, from: 0, through: 60 * 60 * 24 - 1, by: 60)
            Spacer()
            
            
            NavigationLink(destination: AddView(seconds: seconds)) {
                Text("Confirm")
                }
                .foregroundColor(.orange)
        }
    }
}

struct TimePicker_Previews: PreviewProvider {
    @State static var midDay: Double = 60
    
    static var previews: some View {
        TimePicker(seconds: $midDay)
    }
}
