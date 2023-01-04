//
//  UIViewController+Extension.swift
//  USFarmData
//
//  Created by Admin on 1/4/23.
//

import UIKit

extension UIViewController {
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
