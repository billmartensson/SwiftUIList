//
//  PersonDetailView.swift
//  SwiftUIList
//
//  Created by Bill Martensson on 2020-11-19.
//

import SwiftUI

struct PersonDetailView: View {
    
    var detailperson = Person()
    
    var body: some View {
        VStack {
            Text(detailperson.firstname)
                .font(.largeTitle)
            Text(detailperson.lastname)
                .font(.title)
            
        }
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let testperson = Person(id: "", firstname: "Test", lastname: "XYZ")
        PersonDetailView(detailperson: testperson)
    }
}
