import SwiftUI

struct ContentView: View {
    @State private var wizardViewModel = WizardViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Houses")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 20)]) {
                    ForEach(wizardViewModel.houses, id: \.self) { house in
                        NavigationLink {
                            HouseDetailsView(house: house)
                                .navigationBarBackButtonHidden()
                        } label: {
                            HouseSelectedView(house: house)
                        }
                    }
                    .padding(.top, 10)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
