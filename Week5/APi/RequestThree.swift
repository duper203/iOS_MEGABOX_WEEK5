//
//  RequestTwoTwo.swift
//  Week5
//
//  Created by 김혜수 on 2022/11/16.
//

import Foundation
import Alamofire
import UIKit

class DataRequestThree{
    
    func MovieDetailData(_ viewController: ViewController){
        
        let url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo?key=8098b9fbb521a2165d7735bc0228471a&movieCd=20219628"
        
        let params: Parameters = [
            "movieCd": "20219628",
            "key": "8098b9fbb521a2165d7735bc0228471a"
        ]
        
        AF.request(url,method: .get, parameters: params, headers: nil).responseDecodable(of: movieDetailResponse.self){ response in
            
            switch response.result{
            case.success(let response):
                //homevc에 있는 함수 didsuccess를 전달해주고 response 매개변수를 호출
                viewController.didSuccessThree(response)
                
                
                
            case.failure(let error):
                print("debug error: \(error.localizedDescription)")
            }
        }
    }
}
