
import SwiftUI
import Decore

struct FavoriteButton: View {

    var id: TodoList.Item.ID

    @Bind(TodoList.Favorites.self) var favorites

    var body: some View {
        Button(favorites.contains(id) ? "★" : "☆") {
            if favorites.contains(id) {
                favorites.remove(id)
            }
            else {
                favorites.insert(id)
            }
        }
        .buttonStyle(.borderedProminent)
        .frame(minWidth: 64, minHeight: 64, alignment: .center)
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(id: 0)
    }
}
