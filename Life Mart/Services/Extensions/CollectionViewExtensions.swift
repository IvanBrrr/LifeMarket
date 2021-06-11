//
//  CollectionViewExtensions.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 11/06/21.
//

import Foundation
import UIKit

extension UICollectionView {
    public func register(_ cellClass: UICollectionViewCell.Type) {
        let className = String(describing: cellClass)
        register(cellClass, forCellWithReuseIdentifier: className)
    }
    
    public func registerNib(_ cellClass: UICollectionViewCell.Type) {
        let className = String(describing: cellClass)
        register(UINib(nibName: className, bundle: nil),
                 forCellWithReuseIdentifier: className)
    }
    
    public func registerHeader(_ headerClass: UICollectionReusableView.Type) {
        let className = String(describing: headerClass)
        register(headerClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: className)
    }
    
    public func registerFooter(_ footerClass: UICollectionReusableView.Type) {
        let className = String(describing: footerClass)
        register(footerClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: className)
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        let className = String(describing: T.self)
        return dequeueReusableCell(withReuseIdentifier: className, for: indexPath) as! T
    }
    
    public func dequeueReusableView<T: UICollectionReusableView>(for indexPath: IndexPath, and kind: String) -> T {
        let className = String(describing: T.self)
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: className, for: indexPath) as! T
    }
}
