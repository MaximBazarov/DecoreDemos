//
//  ContentView.swift
//  CounterDecoreDemo
//
//  Created by Maxim Bazarov on 04.12.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            CounterView()
            CounterControlsView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
