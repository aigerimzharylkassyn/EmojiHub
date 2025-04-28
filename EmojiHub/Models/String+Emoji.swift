//
//  String+Emoji.swift
//  EmojiHub
//
//  Created by Aigerim Zharylkassyn on 4/27/25.
//

import Foundation

extension String {
  var unicodeEmoji: String {

    let hex = self.replacingOccurrences(of: "U+", with: "")

    guard let code = Int(hex, radix: 16),
          let scalar = UnicodeScalar(code) else {
      return self
    }
    return String(Character(scalar))
  }
}
