//
//  APINetwork.swift
//  Country
//
//  Created by Radhe on 08/12/23.
//

import Foundation

class APINetwork {
    func fetchCountryData(completion: @escaping (Result<Country, Error>) -> Void) {
        guard let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let country = try decoder.decode(Country.self, from: data)
                completion(.success(country))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

//class CountryRepository: CountryUseCase {
//    private let apiService: APIService
//
//    init(apiService: APIService) {
//        self.apiService = apiService
//    }
//
//    func getCountryData(completion: @escaping (Result<Country, Error>) -> Void) {
//        apiService.fetchCountryData(completion: completion)
//    }
//}
