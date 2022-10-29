//
//  ContentView.swift
//  TuringSiteTests
//
//  Created by fabiocunha on 04/01/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

/*
struct MyView: View
{
    @State var loading: Bool = false
    var body: some View {
        if loading {
            return Text("Hello")
        }
        else {
            return Button (action: {}) {
                Text ("Tap!")
            }
            
        }
        
    }
    
}
*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
