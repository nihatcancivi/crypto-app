//
//  WebService.swift
//  CryptoApp
//
//  Created by Nihat on 14.06.2022.
//

import Foundation
import Alamofire


class WebService{

    static let shared = WebService()
    private let baseUrl = "https://api.nomics.com/v1/currencies/ticker?key=f31e640a878ffa90a68e968184ad14ede26ba32f"
    private init () {}
    
    typealias WebServiceResponse = (Result<[CryptoCurrency] ,ErrorMessage>) -> ()
    
    //Alamofire
    func downloadCurrencies(completed : @escaping WebServiceResponse){
        guard let url = URL(string: baseUrl) else{
            completed(.failure(.unableToComplete))
            return
        }
        AF.request(url).responseDecodable(of: [CryptoCurrency].self) { response in
            guard let value = response.value else{
                completed(.failure(.unableToComplete))
                return
            }
            completed(.success(value))
            print(value)
        }
    }
    
    
    /* URLSession
    func downloadCurrencies(completed : @escaping WebServiceResponse){
        //let endpoint = baseUrl + "" + key
        guard let url = URL(string: baseUrl) else{
            completed(.failure(.unableToComplete))
            print("0")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error  {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else{
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let cryptoList = try decoder.decode([CryptoCurrency].self, from: data)
                    print(cryptoList)
                    completed(.success(cryptoList))
              
            }catch {
                completed(.failure(.invalidData))
            }        
        }.resume()
    }
     */
}
