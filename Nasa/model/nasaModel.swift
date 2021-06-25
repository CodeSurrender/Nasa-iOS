//
//  nasaModel.swift
//  Nasa
//
//  Created by Cole on 23/06/2021.
//  Copyright © 2021 Cole. All rights reserved.
//

import Foundation
import UIKit
// MARK: - Temperatures
struct Content: Codable {
    let collection: Collection?
}

// MARK: - Collection
struct Collection: Codable {
    let metadata: Metadata?
    let version: String?
    let href: String?
    let links: [CollectionLink]?
    let items: [Item]?
}

// MARK: - Item
struct Item: Codable {
    let data: [Datum]?
    let href: String?
    let links: [ItemLink]?
}

// MARK: - Datum
struct Datum: Codable {
    let center: Center?
    let nasaID, title, photographer: String?
    let mediaType: MediaType?
    let date_created: String?
    let description: String?
    let keywords: [String]?
    let secondaryCreator, description508, location: String?
    let album: [String]?
}

enum Center: String, Codable {
    case afrc = "AFRC"
    case arc = "ARC"
    case gsfc = "GSFC"
    case hq = "HQ"
    case jpl = "JPL"
    case jsc = "JSC"
    case ksc = "KSC"
}

enum MediaType: String, Codable {
    case image = "image"
    case video = "video"
}

// MARK: - ItemLink
struct ItemLink: Codable {
    let render: MediaType?
    let href: String?
    let rel: Rel?
}

enum Rel: String, Codable {
    case captions = "captions"
    case preview = "preview"
}

// MARK: - CollectionLink
struct CollectionLink: Codable {
    let rel, prompt: String?
    let href: String?
}

// MARK: - Metadata
struct Metadata: Codable {
    let totalHits: Int?
    
    enum CodingKeys: String, CodingKey {
        case totalHits = "total_hits"
    }
}


// Cell class
class nasaMedia: UITableViewCell {
    
    var nasaimageView: UIImageView!
    var nasatitle: UILabel!
    var photographer: UILabel!
    var date: UILabel!
    
    init(frame: CGRect, title: String) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "nasaDetail")
        
        nasaimageView = UIImageView(frame: CGRect(x: 20,y: 10,width: 80,height: 80))
        nasaimageView.backgroundColor = UIColor.lightGray
        nasatitle = UILabel(frame: CGRect(x: 120,y: 10,width: 250,height: 25))
        nasatitle.font = UIFont.boldSystemFont(ofSize: 18)
        nasatitle.numberOfLines = 0
        date = UILabel(frame: CGRect(x: 120,y: 35,width: 250,height: 50))
        date.contentMode = .left

        addSubview(nasaimageView)
        addSubview(nasatitle)
        addSubview(date)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}





