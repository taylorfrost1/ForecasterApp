//
//  WeatherTableViewCell.swift
//  WeatherApp2
//
//  Created by Taylor Frost on 6/23/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var cityTableViewLabel: UILabel!
    @IBOutlet weak var zipcodeTableViewLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
