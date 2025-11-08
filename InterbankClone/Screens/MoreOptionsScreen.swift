//
//  OptionsScreen.swift
//  InterbankClone
//
//  Created by Enrique Bonilla on 8/11/25.
//

import SwiftUI

struct MoreOptionsScreen: View {
  @EnvironmentObject private var coordinator: AuthCoordinator
  
  var body: some View {
    VStack(spacing: 0) {
      // MARK: - Header
      HStack {
        Button(action: {
          coordinator.pop()
        }) {
          Image(systemName: "chevron.left")
            .font(.title2)
            .foregroundColor(.green)
        }
        Spacer()
        Text("Más opciones")
          .font(.title3.weight(.medium))
          .foregroundColor(.primary)
        Spacer()
      }
      .padding()
      .frame(height: 60)
      .background(Color.white.shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 4))
      
      Spacer()
      
      ScrollView {
        VStack(spacing: 8) {
          OptionRow(icon: "lock", text: "Cambiar de usuario", color: .green)
          OptionRow(icon: "mappin", text: "Ubícanos", color: .green)
          OptionRow(icon: "headphones", text: "Contáctanos", color: .green)
          OptionRow(icon: "pencil", text: "Personalizar pantalla", color: .green)
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
      }
      .background(Color.white.ignoresSafeArea())
      
      Spacer()
      
      Text("Versión 21.2")
        .font(.system(size: 14, weight: .semibold))
        .foregroundColor(.black)
        .padding(.bottom, 0)
    }
    .navigationBarBackButtonHidden()
  }
}

// MARK: - Row Component
struct OptionRow: View {
  let icon: String
  let text: String
  let color: Color
  
  var body: some View {
    HStack(spacing: 12) {
      Image(systemName: icon)
        .font(.title)
        .foregroundColor(color)
        .frame(width: 32, height: 32)
      
      Text(text)
        .font(.headline.weight(.medium))
        .foregroundColor(.primary)
      
      Spacer()
      
      Image(systemName: "chevron.right")
        .foregroundColor(.green)
        .font(.caption2.weight(.semibold))
    }
    .padding(.vertical, 10)
    .padding(.horizontal, 14)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Color.white)
        .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 3)
    )
  }
}

#Preview {
  MoreOptionsScreen()
    .environmentObject(AuthCoordinator())
}
