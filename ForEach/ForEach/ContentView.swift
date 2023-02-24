//
//  ContentView.swift
//  ForEach
//
//  Created by Suhayl Ahmed on 24/02/2023.
//

import SwiftUI

struct ContentView: View {

  @State var showEditTimeslotSheet = false
  @State var timeslots = ["One", "Two", "Three"]
  @State private var selectedTimeslot: Int? {
    didSet {
      print(selectedTimeslot)
      showEditTimeslotSheet = true
    }
  }

  var body: some View {
    VStack(spacing: 20) {
      ForEach(timeslots.indices, id: \.self) { index in
        Text("\(index): \(timeslots[index])")
          .onTapGesture {
            selectedTimeslot = index
          }
      }
    }
    .sheet(isPresented: $showEditTimeslotSheet) {
      if let selectedTimeslot {
        TimeslotView(timeslot: timeslots[selectedTimeslot], index: selectedTimeslot) { newTime in
          timeslots[selectedTimeslot] = newTime
        }
      }
    }
  }
}
