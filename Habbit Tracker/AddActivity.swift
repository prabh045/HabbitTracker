//
//  AddActivity.swift
//  Habbit Tracker
//
//  Created by Prabhdeep Singh on 09/02/23.
//

import SwiftUI

struct AddActivity: View {
    @State private var activityName = ""
    @State private var activityDescription = ""
    @ObservedObject var activity: Activity
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        Form {
            VStack(alignment: .leading, spacing: 10) {
                Label("Activity Name", systemImage: "clock")
                TextField("Activity Name", text: $activityName, prompt: Text("What would you like to do?"))
            }
            VStack(alignment: .leading, spacing: 10) {
                Label("Activity Description", systemImage: "bookmark")
                TextField("Activity Name", text: $activityDescription, prompt: Text("What is it about?"))
            }
        }
        .toolbar {
            ToolbarItem {
                Button {
                    let activity = Activity.ActivityModel(name: activityName, description: activityDescription)
                    self.activity.items.append(activity)
                    dismiss()
                } label: {
                    Text("Done")
                }

            }
        }
    }
}

struct AddActivity_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddActivity(activity: Activity())
        }
    }
}
