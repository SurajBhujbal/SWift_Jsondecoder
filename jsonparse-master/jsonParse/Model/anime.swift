//
//  anime.swift
//  jsonParse
//
//  Created by Apple on 09/07/19.
//  Copyright © 2019 RoxAI. All rights reserved.
//

import Foundation

struct anime:Decodable{
    let data:[data]
}
struct data:Decodable{
    let id:String
    let type:String
    let attributes:attrib
}
struct attrib:Decodable{
    let createdAt:String
    let updatedAt:String
    let slug:String
    let synopsis:String
    let coverImageTopOffset:Int
}
