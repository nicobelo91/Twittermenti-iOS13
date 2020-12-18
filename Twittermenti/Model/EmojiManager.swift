//
//  EmojiManager.swift
//  Twittermenti
//
//  Created by Nico Cobelo on 18/12/2020.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct EmojiManager {
    
    mutating func chooseEmoji(_ sentimentScore: Int) -> String {
        
        let emoji = ""
        
        switch emoji {
        case _ where sentimentScore > 20:
            return "😍"
        case _ where sentimentScore > 10:
            return "😁"
        case _ where sentimentScore > 0:
            return "🙂"
        case _ where sentimentScore == 0:
            return "😐"
        case _ where sentimentScore > -10:
            return "☹️"
        case _ where sentimentScore > -20:
            return "😡"
        default:
            return "🤮"
        }
        
    }
}
