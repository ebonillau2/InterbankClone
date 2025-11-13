//
//  IconTextRevealView.swift
//  InterbankClone
//
//  Created by Enrique Bonilla on 13/11/25.
//

import SwiftUI

struct LaunchLoader: View {
  @State private var showText = false
  @State private var widthRect: CGFloat = 280
  @State private var flipped = false
  @Binding var dataLoaded: Bool

  var body: some View {
    ZStack {
      Color.theme.primaryColor.ignoresSafeArea()
      HStack(spacing: 0) {
        HStack(spacing: 0) {
          Rectangle()
            .fill(Color.theme.primaryColor)
            .frame(width: widthRect, height: 56)
          Image("logotipo")
            .resizable()
            .scaledToFit()
            .frame(width: 56, height: 56)
            .rotation3DEffect(
              .degrees(flipped ? 180 : 0),
              axis: (x: 0, y: 1, z: 0),
              perspective: 0
            )
            .animation(.easeInOut(duration: 1), value: flipped)
            .onAppear {
              flipped = true
            }
        }
        .background(Color.theme.primaryColor)
        .zIndex(1)
        .offset(x: -(widthRect/2))
        
        if showText {
          Text("Interclone")
            .font(.system(size: 48).bold())
            .foregroundColor(.white)
            .frame(width: 250, height: 56)
            .transition(
              .asymmetric(
                insertion: .move(edge: .leading).combined(with: .opacity),
                removal: .opacity
              )
            )
            .offset(x: -(widthRect/2))
        }
      }
      .padding(12)
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.72) {
          withAnimation(.spring(response: 0.8, dampingFraction: 1.4)) {
            showText.toggle()
          }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.72 + 2.7) {
          dataLoaded = true
        }
      }
    }
  }
}

#Preview {
  LaunchLoader(dataLoaded: .constant(false))
}
