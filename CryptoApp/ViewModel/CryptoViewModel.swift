//
//  CryptoViewModel.swift
//  CryptoApp
//
//  Created by Nihat on 14.06.2022.
//

import Foundation

struct CryptoListViewModel {
    let cryptoListViewModel : [CryptoCurrency]
}

struct CryptoViewModel{
    let  cryptoViewModel : CryptoCurrency
    
    var name : String {
        return cryptoViewModel.currency
    }
    
    var currency : String {
        return cryptoViewModel.currency
    }
    
    var price : String {
        return cryptoViewModel.price
    }
    var logoUrl : String {
        return cryptoViewModel.logoUrl
    }
    init(_ crypto : CryptoCurrency){
        self.cryptoViewModel = crypto
    }
}

extension CryptoListViewModel {
    func cellForRowAt(indexPath : Int) -> CryptoViewModel{
        let crypto = cryptoListViewModel[indexPath]
        return CryptoViewModel(crypto)
        
    }
    func numberOfRowsInSection() ->Int{
        return cryptoListViewModel.count
    }
}
