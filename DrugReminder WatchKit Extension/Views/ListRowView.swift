//
//  ListRowView.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 02/05/2022.
//

import SwiftUI

struct ListRowView: View {
    
    let alarm: Alarm
    
    static let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(Self.formatter.string(from: alarm.time)!)
                    .font(.callout)
                Text("Alarm")
                    .foregroundColor(.orange)
            }
        }
    }
}
