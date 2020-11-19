//
//  FruitRowView.swift
//  SwiftUIList
//
//  Created by Bill Martensson on 2020-11-19.
//

import SwiftUI

struct FruitRowView: View {
    
    var currentfruit = FruitProduct()
    
    var body: some View {
        HStack {
            Text("\(currentfruit.fruitname)").padding()
            Spacer()
            Text("Pris: \(currentfruit.fruitprice)")
                .padding()
        }
    }
}

struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        var testfrukt = FruitProduct(name: "Potatis", price: 23)
        
        
        FruitRowView(currentfruit: testfrukt)
            .previewLayout(.sizeThatFits)
    }
}
