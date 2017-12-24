//
//  TableViewController.swift
//  SearchBar
//
//  Created by Anhdzai on 12/22/17.
//  Copyright © 2017 Anhdzai. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchResultsUpdating {
    // Tạo Mảng
    var array = [ "One", "Two", "Three", "Four", "Five", "Six"]
    // tạo mảng phụ khi tìm kiếm
    var filteredArray = [String]()
    // Không kéo searchBar. Nên phải tạo biến searchController
    var searchController = UISearchController()
    // Tạo biến ???
    var resultsController = UITableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Khi loadView hiển thị thanh tìm kiếm
        searchController = UISearchController(searchResultsController: resultsController)
        // Hiển thị thanh tìm kiếm ở vị trí trên
        tableView.tableHeaderView = searchController.searchBar
        // Cập nhật nội dung tìm kiếm
        searchController.searchResultsUpdater = self
        resultsController.tableView.delegate = self
        resultsController.tableView.dataSource = self
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        // Lọc dữ liệu trong mảng array
        filteredArray = array.filter({ (array:String) -> Bool in
            // Nếu trong mảng chứa từ tìm kiếm trả về đúng, còn ko thì trả về sai
            if array.contains(searchController.searchBar.text!) {
                return true
            } else {
                return false
            }
        })
        resultsController.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // ???
        if tableView == resultsController.tableView {
            return filteredArray.count
        } else {
            return array.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // ???
        if tableView == resultsController.tableView {
            cell.textLabel?.text = filteredArray[indexPath.row]
        } else {
            cell.textLabel?.text = array[indexPath.row]
        }
        return cell
    }
    
}
