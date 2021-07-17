//
//  ProductCell.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 17/07/21.
//

import UIKit

class ProductCell: UITableViewCell {
    @IBOutlet weak var mainView: LMBouncingControl!
    @IBOutlet weak var title_label: UILabel!
    @IBOutlet weak var price_label: UILabel!
    @IBOutlet weak var brand_label: UILabel!
    @IBOutlet weak var amount_label: UILabel!
    @IBOutlet weak var mass_label: UILabel!
    @IBOutlet weak var distance_label: UILabel!
    var actionHandler: VoidBlock?

    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.roundedCorners()
        mainView.drawShadow(forOpacity: 0.01, forOffset: .zero)
        
        mainView.addTarget(self, action: #selector(actionPerformed), for: .touchUpInside)

    }
    
    @objc private func actionPerformed() {
        self.actionHandler?()
    }

  
    
    func fill(with item: SearchModelRootClass,onAction: VoidBlock? = nil){
        self.actionHandler = onAction
        title_label.text = item.product?.name ?? ""
        price_label.text = "\(item.price ?? 0) руб."
        brand_label.text = item.product?.brand?.name ?? ""
        amount_label.text = "\(item.count ?? 0)"
        mass_label.text = item.product?.bulk ?? ""
        distance_label.text = "\(item.distance ?? "Неизвестно")"
    }
    
}
