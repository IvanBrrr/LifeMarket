//
//  LMButton.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 11/06/21.
//

import UIKit

@IBDesignable class LMButton: LMBouncingControl {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var button_title_label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    @IBInspectable var buttonTitle:String = "" {
        didSet {
            button_title_label.text = buttonTitle
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        button.isUserInteractionEnabled = false
    }
    @IBInspectable var cornerRadius: CGFloat = 8 {
        didSet {
            layer.cornerRadius = cornerRadius
            layoutIfNeeded()
        }
    }
    @IBInspectable var customBackgroundColor: UIColor = Color.main {
        didSet {
            containerView.backgroundColor = customBackgroundColor
        }
    }
    @IBInspectable var customTextColor: UIColor = .white {
        didSet {
            button_title_label.textColor =  customTextColor
        }
    }
    @IBInspectable var backgroundAlpha: CGFloat = 1.0 {
        didSet {
            containerView.backgroundColor = customBackgroundColor.withAlphaComponent(backgroundAlpha)
        }
    }
    
    @IBInspectable var iconsIsHidden: Bool = true {
        didSet {
            iconView.isHidden = iconsIsHidden
        }
    }
    
    @IBInspectable var icons: UIImage?  {
        didSet {
            iconView.image = icons
        }
    }
    
    @IBInspectable var border: Bool = false {
        didSet {
            if border {
                containerView.layer.borderWidth = 1
                containerView.roundedCorners()
            }
        }
    }
    
    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            containerView.layer.borderColor  =  borderColor.cgColor
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initNib()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupButton()
    }
    
    func initNib() {
        let mainBundle = Bundle(for: LMButton.self)
        mainBundle.loadNibNamed("LMButton", owner: self, options: nil)
        isUserInteractionEnabled = true
        addSubview(containerView)
        containerView.frame = bounds
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        setupButton()
    }
    
  
    
    func setupButton() {
        containerView.backgroundColor = customBackgroundColor
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        
         
    }
  
}
