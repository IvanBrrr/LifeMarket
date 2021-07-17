//
//  ProductsVC.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 17/07/21.
//

import UIKit
import RxSwift
import MapKit

class ProductsVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var title_label: UILabel!
    @IBOutlet weak var phoneBtn: UIButton!
    @IBOutlet weak var address_label: UILabel!
    
    var  viewModel : ProductsViewModel!
    private let disposeBag = DisposeBag()
    
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ProductsVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initTableView()
        fetchData()
    }
    
    
    func fetchData(){
        startLoading()
        viewModel.fetcProduct(with: false).subscribe { [self] result in
            switch result {
            case .completed: tableView.reloadSections([0], with: .automatic)
            case .error(_): snackView(msg: viewModel.message)
            }
            stopLoading()
        }.disposed(by: self.disposeBag )
    }
    
    func initView(){
        title_label.text = viewModel.companyInfo?.name ?? ""
        address_label.text = viewModel.companyInfo?.address ?? ""
        phoneBtn.setTitle(viewModel.companyInfo?.phone, for: .normal)
    }
    
    func initTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(ProductCell.self)
        tableView.reloadSections([0], with: .automatic)
    }
    
    @IBAction func mapTapped(_ sender: UIButton) {
        viewModel.mySegueMap(parent: self)
    }
    
    @IBAction func callTapped(_ sender: Any) {
        if let url = URL(string: "tel://\(viewModel.companyInfo?.phone ?? "")"), UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
 
    
}

extension ProductsVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.product.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ProductCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.fill(with: viewModel.product[indexPath.row])
        return cell
    }
    
    
}
