//
//  HomeScreen.swift
//  InterbankClone
//
//  Created by Enrique Bonilla on 11/11/25.
//

import SwiftUI

struct HomeScreen: View {
  var body: some View {
    NavigationView {
      Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    .navigationTitle("Home Screen")
//    .navigationBarBackButtonHidden()
  }
}

#Preview {
  NavigationView {
    HomeScreen()
  }
}
