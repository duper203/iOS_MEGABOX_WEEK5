//
//  Response.swift
//  Week5
//
//  Created by κΉνμ on 2022/11/15.
//

import Foundation

struct movieListResponse: Decodable{
    
    var boxOfficeResult: boxOfficeResult
    
    
    struct boxOfficeResult: Decodable{
        
        var boxofficeType: String
        var showRange: String
        var dailyBoxOfficeList: [dailyBoxOfficeList]
    }
    
    struct dailyBoxOfficeList: Decodable{
        
        var rank: String
        var movieNm: String
        var salesShare: String
        var openDt: String
    }
}
