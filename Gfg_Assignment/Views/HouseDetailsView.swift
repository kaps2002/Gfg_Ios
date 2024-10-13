import SwiftUI

struct HouseDetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var wizardViewModel = WizardViewModel()
    var house: String
    @State private var index: Int
    
    init(house: String) {
        self.house = house
        _index = State(initialValue: UserDefaults.standard.integer(forKey: house))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if !wizardViewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                } else {
                    ScrollView {
                        HStack(spacing: 20) {
                            
                            Button {
                                index = max(0,(index - 10))
                                UserDefaults.standard.setValue(index, forKey: house)
                                UserDefaultsManager.shared.setCachedData(wizardViewModel.wizard ?? [], house: house, index: index)
                            } label: {
                                Image(systemName: "chevron.left")
                                    .foregroundStyle(.black)
                            }
                            
                            PaginationView(wizardArray: wizardViewModel.wizard?.count ?? 0, house: house, index: $index, wizard: wizardViewModel.wizard ?? [])
                            
                            Button {
                                if index + 10 < wizardViewModel.wizard?.count ?? 0 {
                                    index = min(index+10, (wizardViewModel.wizard?.count ?? 0))
                                    UserDefaults.standard.setValue(index, forKey: house)
                                    UserDefaultsManager.shared.setCachedData(wizardViewModel.wizard ?? [], house: house, index: index)
                                }
                            } label: {
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.black)
                            }
                            
                        }
                        .padding(.horizontal, 15)
                        .padding(.top, 25)
                        
                        ForEach(index..<min(index+10, (wizardViewModel.wizard?.count ?? 0)), id: \.self) { ind in
                            LazyVStack {
                                WizardInfoView(wizardDetails: wizardViewModel.wizard?[ind])
                            }
                        }
                        
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .task {
                wizardViewModel.fetchHouseData(house: house) { _ in
                    wizardViewModel.isLoading = true
                    UserDefaults.standard.setValue(index, forKey: house)
                }
            }
            .navigationTitle(house.capitalized)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                HStack {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.black)
                }
                
            }))
            .refreshable {
                wizardViewModel.isLoading = false
                wizardViewModel.fetchHouseData(house: house) { _ in
                    wizardViewModel.isLoading = true
                }
            }
        }
    }
}

#Preview {
    HouseDetailsView(house: "gryffindor")
}
