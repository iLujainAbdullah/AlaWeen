//
//  UserModel.swift
//  MC3LastVersion
//
//  Created by Abrar Ghandurah on 23/07/1445 AH.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String
    
    //Creating a varaible function that formats the Initails of the user to display in the profile page
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        //you can change here to an empty image
        return ""
        
    }//initias
}//UserModel

//Mock_Users
extension User {
    static var MOCK_User = User(id: NSUUID().uuidString, fullName: "محمد يوسف", email: "mohammed@gmail.com")
}
