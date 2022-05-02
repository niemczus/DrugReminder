//
//  ListRowView.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 02/05/2022.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("7:00")
                    .font(.callout)
                Text(title)
                    .foregroundColor(.orange)
            }
//            Toggle(isOn: $secondAlertActive) {
                //action here
//            }
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "First Drug")
    }
}
