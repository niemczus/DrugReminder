//
//  AddView.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 02/05/2022.
//

import SwiftUI

struct AddView: View {
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    Text("6:00")
                        .font(.title2)
                    Button("Change time"){
                        
                    }
                        .foregroundColor(.orange)
                }
                VStack(alignment: .leading) {
                    Text("Alarm")
                        .font(.title2)
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
