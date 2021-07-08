//
//  exntensions.swift
//  Nasa
//
//  Created by Cole on 25/06/2021.
//  Copyright © 2021 Cole. All rights reserved.
//

import Foundation
import UIKit


//Image downloader Tests Branch

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

//Alert displayer

extension UIViewController {
    //Show a basic alert
    func showAlert(alertText : String, alertMessage : String) {
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Retry", style: UIAlertAction.Style.default, handler: {
        (alert: UIAlertAction!) in
            print("error")
            selfController.viewDidLoad()
        }))
        //Add more actions as you see fit
        self.present(alert, animated: true, completion: nil)
    }
}

