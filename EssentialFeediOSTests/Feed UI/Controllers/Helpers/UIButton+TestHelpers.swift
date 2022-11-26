//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Pedro Henrique Calado on 26/11/22.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
