//
//  Cards.swift
//  PokerHelper
//
//  Created by Кирилл Софрин on 18.07.2025.
//

import UIKit

enum Card: String {
    case twoOfClubs = "two-of-clubs"
    case threeOfClubs = "three-of-clubs"
    case fourOfClubs = "four-of-clubs"
    case fiveOfClubs = "five-of-clubs"
    case sixOfClubs = "six-of-clubs"
    case sevenOfClubs = "seven-of-clubs"
    case eightOfClubs = "eight-of-clubs"
    case nineOfClubs = "nine-of-clubs"
    case tenOfClubs = "ten-of-clubs"
    case jackOfClubs = "jack-of-clubs"
    case queenOfClubs = "queen-of-clubs"
    case kingOfClubs = "king-of-clubs"
    case aceOfClubs = "ace-of-clubs"
    
    case twoOfDiamonds = "two-of-diamonds"
    case threeOfDiamonds = "three-of-diamonds"
    case fourOfDiamonds = "four-of-diamonds"
    case fiveOfDiamonds = "five-of-diamonds"
    case sixOfDiamonds = "six-of-diamonds"
    case sevenOfDiamonds = "seven-of-diamonds"
    case eightOfDiamonds = "eight-of-diamonds"
    case nineOfDiamonds = "nine-of-diamonds"
    case tenOfDiamonds = "ten-of-diamonds"
    case jackOfDiamonds = "jack-of-diamonds"
    case queenOfDiamonds = "queen-of-diamonds"
    case kingOfDiamonds = "king-of-diamonds"
    case aceOfDiamonds = "ace-of-diamonds"
    
    case twoOfHearts = "two-of-hearts"
    case threeOfHearts = "three-of-hearts"
    case fourOfHearts = "four-of-hearts"
    case fiveOfHearts = "five-of-hearts"
    case sixOfHearts = "six-of-hearts"
    case sevenOfHearts = "seven-of-hearts"
    case eightOfHearts = "eight-of-hearts"
    case nineOfHearts = "nine-of-hearts"
    case tenOfHearts = "ten-of-hearts"
    case jackOfHearts = "jack-of-hearts"
    case queenOfHearts = "queen-of-hearts"
    case kingOfHearts = "king-of-hearts"
    case aceOfHearts = "ace-of-hearts"
    
    case twoOfSpades = "two-of-spades"
    case threeOfSpades = "three-of-spades"
    case fourOfSpades = "four-of-spades"
    case fiveOfSpades = "five-of-spades"
    case sixOfSpades = "six-of-spades"
    case sevenOfSpades = "seven-of-spades"
    case eightOfSpades = "eight-of-spades"
    case nineOfSpades = "nine-of-spades"
    case tenOfSpades = "ten-of-spades"
    case jackOfSpades = "jack-of-spades"
    case queenOfSpades = "queen-of-spades"
    case kingOfSpades = "king-of-spades"
    case aceOfSpades = "ace-of-spades"
    
    var image: UIImage {
        UIImage(named: self.rawValue)!
    }
    
    static var fullDeck: [Card] {
        return [
            .twoOfClubs, .threeOfClubs, .fourOfClubs, .fiveOfClubs,
            .sixOfClubs, .sevenOfClubs, .eightOfClubs, .nineOfClubs,
            .tenOfClubs, .jackOfClubs, .queenOfClubs, .kingOfClubs, .aceOfClubs,
            
            .twoOfDiamonds, .threeOfDiamonds, .fourOfDiamonds, .fiveOfDiamonds,
            .sixOfDiamonds, .sevenOfDiamonds, .eightOfDiamonds, .nineOfDiamonds,
            .tenOfDiamonds, .jackOfDiamonds, .queenOfDiamonds, .kingOfDiamonds, .aceOfDiamonds,
            
            .twoOfHearts, .threeOfHearts, .fourOfHearts, .fiveOfHearts,
            .sixOfHearts, .sevenOfHearts, .eightOfHearts, .nineOfHearts,
            .tenOfHearts, .jackOfHearts, .queenOfHearts, .kingOfHearts, .aceOfHearts,
            
            .twoOfSpades, .threeOfSpades, .fourOfSpades, .fiveOfSpades,
            .sixOfSpades, .sevenOfSpades, .eightOfSpades, .nineOfSpades,
            .tenOfSpades, .jackOfSpades, .queenOfSpades, .kingOfSpades, .aceOfSpades
        ]
    }
}
