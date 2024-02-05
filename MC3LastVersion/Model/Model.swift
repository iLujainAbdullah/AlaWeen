
//  Model.swift
//  t
//
//  Created by Lujain Abdullah Halabi Almeri on 15/07/1445 AH.
//

// to communicate with cloudkit (view > model > cloudKit)
import Foundation
import CloudKit

//Aggregate model
@MainActor
class Model: ObservableObject{
    
    enum CloudKitHelperError: Error {
        case castFailure
    }
    
    private var db = CKContainer(identifier: "iCloud.MC3Project").publicCloudDatabase //public
    
    
    
    @Published private var itemDictionary: [CKRecord.ID: place] = [:]
    @Published private var cafeDictionary: [CKRecord.ID: place] = [:]
    @Published private var restaurantDictionary: [CKRecord.ID: place] = [:]
    @Published private var goingOutDictionary: [CKRecord.ID: place] = [:]
    @Published private var taskDictionary: [CKRecord.ID: place] = [:]
    @Published private var entertainmentDictionary: [CKRecord.ID: place] = [:]
    
    var places: [place] {
        itemDictionary.values.compactMap {$0}
    }
    var cafes: [place] {
        cafeDictionary.values.compactMap {$0}
    }
    var restaurants: [place] {
        restaurantDictionary.values.compactMap {$0}
    }
    var goingOut: [place] {
        goingOutDictionary.values.compactMap {$0}
    }
    var tasks: [place] {
        taskDictionary.values.compactMap {$0}
    }
    var entertainment: [place] {
        entertainmentDictionary.values.compactMap {$0}
    }
    
    
    func addItem(element: place){
        db.save(element.record) { record, error in
            guard  error  == nil else{
                print(error?.localizedDescription ?? "an unknown error occurred")
                return
            }
        }
    }
//    
//    
//    func fetchItems(category: String) async throws {
//        let query = CKQuery(recordType: placeKeys.type.rawValue, predicate: NSPredicate(format: "category == %@", "\(category)"))
//        
//        let result = try await db.records(matching: query)
//        let records = result.matchResults.compactMap { try? $0.1.get() }
//        if (category == "مقاهي"){
//            records.forEach { record in
//                cafeDictionary[record.recordID] = place(record: record)
//            }
//            
//        } else if (category == "تمشية"){
//            records.forEach { record in
//                goingOutDictionary[record.recordID] = place(record: record)
//            }
//            
//        }  else if (category == "إنجاز مهام"){
//            records.forEach { record in
//                taskDictionary[record.recordID] = place(record: record)
//            }
//            
//        } else if (category == "مطاعم"){
//            records.forEach { record in
//                restaurantDictionary[record.recordID] = place(record: record)
//            }
//            
//        } else if (category == "مقاهي"){
//            records.forEach { record in
//                cafeDictionary[record.recordID] = place(record: record)
//            }
//            
//        } else if (category == "ترفيه"){
//            records.forEach { record in
//                entertainmentDictionary[record.recordID] = place(record: record)
//            }
//            
//        }
//
//
//        
//        
//    }
    func fetchItems(category: String) async throws {
        let query: CKQuery
        if category == "إنجاز مهام" {
            query = CKQuery(recordType: placeKeys.type.rawValue, predicate: NSPredicate(format: "category BEGINSWITH %@", "إنجاز مهام"))
        } else {
            query = CKQuery(recordType: placeKeys.type.rawValue, predicate: NSPredicate(format: "category == %@", "\(category)"))
        }

       // let query = CKQuery(recordType: placeKeys.type.rawValue, predicate: NSPredicate(format: predicateFormat))

        let result = try await db.records(matching: query)
        let records = result.matchResults.compactMap { try? $0.1.get() }

        if category == "مقاهي" {
            records.forEach { record in
                cafeDictionary[record.recordID] = place(record: record)
            }
        } else if category == "تمشية" {
            records.forEach { record in
                goingOutDictionary[record.recordID] = place(record: record)
            }
        } else if category == "إنجاز مهام" {
            records.forEach { record in
                taskDictionary[record.recordID] = place(record: record)
            }
        } else if category == "مطاعم" {
            records.forEach { record in
                restaurantDictionary[record.recordID] = place(record: record)
            }
        } else if category == "مقاهي" {
            records.forEach { record in
                cafeDictionary[record.recordID] = place(record: record)
            }
        } else if category == "ترفيه" {
            records.forEach { record in
                entertainmentDictionary[record.recordID] = place(record: record)
            }
        }
    }

    
    func fetchAllItems() async throws {
        let query = CKQuery(recordType: placeKeys.type.rawValue, predicate: NSPredicate(value:true))
        //let query = CKQuery(recordType: placeKeys.type.rawValue, predicate: NSPredicate(format: "category == %@", "\(category)"))
        
        //sort items
        //query.sortDescriptors = [NSSortDescriptor(key: "dateAssigned", ascending: true)]
        let result = try await db.records(matching: query)
        let records = result.matchResults.compactMap { try? $0.1.get() }
        
        records.forEach { record in
            itemDictionary[record.recordID] = place(record: record)
        }
    }
    
}


