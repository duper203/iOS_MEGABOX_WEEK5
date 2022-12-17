//
//  공조2.swift
//  Week5
//
//  Created by 김혜수 on 2022/11/16.
//

import Foundation
import UIKit


class movieOne: UIViewController{
    
    var actorlist = ""
    var savei: Int = 0


    @IBOutlet weak var OpenDt: UILabel!
    @IBOutlet weak var typeNm: UILabel!
    @IBOutlet weak var genres: UILabel!
    @IBOutlet weak var showTypes: UILabel!
    @IBOutlet weak var directors: UILabel!
    @IBOutlet weak var actors: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("여기서",cellIndex)
        print(totalData[cellIndex])
        
        
        for i in 0...(totalData.count - 1){
            if (titleList[cellIndex] == totalData[i].movieNm){
                print(cellIndex, ",", titleList[cellIndex])
                print(totalData[i].movieNm)
                
                 savei = i
                
            }
        }
        
        OpenDt.text = totalData[savei].opendate
        typeNm.text = totalData[savei].typenum
        
        genres.text = totalData[savei].genre
        
        showTypes.text = totalData[savei].showtm
        directors.text = totalData[savei].directorname
        
        actors.text = totalData[savei].actorsname

    }
    
}
