//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jalaa El-ahmadie on 15/07/2020.
//  Copyright © 2020 it'sNormaltolearn. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    // on peut avoir de multiple init rappelle on a quatre maniere de initialliser un ROUNDEDRECTANgle(exemples)
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            // cards.append(Card(isFaceUp: <#T##Bool#>, isMatched: <#T##Bool#>, content: <#T##CardContent#>)) voila ce quer veut diure que struct
            // possède un FREE-INITIALIZER car on pas du ecrire un iniz pour que cela nous apparaissent!!!!!!!!!!
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: pairIndex*2))
            cards.append(Card(isFaceUp: false, isMatched: false, content: content, id: pairIndex*2+1))
        }
        
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        var id: Int
    }
    
}
