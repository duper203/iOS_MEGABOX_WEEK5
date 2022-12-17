//
//  Request.swift
//  Week5
//
//  Created by 김혜수 on 2022/11/15.
//

import Foundation
import Alamofire
import UIKit
class DataRequest{
    func getMovieData(_ viewController: ViewController){ //"ViewController"VC에서 호출한 getMovieData() 함수
        
        let url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList?key=8098b9fbb521a2165d7735bc0228471a&targetDt=20221001"
        
        let params: Parameters = [
            "targetDt": "20221001",
            "key": "8098b9fbb521a2165d7735bc0228471a"
        ]
        
            AF.request(url,method: .get, parameters: params, headers: nil).responseDecodable(of: movieListResponse.self){ response in //Response.swift 해당되는 변수들로 
                
                switch response.result{
                case.success(let response): //성공하면
                    
                    //homevc에 있는 함수 didsuccess를 전달해주고 response 매개변수를 호출
                    viewController.didSuccess(response)
                    
                case.failure(let error): //성공 못하면
                    print("debug error: \(error.localizedDescription)")
                }
            }
        }
    }
