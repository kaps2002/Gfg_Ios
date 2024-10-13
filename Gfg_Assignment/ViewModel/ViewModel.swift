import Foundation

@Observable
class WizardViewModel {
    
    var wizard: [Wizard]?
    var isLoading: Bool = false
    var houses: [String] = ["gryffindor","slytherin","ravenclaw","hufflepuff"]

    func fetchHouseData(house: String, completion: @escaping (Bool) -> Void) {
        let url = "https://hp-api.herokuapp.com/api/characters/house/\(house)"
        APIManager.shared.request(from: url) { [self] result in
            switch result {
            case .success(let houseData):
                wizard = houseData
                completion(true)
            case .failure(_):
                print(4)
                completion(false)
            }
            
        }
        
    }
}

