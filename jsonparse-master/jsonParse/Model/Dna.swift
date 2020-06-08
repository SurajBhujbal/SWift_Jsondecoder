//
//  Dna.swift
//  jsonParse
//
//  Created by Apple on 09/07/19.
//  Copyright © 2019 RoxAI. All rights reserved.
//

import Foundation

struct Title:Decodable {
    var response:response
}

struct response:Decodable {
    var numFound:Int
    var start:Int
    var maxScore:Double
    var docs:[doc]
    
}

struct doc:Decodable {
    var id:String
    var journal:String
    var eissn:String
    var publication_date:String
    var article_type:String
    var author_display: [String]?
    var abstract:[String]?
    var title_display:String
    var score:Double
}






struct WikiData: Decodable {
    var batchcomplete: String?
    var query: Query?
}

struct Query: Decodable {
    var normalized:[normal]?
    var pageids: [String]?
    var pages: [Int: PageData]?
}

struct normal:Decodable {
    var from:String?
    var to:String?
}

struct PageData: Decodable {
    var pageid: Int?
    var ns: Int?
    var title: String?
    var extract: String?
    var thumbnail: Thumbnail?
    var pageimage: String?
}

struct Thumbnail: Decodable {
    var source: URL?
    var width: Int?
    var height: Int?
}



