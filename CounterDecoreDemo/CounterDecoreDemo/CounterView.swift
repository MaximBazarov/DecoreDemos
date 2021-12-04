//
//  CounterView.swift
//  CounterDecoreDemo
//
//  Created by Maxim Bazarov on 04.12.21.
//

import SwiftUI
import Decore

struct CounterView: View {
    @Observe(Counter.self) var counter

    var body: some View {
        Text("\(counter)")
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
