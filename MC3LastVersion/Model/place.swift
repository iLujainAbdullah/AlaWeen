
//  item.swift
//  t
//
//  Created by Lujain Abdullah Halabi Almeri on 15/07/1445 AH.
//

import Foundation
import CloudKit

enum placeKeys: String {
    case type = "item"
    case name
//    case minPrice
//    case maxPrice
    case price
    case rushHour
    case accessability
    case music
    case overview
    case link
    case coments
    case img
    case category
}

struct place{
    var recordID: CKRecord.ID?
    let name: String
//    let minPrice: Int
//    let maxPrice: Int
    let price: String
    let rushHour: String
    let accessability: Bool
    let music: Bool
    let overview: String
    let link: String
    let img: String
    let category: String
    //let comments: [comment]
    
}

extension place {
    init?(record: CKRecord){
        guard let name = record[placeKeys.name.rawValue] as? String,
//              let minPrice = record[placeKeys.minPrice.rawValue] as? Int,
//              let maxPrice = record[placeKeys.maxPrice.rawValue] as? Int,
              let price = record[placeKeys.price.rawValue] as? String,
              let rushHour = record[placeKeys.rushHour.rawValue] as? String,
              let accessability = record[placeKeys.accessability.rawValue] as? Bool,
              let music = record[placeKeys.music.rawValue] as? Bool,
              let overview = record[placeKeys.overview.rawValue] as? String,
              let link = record[placeKeys.link.rawValue] as? String,
              let img = record[placeKeys.img.rawValue] as? String,
              let category = record[placeKeys.category.rawValue] as? String

        else {
            return nil
        }
        
        self.init(recordID: record.recordID, name: name, price: price, /*minPrice: minPrice, maxPrice: maxPrice,*/ rushHour: rushHour, accessability: accessability, music: music, overview: overview, link: link, img: img, category: category /*, comment*/)
        
    }
}
extension place {
    
    var record: CKRecord{
        let record = CKRecord(recordType: placeKeys.type.rawValue)
        record[placeKeys.name.rawValue] = name
//        record[placeKeys.minPrice.rawValue] = minPrice
//        record[placeKeys.maxPrice.rawValue] = maxPrice
        record[placeKeys.price.rawValue] = price
        record[placeKeys.rushHour.rawValue] = rushHour
        record[placeKeys.accessability.rawValue] = accessability
        record[placeKeys.music.rawValue] = music
        record[placeKeys.overview.rawValue] = overview
        record[placeKeys.link.rawValue] = link
        record[placeKeys.img.rawValue] = img
        record[placeKeys.category.rawValue] = category
        return record
    }
}
