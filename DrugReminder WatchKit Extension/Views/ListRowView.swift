//
//  ListRowView.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 02/05/2022.
//

import SwiftUI

struct ListRowView: View {
    
    let alarm: AlarmModel
    
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(alarm.time)
                    .font(.callout)
                Text(alarm.label)
                    .foregroundColor(.orange)
            }
//            Toggle(isOn: alarm.isActive? true : false) {
////                action here
//            }
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var alarm1 = AlarmModel(time: "6:00", label: "alarm1", isActive: true)
    
    static var previews: some View {
    ListRowView(alarm: alarm1)
    }
}
