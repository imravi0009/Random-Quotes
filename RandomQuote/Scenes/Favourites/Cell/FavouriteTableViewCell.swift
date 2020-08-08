//
//  FavouriteTableViewCell.swift
//  RandomQuote
//
//  Created by Ravi kumar on 08/08/20.
//  Copyright © 2020 Ravi kumar. All rights reserved.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var quoteLabel: UILabel!
    
    func setupCell(item:FavouriteQuotes.Fetch.ViewModel.DisplaybleItem)  {
        quoteLabel.text = item.quoteText
    }

}
