//
//  TableViewExtensions.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 16/07/21.
//

import Foundation
import UIKit

extension UITableView {
    public func register(_ cellClass: UITableViewCell.Type) {
        let className = String(describing: cellClass)
        register(cellClass, forCellReuseIdentifier: className)
    }
    
    public func registerNib(_ cellClass: UITableViewCell.Type) {
        let className = String(describing: cellClass)
        register(UINib(nibName: className, bundle: nil),
                 forCellReuseIdentifier: className)
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        let className = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: className, for: indexPath) as! T
    }
}
