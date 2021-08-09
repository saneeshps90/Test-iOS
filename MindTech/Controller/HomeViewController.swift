//
//  HomeViewController.swift
//  MindTech
//
//  Created by Saneesh Sathyavan on 09/08/21.
//

import UIKit

class HomeViewController: UIViewController, UISearchControllerDelegate {
    
    @IBOutlet weak var swipeableCollectionView: UICollectionView!
    @IBOutlet weak var imageListTableView: UITableView!
    @IBOutlet weak var dots: UIPageControl!
    
    var data = [ModelData]()
    var isSearching = false
    var searchedResult = [ModelData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.data = ApiManager().loadData()
        swipeableCollectionView.dataSource = self
        swipeableCollectionView.delegate = self
        swipeableCollectionView.reloadData()
        
        imageListTableView.dataSource = self
        imageListTableView.delegate = self
        imageListTableView.reloadData()
        
        setUpSearchBar()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        dots.currentPage = Int(
            (swipeableCollectionView.contentOffset.x / swipeableCollectionView.frame.width)
                .rounded(.toNearestOrAwayFromZero)
            )
    }
    
    
    func setUpSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
        navigationItem.searchController?.searchBar.showsCancelButton = true
        navigationItem.searchController?.searchBar.searchBarStyle = UISearchBar.Style.default
        navigationItem.searchController?.searchBar.placeholder = " Search Movies....."
        navigationItem.searchController?.searchBar.searchTextField.textColor = UIColor.white
        navigationItem.searchController?.searchBar.sizeToFit()
        self.imageListTableView.tableHeaderView = searchController.searchBar
    }


}






extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchResultsUpdating {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return self.searchedResult.count
        } else {
            return self.data.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageListTableViewCell", for: indexPath) as! ImageListTableViewCell
        if isSearching{
            cell.loadCellData(cellData: self.searchedResult[indexPath.row])
        }else{
        cell.loadCellData(cellData: self.data[indexPath.row])
        }
        return cell
    }
    
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.00
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SwipeableCollectionViewCell", for: indexPath) as! SwipeableCollectionViewCell
        dots.numberOfPages = self.data.count
        cell.loadCell(cellData: self.data[indexPath.row])
        return cell
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchedResult = self.data.filter({$0.name.lowercased().prefix(searchText.count) == searchText.lowercased()})
         isSearching = true
        self.imageListTableView.reloadData()
     }
     
     func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
         isSearching = false
         searchBar.text = ""
        self.imageListTableView.reloadData()
     }
    
    func updateSearchResults(for searchController: UISearchController) {
        self.searchedResult = self.data.filter({$0.name.lowercased().prefix(searchController.searchBar.text!.count) == searchController.searchBar.text!.lowercased()})
         isSearching = true
        self.imageListTableView.reloadData()
    }

    
    
}
