//
//  allData.swift
//  Week5
//
//  Created by 김혜수 on 2022/11/16.
//

import Foundation

//MARK - 선택된 컬렉션뷰의 셀 번째 수
var cellIndex: Int = 0

//MARK - 첫번째 api(10월 1일 예매율 1위부터 10위 영화들) 데이터들 담을 변수
var rankList: [String] = [] //순위
var titleList: [String] = [] //제목
var percentList: [String] = [] //예매율
var imageName = ["공조2", "정직한후보2", "짱구","짱구","짱구","짱구","짱구","짱구","짱구","짱구"] //이미지

var openDateList: [String] = [] //개봉일
var typeNumList: [String] = []
var genresList: [String] = []
var showTmList: [String] = []
var directorsList: [String] = []
var actorsList: [String] = []


//MARK - 두번째, 세번째 api(각 영화상세보기) 데이터들을 담을 배열
struct moviedetail{
    
    var movieNm: String
    var opendate: String
    var typenum: String
    var genre: String
    var showtm: String
    var directorname: String
    var actorsname: String
}

var totalData: [moviedetail] = []


//MARK - 프로필 메뉴의 컬렉션뷰에서 사용할 이미지의 이름들
var imgName = ["page1", "page2", "page3", "page4"]
