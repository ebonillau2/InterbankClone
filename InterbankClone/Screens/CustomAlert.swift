//
//  PopOverAlert.swift
//  InterbankClone
//
//  Created by Enrique Bonilla on 10/11/25.
//

import SwiftUI

struct CustomAlert: View {
  @Environment(\.dismiss) var dismiss
  
  var title: String = "¿Deseas cambiar de\nusuario?"
  var message: String = "Borraremos los datos que están\nguardados para el inicio de sesión\nde tu Interbank App y deberás\ningresarlos nuevamente."
  
  var body: some View {
    ZStack {
      Color.black.opacity(0.3).ignoresSafeArea()
      VStack(spacing: 5) {
        ZStack(alignment: .top) {
          VStack {
            TrailingXButton {
              dismiss()
            }
            .padding([.top, .trailing], 5)
          }
          ZStack {
            Circle()
              .fill(Color.cyan.opacity(1))
              .frame(width: 120, height: 120)
            
            Image("alert_icon")
              .resizable()
              .scaledToFit()
              .frame(width: 80, height: 80)
              .foregroundColor(Color.theme.primaryColor)
            
          }
          .padding(.top, 30)
        }
        
        Text(title)
          .font(.title3)
          .multilineTextAlignment(.center)
          .padding(.horizontal)
          .padding(.top, 10)
        
        Text(message)
          .font(.subheadline)
          .foregroundStyle(.black.opacity(0.8))
          .multilineTextAlignment(.center)
          .padding(.horizontal)
          .padding(.top, 5)
        
        VStack(spacing: 10) {
          Button {
          } label: {
            Text("Aceptar")
              .font(.body.weight(.semibold))
              .frame(maxWidth: .infinity)
              .padding(12)
              .background(Color.green)
              .foregroundColor(.white)
              .cornerRadius(5)
          }
          
          Button {
            dismiss()
          } label: {
            Text("Por ahora no")
              .font(.body.weight(.semibold))
              .frame(maxWidth: .infinity)
              .padding(12)
              .background(
                RoundedRectangle(cornerRadius: 5)
                  .stroke(Color.green, lineWidth: 2)
              )
              .foregroundColor(Color.green)
          }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
        .padding(.bottom, 15)
      }
      .background(Color.white)
      .cornerRadius(5)
      .shadow(radius: 10)
      .padding(.horizontal, 30)
    }
    .background(TransparentBackground())
  }
}

/// 🔧 UIViewRepresentable to remove system background
struct TransparentBackground: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let view = UIView()
    DispatchQueue.main.async {
      view.superview?.superview?.backgroundColor = .clear
    }
    return view
  }
  func updateUIView(_ uiView: UIView, context: Context) {}
}

#Preview {
  CustomAlert()
}
