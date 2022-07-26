//
//  ContentView.swift
//  Shared
//
//  Created by Savannah Sosa on 7/26/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
        Text("Hello, world!")
            .padding()
            .foregroundColor(.orange)
        Text("Yo dog")
                .foregroundColor(.pink)
        }
            // Making up stuff to do 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
