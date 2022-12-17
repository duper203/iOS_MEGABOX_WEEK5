//
//  ResponseTwo.swift
//  Week5
//
//  Created by 김혜수 on 2022/11/16.
//

import Foundation

struct movieDetailResponse: Decodable{
    var movieInfoResult: movieInfoResult
    
    struct movieInfoResult: Decodable{
        var movieInfo: movieInfo
    }
    
    struct movieInfo: Decodable{
        var movieNm: String
        var showTm: String
        var openDt: String
        var typeNm: String
        var genres: [genres]
        var directors: [directors]
        var actors: [actors]
        
    }
    
    struct genres: Decodable{
        var genreNm: String
    }
    struct directors: Decodable{
        var peopleNm: String
    }
    struct actors: Decodable{
        var peopleNm: String
    }
    
    
    
}
