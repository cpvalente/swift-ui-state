import SwiftUI

struct Login: View {
    @Binding var loggedIn: Bool

    var body: some View {
        VStack {
            Button("Log in") {
                loggedIn.toggle()
            }
        }
    }
}
