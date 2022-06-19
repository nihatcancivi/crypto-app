//
//  CyrptoCurrency.swift
//  CryptoApp
//
//  Created by Nihat on 14.06.2022.
//

import Foundation

struct CryptoCurrency: Codable {
    let currency, price, name: String
    let logoUrl: String

    enum CodingKeys: String, CodingKey {
        case currency, price, name
        case logoUrl = "logo_url"
    }
}

