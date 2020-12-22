//
//  ViewController.swift
//  Pagination-LazyLoading
//
//  Created by Shweta Shrivastava on 12/19/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var pageNumber = 1
    private let apiCaller = APICaller()
    var isLoadingList : Bool = false
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        activityIndicator.frame = view.bounds
        activityIndicator.startAnimating()
        apiCaller.fetchData(pageNumber: pageNumber) { [weak self] (result) in
            guard let self = self else {
                print("ViewController already deallocated")
                return
            }
            self.pageNumber += 1
            switch result {
            case .success(let data):
                self.data.append(contentsOf: data)
                DispatchQueue.main.async {
                    self.activityIndicator.removeFromSuperview()
                    self.tableView.reloadData()
                }
            case .failure(_):
                break
            }
        }
    }
    
    private func createSpinnerFooterView() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        
        return footerView
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !isLoadingList && pageNumber <= 3 && indexPath.row ==  data.count - 1 {
            self.tableView.tableFooterView = createSpinnerFooterView()
            isLoadingList = true
            apiCaller.fetchData(pageNumber: pageNumber) { (result) in
                self.pageNumber += 1
                DispatchQueue.main.async {
                    self.tableView.tableFooterView = nil
                }
                switch result {
                case .success(let data):
                    self.data.append(contentsOf: data)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.isLoadingList = false
                    }
                case .failure(_):
                    break
                }
            }
        }
    }
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height )) && !isLoadingList && pageNumber <= 3{
//            self.tableView.tableFooterView = createSpinnerFooterView()
//            isLoadingList = true
//            apiCaller.fetchData(pageNumber: pageNumber) { (result) in
//                self.pageNumber += 1
//                DispatchQueue.main.async {
//                    self.tableView.tableFooterView = nil
//                }
//                switch result {
//                case .success(let data):
//                    self.data.append(contentsOf: data)
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                        self.isLoadingList = false
//                    }
//                case .failure(_):
//                    break
//                }
//            }
//        }
//    }
    
    deinit {
        print("ViewController deallocated")
    }
}

