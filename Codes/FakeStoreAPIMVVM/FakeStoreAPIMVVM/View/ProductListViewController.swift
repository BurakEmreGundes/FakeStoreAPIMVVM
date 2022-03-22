//
//  ProductListViewController.swift
//  FakeStoreAPIMVVM
//
//  Created by Burak Emre gündeş on 21.03.2022.
//

import UIKit


// business a direkt erişim sağlamak çok doğru değil
protocol IProductListOutPut{
    func saveDatas(values : [ProductModel])
}


class ProductListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var results : [ProductModel] = []
    
    lazy var viewModel : IProductListViewModel = ProductListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
        
        viewModel.setDelegate(output: self)
        viewModel.getAllProducts()
    }
}

extension ProductListViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = results[indexPath.row].title
        return cell
    }
 
}

extension ProductListViewController : IProductListOutPut{
    func saveDatas(values: [ProductModel]) {
        self.results = values
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
