//
//  movieDetail.swift
//  Week5
//
//  Created by κΉνμ on 2022/11/16.
//

import Foundation
import UIKit

class movieDetail: UIViewController{
    @IBOutlet weak var posterImg: UIImageView!
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterImg.image = UIImage(named: imageName[cellIndex])
    }
}
