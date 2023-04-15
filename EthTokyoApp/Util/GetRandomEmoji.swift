//
//  RandomEmoji.swift
//  EthTokyoApp
//
//  Created by 住居尚弥 on 2023/04/15.
//

import Foundation

func getRandomEmoji() -> String {
    let emojis = ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "😊", "😇"]
    let randomIndex = Int.random(in: 0..<emojis.count)
    return emojis[randomIndex]
}
