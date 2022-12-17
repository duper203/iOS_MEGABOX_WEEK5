//
//  ViewController.swift
//  Week5
//
//  Created by 김혜수 on 2022/11/14.
//

import UIKit
import AFNetworking
import KakaoSDKAuth
import Alamofire
import KakaoSDKUser
class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("login viewdidload")
        
        
        //api 받아오면 print(request1)
        DataRequest().getMovieData(self)
        
        //api 받아오면 print(request2)
        DataRequestTwo().MovieDetailData(self)
        
        //api 받아오면 print(request3)
        DataRequestThree().MovieDetailData(self)

    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewdidappear")
        
    }
    
    @IBAction func kakaoLogin(_ sender: Any) {
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                }
            }
        }else{
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
               if let error = error {
                 print(error)
               }
               else {
                print("loginWithKakaoAccount() success.")
                
                //do something
                _ = oauthToken
                                   
                //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
                   self.setUserInfo()
                
               }
            }
        }
    }
    
    func setUserInfo(){
        UserApi.shared.me() {(user, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("me() success.")
                        //do something
                        _ = user
                        
                    }
            
                }
    }
    
    
    //MARK - api data1 가죠오기
    func didSuccess(_ response: movieListResponse){
        
        
        let num = response.boxOfficeResult.dailyBoxOfficeList.count
//        print(num)
        
        for i in 0...(num-1){
            let dataRank = response.boxOfficeResult.dailyBoxOfficeList[i].rank
            let dataTitle = response.boxOfficeResult.dailyBoxOfficeList[i].movieNm
            let dataPercent = response.boxOfficeResult.dailyBoxOfficeList[i].salesShare
            let openDate = response.boxOfficeResult.dailyBoxOfficeList[i].openDt
            
            rankList.append(dataRank)
            titleList.append(dataTitle)
            percentList.append(dataPercent)
            openDateList.append(openDate)
            
        }
        
        print("request1")
    }
    
    
    
    
    func didSuccessTwo(_ response: movieDetailResponse){
        
        var actorsName = ""
        var genresText = ""
        
        //영화제목
        let titleTwo =  response.movieInfoResult.movieInfo.movieNm
        //개봉일 저장
        let openDate = response.movieInfoResult.movieInfo.openDt
        
        //타입 저장
        let typeNum = response.movieInfoResult.movieInfo.typeNm
        
        
        //장르 저장
        let numGenre = response.movieInfoResult.movieInfo.genres.count
        for i in 0...(numGenre-1){
            let genresData = response.movieInfoResult.movieInfo.genres[i].genreNm
            genresText.append(genresData+" ")
        }
        
        //상영시간 저장
        let showTm = response.movieInfoResult.movieInfo.showTm
        showTmList.append(showTm)
        
        //감독 이름 저장
        let director = response.movieInfoResult.movieInfo.directors[0].peopleNm
        directorsList.append(director)
        
        //배우 이름 5명만 저장
        
        for i in 0...4{
            let actor = response.movieInfoResult.movieInfo.actors[i].peopleNm
            actorsName.append(actor+" ")
        }
        
        totalData.append(moviedetail(movieNm: titleTwo, opendate: openDate, typenum: typeNum, genre: genresText,showtm: showTm, directorname: director, actorsname: actorsName))
        
        
        print("request2")
    
    
    
    }
    
    func didSuccessThree(_ response: movieDetailResponse){
        
        var actorsName = ""
        var genresText = ""

//        openDateList.append(openDate)
        //영화제목
        let titleTwo =  response.movieInfoResult.movieInfo.movieNm
        
        //개봉일 저장
        let openDate = response.movieInfoResult.movieInfo.openDt
        
        //타입 저장
        let typeNum = response.movieInfoResult.movieInfo.typeNm
        
        typeNumList.append(typeNum)
        
        //장르 저장
        let numGenre = response.movieInfoResult.movieInfo.genres.count
        for i in 0...(numGenre-1){
            let genresData = response.movieInfoResult.movieInfo.genres[i].genreNm
            genresText.append(genresData+" ")
        }
        
        //상영시간 저장
        let showTm = response.movieInfoResult.movieInfo.showTm
        showTmList.append(showTm)
        
        //감독 이름 저장
        let director = response.movieInfoResult.movieInfo.directors[0].peopleNm
        directorsList.append(director)
        
        //배우 이름 5명만 저장
        for i in 0...4{
            let actor = response.movieInfoResult.movieInfo.actors[i].peopleNm
            actorsName.append(actor+" ")
        }
        
        totalData.append(moviedetail(movieNm: titleTwo, opendate: openDate, typenum: typeNum, genre: genresText,showtm: showTm, directorname: director, actorsname: actorsName))
        
    
    print("request3")
    
    }
    
    

}

