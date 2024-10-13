import Foundation
import Alamofire

final class APIManager {
    
    static let shared = APIManager()
    private init() {}
    
    func request(from url: String, completion: @escaping (Result<[Wizard], Error>) -> Void) {
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let houseData = try JSONDecoder().decode([Wizard].self, from: data)
                    completion(.success(houseData))
                } catch {
                    
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
