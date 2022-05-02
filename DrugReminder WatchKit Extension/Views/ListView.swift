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
    
    var body: some View {
        NavigationView{
            List {
                HStack{
                    VStack(alignment: .leading){
                        Text("6:00")
                            .font(.callout)
                        Text("First Drug")
                            .foregroundColor(.orange)
                    }
                    Toggle(isOn: $firstAlertActive) {
                        //action here
                    }
                }
                HStack{
                    VStack(alignment: .leading){
                        Text("7:00")
                            .font(.callout)
                        Text("Second Drug")
                            .foregroundColor(.orange)
                    }
                    Toggle(isOn: $secondAlertActive) {
                        //action here
                    }
                }
                HStack{
                    VStack(alignment: .leading){
                        Text("8:00")
                            .font(.callout)
                        Text("Third Drug")
                            .foregroundColor(.orange)
                    }
                    Toggle(isOn: $thirdAlertActive) {
                        //action here
                    }
                }
                HStack{
                    VStack(alignment: .leading){
                        Text("9:00")
                            .font(.callout)
                        Text("Fourth Drug")
                            .foregroundColor(.orange)
                    }
                    Toggle(isOn: $fourthAlertActive) {
                        //action here
                    }
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
