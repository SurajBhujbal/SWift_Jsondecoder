//
//  Structu.swift
//  jsonParse
//
//  Created by Apple on 08/07/19.
//  Copyright © 2019 RoxAI. All rights reserved.
//

import Foundation

struct adata :Decodable {
    var id: Int?
    var name:String?
    var username:String?
    var email:String?
    var address: addr
    var phone:String?
    var website:String?
    var company:company1
}
struct addr:Decodable {
    var street:String?
    var suite:String?
    var city: String?
    var zipcode:String?
    var geo: geo1
}
struct geo1 :Decodable{
    var lat: String?
    var lng:String?
}
struct company1 :Decodable{
    var name:String?
    var catchPhrase:String?
    var bs:String?
}

struct postdata :Decodable{
    let userId:Int
    let id:Int
    let title:String
    let body:String
}

struct com :Decodable{
    let postId: Int
    let id:Int
    let name:String
    let email:String
    let body:String
}
struct albms:Decodable {
    let userId:Int
    let id:Int
    let title:String
}

struct photoss:Decodable {
    let albumId:Int
    let id:Int
    let title:String
    let url:String
    let thumbnailUrl:String
}


struct todos:Decodable{
    let userId:Int
    let id:Int
    let title:String
    let completed:Bool
}
