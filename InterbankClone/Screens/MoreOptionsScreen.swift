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
      .background(Color.white.shadow(color: .black.opacity(0.05),
                                     radius: 2, x: 0, y: 4))
      
      Spacer()
      
      ScrollView {
        VStack(spacing: 8) {
          OptionRow(icon: "lock", text: "Cambiar de usuario")
            .onTapGesture {
              coordinator.presentFullScreenCover(.customAlert)
            }
          OptionRow(icon: "mappin", text: "Ubícanos")
          OptionRow(icon: "headphones", text: "Contáctanos")
          OptionRow(icon: "pencil", text: "Personalizar pantalla")
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

#Preview {
  MoreOptionsScreen()
    .environmentObject(AuthCoordinator())
}
