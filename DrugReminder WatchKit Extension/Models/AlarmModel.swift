//
//  AlarmModel.swift
//  DrugReminder WatchKit Extension
//
//  Created by Kamil Niemczyk on 02/05/2022.
//

import Foundation

struct AlarmModel: Identifiable {
    let id: String = UUID().uuidString
    let time: Double
    let label: String
    let isActive: Bool
}
