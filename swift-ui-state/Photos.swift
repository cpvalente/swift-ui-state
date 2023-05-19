import SwiftUI

struct Photos: View {
    @State var path: [String]

    let photos = ["aa", "bb", "cc", "dd", "ee", "ff", "gg", "hh", "ii", "jj", "kk", "ll", "mm"]
        
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List(photos, id: \.self) { photo in
                    NavigationLink("Detail \(photo)", value: photo)
                }.navigationDestination(for: String.self) { photo in
                    // hide tab navigation
                    PhotosDetail(photoId: photo)
                        .toolbar(.hidden, for: .tabBar)
                }
            }
            .navigationTitle("Photos")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                }
            }
        }.onChange(of: path) { newValue in
            print("photos: path changed \(newValue)")
        }.onAppear() {
            print("photos init \(path)")
        }
    }
}

/*
struct Photos_Previews: PreviewProvider {
    static var previews: some View {
        Photos()
    }
}
*/

struct PhotosDetail: View {
    @State private var isPresenting = false
   
    let photoId: String
    var body: some View {
        VStack {
            Text("Photos Detail \(photoId)")
            Button("ShowModal") {
                isPresenting.toggle()
            }
        }.fullScreenCover(isPresented: $isPresenting, content: PhotosModal.init)
    }
}

struct PhotosModal: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("A full-screen modal view.")
                .font(.title)
            Text("Tap to Dismiss")
        }
        .onTapGesture {
            dismiss()
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(Color.blue)
        .ignoresSafeArea(edges: .all)
    }
}
