//
//  AuthenticationRoute.swift
//  InterbankClone
//
//  Created by Enrique Bonilla on 8/11/25.
//

import SwiftUI

struct AuthenticationRoute: View {
  @StateObject private var coordinator = AuthCoordinator()
  
  var body: some View {
    NavigationStack(path: $coordinator.path) {
      coordinator.destination(for: .login)
        .navigationDestination(for: AuthCoordinator.Route.self) { page in
          coordinator.destination(for: page)
        }
    }
    .environmentObject(coordinator)
  }
}

#Preview {
  AuthenticationRoute()
}
