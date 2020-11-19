//
//  ContentView.swift
//  SwiftUIList
//
//  Created by Bill Martensson on 2020-11-19.
//

import SwiftUI


class FruitProduct : Identifiable
{
    var fruitname = ""
    var fruitprice = 0
    
    init() {
        
    }
    
    init(name : String, price : Int) {
        fruitname = name
        fruitprice = price
    }
}


struct ContentView: View {
    
    var fruits = ["Banan", "Äpple", "Kiwi", "Äpple"]
    var fruitprice = [8,54,72,9]

    
    @State var fruitstuff = [FruitProduct]()
    
    var body: some View {
        
        VStack {
            Text("Hello, world!")
                .padding()
            
            /*
            List {
                ForEach(1..<1000) { number in
                    HStack {
                        Text("ABC \(number)")
                        Spacer()
                        Text("Mer")
                    }
                }
            }
            */
            /*
            List(0..<fruits.count) { number in
                HStack {
                    Text("ABC \(fruits[number])")
                    Spacer()
                    Text("Pris: \(fruitprice[number])")
                }
            }
            */
            
            Button(action: {
                var tempFruit = FruitProduct()
                tempFruit.fruitname = "Banan"
                tempFruit.fruitprice = 67
                
                self.fruitstuff.append(tempFruit)
            }) {
                Text("TRYCK")
            }
            
            
            List(fruitstuff) { currentfruit in
                FruitRowView(currentfruit: currentfruit)
            }
            
        }
        .onAppear() {
            var tempFruit = FruitProduct()
            tempFruit.fruitname = "Päron"
            tempFruit.fruitprice = 34
            
            self.fruitstuff.append(tempFruit)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
