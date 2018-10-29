//
//  TableCellViewController.swift
//  iQuiz
//
//  Created by Sagar Surana on 10/28/18.
//  Copyright © 2018 ischoolsagar. All rights reserved.
//

import UIKit

class TableCellViewController : UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var labelName : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
