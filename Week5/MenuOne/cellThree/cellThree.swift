//
//  cellThree.swift
//  Week5
//
//  Created by 김혜수 on 2022/11/15.
//

import UIKit

protocol CollectionViewCellDelegate: AnyObject {
    func collectionView(collectionviewcell: cellThreeCollectionCell?, index: Int, didTappedInTableViewCell: cellThree)
}

class cellThree: UITableViewCell {
    @IBOutlet weak var collectionViewThree: UICollectionView!
    
    //셀 누를 때 상세보기로 전환 할 때 필요
    weak var cellDelegate: CollectionViewCellDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCollectionView()
        
    }
    
    func setupCollectionView(){
        collectionViewThree.delegate = self
        collectionViewThree.dataSource = self
        
        let collectioncellOne = UINib(nibName: "cellThreeCollectionCell", bundle: nil)
        self.collectionViewThree.register(collectioncellOne, forCellWithReuseIdentifier: "cellThreeCollectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension cellThree: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellThreeCollectionCell", for: indexPath) as? cellThreeCollectionCell {
            
            cell.movieImage.image = UIImage(named: imageName[indexPath.row])
            cell.movieTitle.text = titleList[indexPath.row]
            cell.percent.text = percentList[indexPath.row]
            cell.rank.text = rankList[indexPath.row]
            
            return cell
            }
        return UICollectionViewCell()
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? cellThreeCollectionCell
        self.cellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)

    }
    
    
}

