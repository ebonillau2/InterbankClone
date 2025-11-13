//
//  AuthenticationRoute.swift
//  InterbankClone
//
//  Created by Enrique Bonilla on 8/11/25.
//

import SwiftUI

struct AuthenticationRoute: View {
  @StateObject private var coordinator = AuthCoordinator()
  @State private var dataLoaded: Bool = false
  
  var body: some View {
    NavigationStack(path: $coordinator.path) {
      ZStack {
        coordinator.destination(for: .login)
          .navigationDestination(for: AuthCoordinator.Route.self) { page in
            coordinator.destination(for: page)
          }
          .fullScreenCover(item: $coordinator.fullScreenCover) { item in
            coordinator.buildCover(cover: item)
          }
        LaunchLoader(dataLoaded: $dataLoaded)
          .hide(if: dataLoaded)
      }
      
    }
    .environmentObject(coordinator)
  }
}

#Preview {
  AuthenticationRoute()
}
