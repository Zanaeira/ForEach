//
//  ContentView.swift
//  ForEach
//
//  Created by Suhayl Ahmed on 24/02/2023.
//

import SwiftUI

struct SampleView: View {

  @State var showEditTimeslotSheet = false
  @State var timeslots = ["One", "Two", "Three"]

  var body: some View {
    VStack(spacing: 20) {
      ForEach(Array(timeslots.enumerated()), id: \.element) { index, timeslot in
        Text("\(index): \(timeslot)")
          .onTapGesture {
            showEditTimeslotSheet = true
          }
          .sheet(isPresented: $showEditTimeslotSheet) {
            TimeslotView(timeslot: timeslot, index: index) { newTime in
              timeslots[index] = newTime
            }
          }
      }
    }
  }
}

struct TimeslotView: View {

  let timeslot: String
  let index: Int
  let action: (String) -> Void

  var body: some View {
    Button {
      action("Hello")
    } label: {
      Text("\(index): \(timeslot)")
    }
  }

}
