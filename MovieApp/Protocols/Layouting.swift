//
//  Layouting.swift
//  MovieApp
//
//  Created by ProdMac on 6.08.2022.
//

import Foundation
import UIKit

/// Conform to `Layouting` in `UIViewController` that layouts a `Layoutable` `UIView`
protocol Layouting: AnyObject {

    /// `Layoutable` view type
    associatedtype ViewType: UIView & Layoutable

    /// view as a `Layoutable` view type.
    var layoutableView: ViewType { get }

}

extension Layouting where Self: UIViewController {

    /// view as a `Layoutable` view type.
    var layoutableView: ViewType {
        guard let aView = view as? ViewType else {
            fatalError("view property has not been initialized yet, or not initialized as \(ViewType.self).")
        }
        return aView
    }

}
