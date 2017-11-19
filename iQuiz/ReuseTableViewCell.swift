//
//  ReuseTableViewCell.swift
//  iQuiz
//
//  Created by Andrew Liu on 11/5/17.
//  Copyright © 2017 Andrew Liu. All rights reserved.
//

import UIKit

class ReuseTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
