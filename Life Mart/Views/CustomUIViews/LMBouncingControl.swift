//
//  LMBouncingControl.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 11/06/21.
//

import Foundation
import UIKit

class LMBouncingControl:UIControl {
    
    struct UI {
        static let LM_CONTROL_TOUCH_SCALE_DOWN_FACTOR:CGFloat = 0.98
        static let LM_CONTROL_TOUCH_SCALE_UP_FACTOR:CGFloat = 1.05
        static let LM_CONTROL_ANIMATION_DURATION:CFTimeInterval = 0.2
    }
    
    var initialTransform:CGAffineTransform?
    var ignore:Bool = false
    
    override var isHighlighted: Bool {
        didSet {
            if oldValue == isHighlighted {
                return
            }
            if isHighlighted {
                initialTransform = transform
                UIView.animate(withDuration: UI.LM_CONTROL_ANIMATION_DURATION, delay: 0.0, options: [.curveEaseOut], animations: {
                    self.transform = self.transform.scaledBy(x: UI.LM_CONTROL_TOUCH_SCALE_DOWN_FACTOR, y: UI.LM_CONTROL_TOUCH_SCALE_DOWN_FACTOR)
                }, completion: nil)
            }
            else {
                UIView.animate(withDuration: UI.LM_CONTROL_ANIMATION_DURATION, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.2, options: [], animations: {
                    self.transform = self.initialTransform ?? CGAffineTransform.identity
                }, completion: nil)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        isHighlighted = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if ignore {
            return
        }
        if let touch = touches.first {
            let location = touch.location(in: self)
            if bounds.contains(location) {
                sendActions(for: .touchUpInside)
            }
        }
        isHighlighted = false
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        isHighlighted = false
    }
    
}
