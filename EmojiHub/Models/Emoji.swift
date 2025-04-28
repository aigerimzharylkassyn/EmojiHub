//
//  Emoji.swift
//  EmojiHub
//
//  Created by Aigerim Zharylkassyn on 4/27/25.
//

import Foundation

struct Emoji: Identifiable, Codable {
  let id = UUID()
  let name: String
  let category: String
  let htmlCode: [String]
  let unicode: [String]

  enum CodingKeys: String, CodingKey {
    case name, category, htmlCode = "htmlCode", unicode
  }
}
