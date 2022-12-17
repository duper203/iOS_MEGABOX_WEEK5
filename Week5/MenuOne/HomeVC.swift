//
//  HomeVC.swift
//  Week5
//
//  Created by 김혜수 on 2022/11/15.
//

import Foundation
import UIKit

class HomeVC: UIViewController{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
        
        
        //tableview와 cell들
        tableView.reloadData()
        
        setupTableView()
        
        print("setuptableView")
        
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewdiddisappear")
    }
    
    //MARK - tableview setting
    private func setupTableView(){
            // Register the xib for tableview cell
            tableView.delegate = self
            tableView.dataSource = self

            // #1
            let cellOneNib = UINib(nibName: "cellOne", bundle: nil)
            self.tableView.register(cellOneNib, forCellReuseIdentifier: "cellOne")
            // #2
            let cellTwoNib = UINib(nibName: "cellTwo", bundle: nil)
            self.tableView.register(cellTwoNib, forCellReuseIdentifier: "cellTwo")
            // #3
            let cellThreeNib = UINib(nibName: "cellThree", bundle: nil)
            self.tableView.register(cellThreeNib, forCellReuseIdentifier: "cellThree")
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
                case 0:
                    if let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne") as? cellOne {
                        return cell
                    }
                case 1:
                    if let cell = tableView.dequeueReusableCell(withIdentifier: "cellTwo") as? cellTwo {
                        return cell
                    }
                case 2:
                    if let cell = tableView.dequeueReusableCell(withIdentifier: "cellThree") as? cellThree {
                        
                        cell.cellDelegate = self

                        
                        return cell
                    }
                    
                    
                default:
                    return UITableViewCell()
                }
                
                return UITableViewCell()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            switch indexPath.row {
            case 0:
                return 50
            case 1:
                return 100
            case 2:
                return 300
            default:
                return 80
            }
    }

}

extension HomeVC: CollectionViewCellDelegate{
    func collectionView(collectionviewcell: cellThreeCollectionCell?, index: Int, didTappedInTableViewCell: cellThree) {
        
        print("어쩌구")
        cellIndex = index
        print(cellIndex)
        self.performSegue(withIdentifier: "detailSegue", sender: self)
        
    }
}

        
    

