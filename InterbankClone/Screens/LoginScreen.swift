//
//  ContentView.swift
//  InterbankClone
//
//  Created by Enrique Bonilla on 8/11/25.
//

import SwiftUI
import LocalAuthentication

struct LoginScreen: View {
  @EnvironmentObject private var coordinator: AuthCoordinator
  @State private var biometricsAvailable: Bool = false
  
  var body: some View {
    GeometryReader { geo in
      VStack(spacing: 24) {
        // MARK: - Header
        Header() {
          coordinator.push(page: .moreOptions)
        }

        VStack(spacing: 8) {
          HStack(alignment: .lastTextBaseline, spacing: 6) {
            Text("Hola")
              .font(.title)
              .foregroundColor(Color.theme.primaryText)
            Text("Enrique")
              .font(.title.bold())
              .foregroundColor(Color.theme.primaryText)
          }
          
          Text("¿Qué haremos hoy?")
            .font(.system(size: 19))
            .foregroundColor(Color.theme.primaryText)
        }
        .padding(.top, geo.size.height * 0.125)
        
        HStack(spacing: 16) {
          ActionButton(icon: "lock.fill", title: "Bloquear\ntarjeta")
            .onTapGesture {
              print("Bloquear tarjeta tapped")
            }
          ActionButton(icon: "qrcode", title: "Pagar con\nQR")
            .onTapGesture {
              print("Pagar con QR tapped")
            }
          ActionButton(icon: "iphone", title: "Servicios y\nrecargas")
            .onTapGesture {
              print("Servicios y recargas tapped")
            }
          ActionButton(icon: "message.fill", title: "Plinear a\ncelular")
            .onTapGesture {
              print("Plinear a celular tapped")
            }
        }
        .padding(.horizontal)
        .padding(.top, 12)
        
        VStack(spacing: 24) {
          if biometricsAvailable {
            Button {
              // Face ID Action
              authenticateWithFaceID()
            } label: {
              HStack {
                Image(systemName: "faceid")
                  .font(.title2)
                Text("Ingresar con Face ID")
              }
              .font(.headline)
              .foregroundColor(.white)
              .frame(maxWidth: .infinity)
              .padding(11)
              .background(Color.theme.blueClone)
              .cornerRadius(6)
            }
          }
          
          Button {
            // Password login
          } label: {
            Text("Ingresar con contraseña")
              .foregroundColor(.white)
              .font(.headline)
              .fontWeight(.medium)
          }
          Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.theme.primaryColor)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .ignoresSafeArea()
      }
      .background(Color.white.ignoresSafeArea())
    }
    .onAppear {
      biometricsAvailable = LAContext().canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }
  }
  
  func authenticateWithFaceID() {
    let context = LAContext()
    var error: NSError?
    
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
      context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Te permite iniciar sesion con Face ID") { success, error in
        if success {
          DispatchQueue.main.async {
            coordinator.push(page: .home)
          }
        } else { }
      }
    } else {
      // Biometrics not available
      biometricsAvailable = false
    }
    
//    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
//      DispatchQueue.main.async {
//        if success {
//          self.isAuthenticated = true
//          self.authError = nil
//        } else {
//          self.isAuthenticated = false
//          self.authError = error?.localizedDescription ?? "Authentication failed"
//          
//          // Refresh context on failure (especially after too many attempts)
//          if let laError = error as? LAError {
//            switch laError.code {
//            case .userCancel, .userFallback, .systemCancel:
//              // User-initiated cancellation, no need to refresh
//              break
//            case .authenticationFailed, .passcodeNotSet, .biometryNotAvailable, .biometryNotEnrolled, .biometryLockout:
//              // Refresh context for these errors
//              self.refreshContext()
//            default:
//              break
//            }
//          }
//        }
//      }
    }
  }
  
  #Preview {
    LoginScreen()
      .environmentObject(AuthCoordinator())
  }
