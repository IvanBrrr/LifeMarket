//
//  VerificationTypeCell.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 11/06/21.
//

import UIKit

class VerificationTypeCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var title_label: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    
    override var isSelected: Bool {
        didSet {
            if isSelected  {
                title_label.textColor = Color.main
                mainView.layer.borderWidth = 1
            }
            else {
                title_label.textColor = #colorLiteral(red: 0.3882352941, green: 0.3882352941, blue: 0.4, alpha: 1)
                mainView.layer.borderWidth = 0
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.roundedCorners()
        mainView.layer.borderColor = Color.main.cgColor
    }
    
    func fill(with item : VerificationTypeModel){
        title_label.text = item.rawValue
        iconView.image = UIImage(named: item.image)
    }

}
