//
//  EmojiServices.swift
//  EmojiHub
//
//  Created by Aigerim Zharylkassyn on 4/27/25.
//

import Foundation
import Combine

class EmojiService {
  private let baseURL = URL(string: "https://emoji-hub-proxy-5b6f86f2f5e1.herokuapp.com/api/emojis")!

  func fetchEmojis(search: String = "",
                   category: String = "",
                   sortAlpha: Bool = false) -> AnyPublisher<[Emoji], Error> {
    var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
    components.queryItems = [
      URLQueryItem(name: "search", value: search),
      URLQueryItem(name: "category", value: category),
      URLQueryItem(name: "sort", value: sortAlpha ? "alpha" : "")
    ]

    let request = URLRequest(url: components.url!)
    return URLSession.shared.dataTaskPublisher(for: request)
      .map(\.data)
      .decode(type: [Emoji].self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}
