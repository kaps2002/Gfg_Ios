import SwiftUI

struct AsyncImageView: View {
    let wizardImg: String
    
    var body: some View {
        if let url = URL(string: wizardImg) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
        } else {
            Image("noimg")
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    AsyncImageView(wizardImg: "https://ik.imagekit.io/hpapi/hermione.jpeg")
}
