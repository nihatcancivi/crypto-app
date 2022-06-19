//
//  CryptoTableViewCell.swift
//  CryptoApp
//
//  Created by Nihat on 14.06.2022.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var cryptoCurrency: UILabel!
    @IBOutlet weak var cryptoName: UILabel!
    @IBOutlet weak var cryptoPrice: UILabel!
    @IBOutlet weak var cryptoLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
