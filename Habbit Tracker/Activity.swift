//
//  Activity.swift
//  Habbit Tracker
//
//  Created by Prabhdeep Singh on 22/02/23.
//

import Foundation

class Activity: ObservableObject {
    struct ActivityModel: Codable, Hashable {
        var name: String
        var description: String
    }
    @Published var items: [ActivityModel] {
        didSet {
            if let data = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(data, forKey: "activities")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "activities") {
            if let decodedData = try? JSONDecoder().decode([ActivityModel].self, from: savedItems) {
                items = decodedData
                return
            }
            items = []
        }
        items = []
    }
}
