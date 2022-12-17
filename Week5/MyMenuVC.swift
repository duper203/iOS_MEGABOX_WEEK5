//
//  MyMenuVC.swift
//  Week5
//
//  Created by 김혜수 on 2022/11/15.
//
import Foundation
import UIKit
import KakaoSDKUser



class MyMenuVC: UIViewController{
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var paging: UIPageControl!
    
    @IBAction func changePage(_ sender: UIPageControl) {
        let indexPath = IndexPath(item: sender.currentPage, section: 0)
        // 인덱스패스위치로 컬렉션 뷰를 스크롤
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK- 카카오 정보 가져오기
        kakaoGetUserInfo()
        
        
        //MARK - containerview 둥글게 + 그림자 효과
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowOffset = CGSize(width: 5, height: 5)
        containerView.layer.shadowOpacity = 0.3
        
        //MARK - COllectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let OneCCell = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.collectionView.register(OneCCell, forCellWithReuseIdentifier: "CollectionViewCell")
        
        //MARK - pageControl
        paging.numberOfPages = imgName.count  // 초기화 구현
        paging.currentPage = 0 // 현재 페이지
        paging.pageIndicatorTintColor = UIColor.gray
        paging.currentPageIndicatorTintColor = UIColor.white // 페이지 컬러 속성 변경
        
        //MARK - 프로필 사진 둥그렇게
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.layer.borderWidth = 1
        profileImage.clipsToBounds = true
        profileImage.layer.borderColor = UIColor.clear.cgColor  //원형 이미지의 테두리 제거
    }
    
    // 카카오 - RESTful API, 계정 정보 가져오기
        func kakaoGetUserInfo() {
                UserApi.shared.me() {(user, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("me() success.")
                        //do something
                        _ = user
                        
                        self.nameLabel.text = user?.kakaoAccount?.profile?.nickname // 실명 - legalName(안되는듯.)
                        
                        DispatchQueue.main.async {
                            if let url = user?.kakaoAccount?.profile?.profileImageUrl,
                                let data = try? Data(contentsOf: url) {
                                self.profileImage.image = UIImage(data: data)
                        }
                    }
                }
            }
}
    
    
}

extension MyMenuVC: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell {
            cell.pageImage.image = UIImage(named: imgName[indexPath.row])
            
            return cell
        }
        return UICollectionViewCell()
    }
}

//MARK - pagecontrol 이용
extension MyMenuVC: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let width = scrollView.bounds.size.width
            // 좌표보정을 위해 절반의 너비를 더해줌
            let x = scrollView.contentOffset.x + (width/2)
            
            let newPage = Int(x / width)
            if paging.currentPage != newPage {
                paging.currentPage = newPage
            }
        }
}
