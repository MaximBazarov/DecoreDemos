import SwiftUI
import Decore

struct CounterControlsView: View {

    @Bind(Counter.self) var counter
    
    var body: some View {
        HStack {
            Spacer()
            Button("-") {
                counter -= 1
            }.padding()
            Button("+") {
                counter += 1
            }.padding()
            Spacer()
        }.padding()
    }
}

struct CounterControlsView_Previews: PreviewProvider {
    static var previews: some View {
        CounterControlsView()
    }
}
