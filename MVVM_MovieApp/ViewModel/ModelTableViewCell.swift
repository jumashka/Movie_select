//
//  ModelTableViewCell.swift
//  MVVM_MovieApp
//
//  Created by Juma on 9/1/21.
//

import UIKit

class ModelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imag: UIImageView!

    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var releaselbl: UILabel!
    @IBOutlet weak var poplaritylbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
  
}
