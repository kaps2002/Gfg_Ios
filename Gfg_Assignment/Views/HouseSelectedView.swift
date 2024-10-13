import SwiftUI

struct HouseSelectedView: View {
    var house: String
    var body: some View {
        VStack {
            Image(house)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 250)
            Text(house.capitalized)
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .foregroundStyle(.black)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray, lineWidth: 2)
                .opacity(0.4)
        )
    }
}

#Preview {
    HouseSelectedView(house: "gryffindor")
}

