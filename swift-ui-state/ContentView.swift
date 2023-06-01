import SwiftUI

struct ContentView: View {
    @State private var loggedIn = false
    var body: some View {
            if (loggedIn) {
                AppRouter()
            } else {
                NavigationStack {
                    Login(loggedIn: $loggedIn)
                }
             }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// ? what do we expect path to be
struct AppRouter: View {
    @State var path = [String](["cc"])
    @State var resolver: TabItems = TabItems.photos
    
    init() {
        path.append("aa")
        print("init of app router \(path)")
    }
    
    // albums/id
    var body: some View {
        Tabs(resolver: $resolver, path: $path)
            .onAppear(perform: {
                // ["cc", "aa", "bb"]
                path.append("bb")
                print("appending in app router \(path)")

        })
        
        
        
            .onOpenURL { url in
                path.removeAll()
                path.append("dd")
            }
    }
    
}
