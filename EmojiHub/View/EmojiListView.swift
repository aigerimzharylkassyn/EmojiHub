//
//  EmojiListView.swift
//  EmojiHub
//
//  Created by Aigerim Zharylkassyn on 4/27/25.
//

import SwiftUI

struct EmojiListView: View {
    @StateObject private var vm = EmojiListViewModel()
    private let categories = ["All", "Smileys and People", "Animals and Nature", "Food and Drink", "Activities", "Travel and Places", "Objects", "Symbols", "Flags"]

    var body: some View {
        ZStack {
         
            Color(red: 164/255, green: 153/255, blue: 192/255)
                .ignoresSafeArea()

            VStack(spacing: 16) {
        
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search emojis…", text: $vm.searchText)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                .padding(.horizontal)

       
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(categories, id: \.self) { cat in
                            Button(action: {
                                vm.selectedCategory = cat == "All" ? "" : cat.lowercased()
                            }) {
                                Text(cat)
                                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                                    .background(vm.selectedCategory == cat.lowercased() ? Color.white : Color.white.opacity(0.5))
                                    .foregroundColor(vm.selectedCategory == cat.lowercased() ? .purple : .white)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

           
                Toggle(isOn: $vm.sortAlpha) {
                    Text("Sort A → Z")
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                
             
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(vm.emojis) { emoji in
                            HStack(spacing: 16) {
                                Text((emoji.unicode.first ?? "").unicodeEmoji)
                                    .font(.system(size: 32))
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(emoji.name.capitalized)
                                        .font(.system(size: 18, weight: .bold, design: .rounded))
                                        .foregroundColor(.purple)
                                    Text(emoji.category.capitalized)
                                        .font(.system(size: 14, weight: .medium, design: .rounded))
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .padding(.top)
        }
        .onAppear {
            vm.load(search: "", category: "", sortAlpha: vm.sortAlpha)
        }
    }
}
