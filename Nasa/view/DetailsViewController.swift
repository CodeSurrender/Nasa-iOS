//
//  DetailsViewController.swift
//  Nasa
//
//  Created by Cole on 24/06/2021.
//  Copyright © 2021 Cole. All rights reserved.
//

import UIKit

var descriptionGlobal = String()
var titleGlobal = String()
var imageGlobal = String()
var alertTitleGlobal = String()
var alertMessageGlobal = String()
var alertOptionGlobal = String()
var errorCheck = 0
var apiData = [Item]()
var selfController = UIViewController()
var nasaNameText = String()

class DetailsViewController: UIViewController {

    //Variable Creation
    @IBOutlet weak var nasaDetailImage: UIImageView?
    @IBOutlet weak var nasaDetailTitle: UILabel?
    @IBOutlet weak var nasaDetailDescription: UILabel?
    @IBOutlet weak var nasaName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nasaDetailImage?.contentMode = .scaleToFill
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    //User element initialization
        self.nasaDetailImage?.downloaded(from: imageGlobal)
        self.nasaDetailImage?.contentMode = .scaleToFill
        self.nasaDetailDescription?.text = descriptionGlobal
        self.nasaDetailDescription?.numberOfLines = 0
        self.nasaDetailTitle?.text = titleGlobal
        self.nasaDetailTitle?.textColor = .gray
        self.nasaName.font = UIFont.boldSystemFont(ofSize: 18)
        self.nasaName.text = "Name goes here"
        self.nasaName.numberOfLines = 0
        self.nasaName?.text = nasaNameText
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
