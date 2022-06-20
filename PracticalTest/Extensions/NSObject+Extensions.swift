//
//  NSObject+Extensions.swift
//  PracticalTest
//
//  Created by raviseta on 20/06/22.
//

import Foundation

extension NSObject {
    @objc class var className: String {
        return String(describing: self)
    }

    class var bundle: Bundle {
        return Bundle(for: self)
    }

}
