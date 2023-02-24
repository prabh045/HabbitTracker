//
//  ActivityDetail.swift
//  Habbit Tracker
//
//  Created by Prabhdeep Singh on 23/02/23.
//

import SwiftUI


struct ActivityDetail: View {
    var activity: Activity.ActivityModel
    @ObservedObject var activityRef: Activity
    @State private var completionAmount = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(activity.name)
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(activity.description)
                            .font(.body)
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    VStack(spacing: 2) {
                        Text("Times Completed")
                            .font(.custom("American Typewriter", size: 10))
                        Text("\(activity.completionCount)")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(15)
                            .background(.green)
                            .clipShape(Circle())
                    }
                }
                .padding()
                Button("Completed It!☺️") {
                    if let index = activityRef.items.firstIndex(of: activity) {
                        var newActivity = activity
                        let completion = activity.completionCount
                        newActivity.completionCount = completion + 1
                        activityRef.items[index] = newActivity
                    }
                }
                .padding()
            }
            .background(.white)
            .padding(.all)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ActivityDetail_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetail(activity: Activity.ActivityModel(name: "Basketball", description: "A very fun game to play"), activityRef: Activity())
    }
}
