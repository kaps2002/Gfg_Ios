
import SwiftUI

struct PaginationView: View {
    var wizardArray: Int
    var house: String
    @Binding var index: Int
    var wizard: [Wizard]
    var body: some View {
        ForEach(0..<wizardArray / 10 + 1 , id: \.self) { ind in
            Button {
                index = ind * 10
                UserDefaults.standard.setValue(index, forKey: house)
                UserDefaultsManager.shared.setCachedData(wizard, house: house, index: index)

            } label: {
                Text(String(ind+1))
                    .padding(15)
                    .foregroundStyle(.black)
                    .background(.yellow)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    PaginationView(wizardArray: 10, house: "gryffindor", index: .constant(10), wizard: [])
}
