//
//  TableView.swift
//  Week5
//
//  Created by 김혜수 on 2022/11/15.
//

import Foundation
import UIKit

class TableView: UITableView{
    
    
    func setupTableView(){
            // Register the xib for tableview cell
            tableView.delegate = self
            tableView.dataSource = self
            // #1
            let curatingCellNib = UINib(nibName: "CuratingCell", bundle: nil)
            self.tableView.register(curatingCellNib, forCellReuseIdentifier: "CuratingCell")
            // #2 #3
            let newsLetterCellNib = UINib(nibName: "NewsLetterCell", bundle: nil)
            self.tableView.register(newsLetterCellNib, forCellReuseIdentifier: "NewsLetterCell")
            // #4
            let categoryCellNib = UINib(nibName: "CategoryCell", bundle: nil)
            self.tableView.register(categoryCellNib, forCellReuseIdentifier: "CategoryCell")
        }
}
