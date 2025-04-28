//
//  WelcomeView.swift
//  EmojiHub
//
//  Created by Aigerim Zharylkassyn on 4/27/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
        
            Color(red: 164/255, green: 153/255, blue: 192/255)
                .ignoresSafeArea()

            VStack(spacing: 40) {
                
                Text("Welcome to the Emoji Hub!")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
               
                Text("Browse, search and sort your favorite emojis")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
            
                NavigationLink(destination: EmojiListView()) {
                    Text("Enter App")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.purple)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 40)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                }
            }
            .padding()
        }
    }
}
