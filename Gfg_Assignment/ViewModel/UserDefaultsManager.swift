import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    func setCachedData(_ data: [Wizard], house: String, index: Int) {
        var cachedData: [Wizard] = []
        for i in index..<min(index+10, data.count) {
            cachedData.append(data[i])
        }
        if let encodedData = try? JSONEncoder().encode(cachedData) {
            UserDefaults.standard.set(encodedData, forKey: "cached_\(house)")
        }
    }
    func getCachedData(house: String) -> [Wizard]? {
        if let decodedData = UserDefaults.standard.data(forKey: "cached_\(house)") {
            return try? JSONDecoder().decode([Wizard].self, from: decodedData)
        }
        return nil
    }
}
