//
//  ContentView.swift
//  InterbankClone
//
//  Created by Enrique Bonilla on 8/11/25.
//

import SwiftUI

struct LoginScreen: View {
  var body: some View {
    GeometryReader { geo in
      VStack(spacing: 24) {
        // MARK: - Header
        Header()
        
        // MARK: - Greeting
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
        
        // MARK: - Quick actions
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
        
        // MARK: - Bottom login
        VStack(spacing: 24) {
          Button {
            // Face ID Action
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
        .background(Color.theme.primary)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .ignoresSafeArea()
      }
      .background(Color.white.ignoresSafeArea())
    }
  }
}

#Preview {
  LoginScreen()
}
