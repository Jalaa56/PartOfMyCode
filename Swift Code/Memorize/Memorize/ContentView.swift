//
//  ContentView.swift
//  Memorize
//
//  Created by Jalaa El-ahmadie on 14/07/2020.
//  Copyright © 2020 it'sNormaltolearn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame //rdv sur sceneDelegate ou on va cree le truc la ou est cree le ContentView
    
    var body: some View {
        return HStack(content: {
            // dans le but de les arranger horizontalement les différent views!!! on utilise la fonction HStack POUR prodiure une view!.

            // Dans le but d'avoir de multiple cartes on va insérer un return. ce ForEach qui va nous retourner un View prend deux arguments (un élément qui peut être itéré) et un autre argument qu'appeler content aussi comme zstack où celui-ci va reprendre ce qu'on avait mis dans content du ZStack
            ForEach(viewModel.cardss) { cardo in
                CardView(cardddd: cardo).onTapGesture( perform: {viewModel.chooose(caaard: cardo)})
                   // ZStack(content: {
                   // RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                   // RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                    
                    // Pour se rappeler que foregroudCplor() àtait mis à la fin de cette itération RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 8.9).foregroundColor(Color.orange)
                    // Text("👻")
                    //pour se rappeler qqu'il vient de là. Text("👻").font(Font.largeTitle)
                }
        
        })
         // })
            //    return ZStack(content: {
      //      RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
        //    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
            
            // Pour se rappeler que foregroudCplor() àtait mis à la fin de cette itération RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 8.9).foregroundColor(Color.orange)
          //  Text("👻")
            //pour se rappeler qqu'il vient de là. Text("👻").font(Font.largeTitle)
       // })
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
//        Text("Hello there, World!")
    }
}


// Là on va faire du ENCAPSULATION en gros mieux organiser notre code en créant une autre structure qui produit cette view qu'on cherche
// De plus en va y mettre une condition if


struct CardView: View {
    // on va rajouter une definition a iFaceUp
    // var isFaceUp: Bool //= false
    var cardddd: MemoryGame<String>.Card
    
    var body: some View {
        ZStack(content: {
            if cardddd.isFaceUp {
        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
        RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(cardddd.content)}
            else {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
            }
        })
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
 
