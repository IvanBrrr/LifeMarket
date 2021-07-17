//
//  CompanyCell.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 17/07/21.
//

import UIKit

class CompanyCell: UITableViewCell {

    @IBOutlet weak var mainView: LMBouncingControl!
    @IBOutlet weak var title_label: UILabel!
    @IBOutlet weak var subtitle_label: UILabel!
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
 
    func fill(with item: SearchModelCompany,onAction: VoidBlock? = nil){
        self.actionHandler = onAction
        title_label.text = item.name ?? ""
        subtitle_label.text = item.address ?? ""
       
    }
    
    
    func fillSearch(with item: SearchModelRootClass,onAction: VoidBlock? = nil){
        self.actionHandler = onAction
        title_label.text = item.company?.name ?? ""
        subtitle_label.text = item.company?.address ?? ""
       
    }
}
