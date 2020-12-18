//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jalaa El-ahmadie on 15/07/2020.
//  Copyright © 2020 it'sNormaltolearn. All rights reserved.
//


// ici on 4est dans le ViewModel qui depend of the UI but it s not really a UI thing so we will choose
// swift file and after import UI WE will remplece foundation by swiftUI

import SwiftUI

class EmojiMemoryGame {
    // on appelle cette variable modele pour aider l etudianrt
    // sans le private les view peuvent acceder le modele a travers la varianle model,
    // mais avec private var cette porte leur est ferme alors on rajoute un set pour avoir une porte
    // transparente MAIS le ptobleme avec cette porte transparente c est que les view ne peuvent pas choisir de carte car il ne peuvent pas aller a trvers cette porte. -< INTENT intention
    
    // on va faire cette initialisation des cartes en utilisant INIT!!!!!!!!! grace auquelle numberOfPairsOfCards va fonctionner
    
    // voici la fonction avant de embeded ou inlign it AND make a CLOSURE.
    //    func createCardContent(pairIndex:Int) -> String {
  //      return "😀"
  //  }
    
    // MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: { (pairIndex:Int) -> String in return "😀")}
    
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    // Attention ICI ON A RAJOUTER STATIC AVANT FUNC POUR QUE CELLE CI NE SOIT PLUS une instance method de MemoryGame<String> mais une static method, une method sur le type EmojiMemoryGame. CAR
    // TOUTES les variables doivents etre initialiser dans une class ou struct avant de pouvoir tourner les func ou method!
    // MAIS cette fonction initialise la variable. Et la variable doit etre initialiser avant de runner la methode pour sortir de là
    // il ne faut plus que la fonction soit envoye sur une instance de la clss ou struc mais qu elle deviennent une fomction du type
    // le type EmojiMemoryGame et comme maintenant c'est une fonction du type de la class alors elle peut etre runner avant d'initialiser toutes les variables de la class et initialiser la variable model!!!
    // donc ce n est plus une fonction sur une instance de EmojiMemoryGame  mais sur le type de EmojiMemoryGame!
    
    // cette fontion initalise la variable model et le jeu aussi!
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻","🎃","🤡"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndeex in
            return emojis[pairIndeex]
        }
    }
    
    // MARK: Access to the  Model
    // on va ferme avec une porte opaque et leur donner l image d'une camera sur ce mode exterieur
    // ou j ai encore ajouter un s a cards donc cardss a cette varianble
    var cardss: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    // this function permet aux view d acceder le monde exterieurs!!!!!
    // J ai rajoute un a a card pour bien comprendre de quelle element on parle
    // grace auqueele j ai compris que c est le nom interne de l'argument de la fonction choose auqueele
    // j ai encore rajouter un o pour bien saisir que c est de cette fonction qu'on parle!!!
    func chooose(caaard: MemoryGame<String>.Card) {
        model.choose(card: caaard)
    }
}
