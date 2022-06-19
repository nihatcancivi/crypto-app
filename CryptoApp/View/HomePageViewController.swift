//
//  ViewController.swift
//  CryptoApp
//
//  Created by Nihat on 14.06.2022.
//

import UIKit
import Kingfisher

class HomePageViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Crypto"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        getData()
    }
    func getData(){
        WebService.shared.downloadCurrencies { [weak self] cryptos in
            guard let self = self else { return }
            switch cryptos {
            case .success(let response):
                self.cryptoListViewModel = CryptoListViewModel(cryptoListViewModel: response)
                DispatchQueue.main.async {
                       self.tableView.reloadData()
                }
            case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CryptoTableViewCell
        let cryptoViewModel = cryptoListViewModel.cellForRowAt(indexPath: indexPath.row)
        cell.cryptoName.text = cryptoViewModel.name
        cell.cryptoCurrency.text = cryptoViewModel.currency
        cell.cryptoPrice.text = "$" + cryptoViewModel.price
        cell.cryptoLogo.kf.setImage(with :URL(string: cryptoViewModel.logoUrl))
        return cell
    }

}

