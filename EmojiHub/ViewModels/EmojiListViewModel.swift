//
//  EmojiListViewModel.swift
//  EmojiHub
//
//  Created by Aigerim Zharylkassyn on 4/27/25.
//

import Foundation
import Combine

class EmojiListViewModel: ObservableObject {
  @Published var emojis: [Emoji] = []
  @Published var searchText = ""
  @Published var selectedCategory = ""
  @Published var sortAlpha = false

  private var service = EmojiService()
  private var cancellables = Set<AnyCancellable>()

  init() {
    Publishers.CombineLatest3($searchText, $selectedCategory, $sortAlpha)
      .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
      .sink { [weak self] (search, category, sort) in
        self?.load(search: search, category: category, sortAlpha: sort)
      }
      .store(in: &cancellables)
  }

  func load(search: String, category: String, sortAlpha: Bool) {
    service.fetchEmojis(search: search,
                        category: category,
                        sortAlpha: sortAlpha)
      .sink(receiveCompletion: { _ in },
            receiveValue: { [weak self] in self?.emojis = $0 })
      .store(in: &cancellables)
  }
}
