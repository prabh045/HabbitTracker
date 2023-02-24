//
//  ActivityList.swift
//  Habbit Tracker
//
//  Created by Prabhdeep Singh on 23/02/23.
//

import SwiftUI

struct ActivityList: View {
    @State private var newActivityPresented = false
    @StateObject var activity = Activity()
    var body: some View {
        NavigationView {
            List(activity.items, id: \.self) { activity in
                NavigationLink {
                    ActivityDetail(activity: activity, activityRef: self.activity)
                } label: {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(activity.name)
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(activity.description)
                            .font(.body)
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                    }

                }
            }
            .navigationTitle("Activity List")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem {
                    Button {
                        newActivityPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .fullScreenCover(isPresented: $newActivityPresented) {
                NavigationView {
                    AddActivity(activity: activity)
                }
            }
        }
    }
}

struct ActivityList_Previews: PreviewProvider {
    static var previews: some View {
        ActivityList()
    }
}
