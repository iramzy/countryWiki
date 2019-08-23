//
//  CountryCell.swift
//  CountryWiki
//
//  Created by Mohamed Ahmed on 8/19/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    @IBOutlet weak var countryImage: UIImageView!{
        didSet{
            countryImage.layer.cornerRadius = countryImage.frame.height/2
            countryImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryNativeName: UILabel!
    @IBOutlet weak var countryRegion: UILabel!
    @IBOutlet weak var countryCurrency: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
