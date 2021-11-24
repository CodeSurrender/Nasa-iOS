//
//  ViewController.swift
//  Nasa
//
//  Created by Cole on 22/06/2021.
//  Copyright © 2021 Cole. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    // hello wednesday
    // Creation
    var a = 100
    @IBOutlet weak var nasaTableView: UITableView!
    let parser = nasaParser()
    var nasaItems = [Item]()
    let myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Position Activity Indicator in the center of the main view
        myActivityIndicator.center = view.center
        
        // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        myActivityIndicator.hidesWhenStopped = true
        
        // Start Activity Indicator
        
        // Call stopAnimating() when need to stop activity indicator
        //myActivityIndicator.stopAnimating()
        view.addSubview(myActivityIndicator)
        
        self.nasaTableView.delegate = self
        self.nasaTableView.dataSource = self
        self.nasaTableView.rowHeight = 100.0
        self.nasaTableView.sectionHeaderHeight = 70
        self.nasaTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.nasaTableView.isUserInteractionEnabled = true
        self.nasaTableView.allowsSelection = true
        selfController = self
        myActivityIndicator.startAnimating()

        parser.parse{
            datax in
            self.nasaItems = datax
            DispatchQueue.main.sync {
                self.nasaTableView.reloadData()
                self.myActivityIndicator.stopAnimating()
            }
        }
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nasaItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = nasaMedia(frame: CGRect(x: 0,y: 0,width: self.view.frame.width,height: 100), title: "nasaMedia")
        
        
        //Organisation of data from the NASA API
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "d MMM, yyyy"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: nasaItems[indexPath.row].data![0].date_created ?? "2009-12-19T00:00:00Z")
        
        let nasaDate = dateFormatterPrint.string(from: date!)
        print("DataX")
        print(nasaItems[indexPath.row].data![0].date_created ?? "missing date")
        let nasaPhotographer = nasaItems[indexPath.row].data![0].photographer ?? "Missing photographer"
        let nasaString =  nasaPhotographer + " | " + nasaDate
        
        //Cell Population
        cell.nasaimageView.downloaded(from: (nasaItems[indexPath.row].links![0].href)!)
        cell.nasaimageView.contentMode = .scaleToFill
        cell.nasatitle.text = nasaItems[indexPath.row].data![0].title
        cell.date.text = nasaString
        cell.date.textColor = .gray
        cell.date.numberOfLines = 0
        cell.date.font = cell.date.font.withSize(18)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Segue activation
        print("SegueTap")
        self.performSegue(withIdentifier: "nasaSegue", sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Opening of Detail View
        if segue.identifier == "nasaSegue" {
            
            if let indexPath = nasaTableView.indexPathForSelectedRow {
                
                let dateFormatterPrint = DateFormatter()
                dateFormatterPrint.dateFormat = "d MMM, yyyy"
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
                let date = dateFormatter.date(from: nasaItems[indexPath.row].data![0].date_created ?? "2009-12-19T00:00:00Z")
                
                let nasaDate = dateFormatterPrint.string(from: date!)
                let nasaPhotographer = nasaItems[indexPath.row].data![0].photographer ?? "Missing photographer"
                let nasaString =  nasaPhotographer + " | " + nasaDate
                let nasaDesc = nasaItems[indexPath.row].data![0].description ?? "Missing descrption"
                
                titleGlobal = nasaString
                descriptionGlobal = nasaDesc
                imageGlobal = nasaItems[indexPath.row].links![0].href ?? ""
                nasaNameText = nasaItems[indexPath.row].data![0].title ?? "Missing title"
            }
        }
    }
    
}


