//
//  Layoutable.swift
//  MovieApp
//
//  Created by ProdMac on 6.08.2022.
//

import Foundation
import UIKit
import SnapKit

/// Conform to `Layoutable` in `UIView` classes to setup its subviews and autolayout.
protocol Layoutable: AnyObject {

    /// Setup the view and it's subviews here.
    func setupViews()

    /// Add layout code here.
    func setupLayout()

}

// MARK: - Default implementation for UIView.
extension Layoutable where Self: UIView {

    /// Create view.
    ///
    /// - Parameters:
    ///   - setupViews: whether to call `setupViews` method or not. _default value is true_
    ///   - setupLayout: whether to call `setupLayout` method or not. _default value is true_
    /// - Returns: `self`
    static func create(setupViews: Bool = true, setupLayout: Bool = true) -> Self {
        let view = Self()
        if setupViews {
            view.setupViews()
        }
        if setupLayout {
            view.setupLayout()
        }
        return view
    }

}
