//
//  FirebaseView.swift
//  SwiftUIList
//
//  Created by Bill Martensson on 2020-11-19.
//

import SwiftUI
import Firebase


struct Person : Identifiable {
    var id = ""
    
    var firstname = ""
    var lastname = ""
}


struct FirebaseView: View {
    
    @State var textfield_name = ""
    @State var textfield_lastname = ""

    @State var people = [Person]()
    
    
    var body: some View {
        VStack {
            TextField("Namn", text: $textfield_name).padding()

            HStack {
                
                TextField("Efternamn", text: $textfield_lastname)
                
                Button(action: {
                    
                    let ref = Database.database().reference()
                    
                    ref.child("swiftuitest").childByAutoId().setValue(["name": textfield_name, "lastname": textfield_lastname])
                    
                    textfield_name = ""
                    textfield_lastname = ""
                    loadPeople()
                    
                }) {
                    Text("Lägg till")
                }
                
            }.padding()
            
            
            List(people) { currentperson in
                HStack {
                    Text(currentperson.firstname)
                    Text(currentperson.lastname)
                }
                
            }
            
        }
        .onAppear() {
            loadPeople()
        }
    } // SLUT AV BODY
    
    func loadPeople()
    {
        let ref = Database.database().reference()
        
        ref.child("swiftuitest").observeSingleEvent(of: .value, with: { (snapshot) in
            
            var tempPeople = [Person]()
            for child in snapshot.children
            {
                let childdata = child as! DataSnapshot
                
                let child_dict = childdata.value as! [String : String]
                
                var tempPerson = Person()
                tempPerson.id = childdata.key
                tempPerson.firstname = child_dict["name"]!
                tempPerson.lastname = child_dict["lastname"]!
                
                tempPeople.append(tempPerson)
            }
            people = tempPeople
          

          // ...
          }) { (error) in
            print(error.localizedDescription)
        }
    }
    
}

struct FirebaseView_Previews: PreviewProvider {
    static var previews: some View {
        FirebaseView()
    }
}
