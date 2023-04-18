//
//  SearchVC.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 01.04.23.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var restaurantTV: UITableView! {
        didSet {
            restaurantTV.dataSource = self
            restaurantTV.delegate = self
            restaurantTV.register(UINib(nibName: "HistoryTVCell", bundle: nil), forCellReuseIdentifier: "HistoryTVCell")
            restaurantTV.register(UINib(nibName: "HistoryHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HistoryHeaderView")
        }
    }
    @IBOutlet weak var searchField: CustomSearchView! {
        didSet {
            searchField.type = .map
            searchField.placeholder = "Enter restaurant name"
        }
    }
    
    @IBOutlet weak var filtersCV: UICollectionView! {
        didSet {
            filtersCV.delegate = self
            filtersCV.dataSource = self
            filtersCV.register(UINib(nibName: "FilterCVCell", bundle: nil), forCellWithReuseIdentifier: "FilterCVCell")
        }
    }
    @IBOutlet weak var filterBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCVCell", for: indexPath) as! FilterCVCell
        cell.setupCell(title: "Filter")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let textForCell = "Filter"
        let sizeForCell: CGSize = textForCell.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0)])
        print(sizeForCell.width)
        

        return CGSize(width: sizeForCell.width + 30, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTVCell", for: indexPath) as! HistoryTVCell
        cell.setupCell(type: .search)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HistoryHeaderView") as! HistoryHeaderView
        view.setupHeader(title: "2 restaurants nearby")
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    
}
