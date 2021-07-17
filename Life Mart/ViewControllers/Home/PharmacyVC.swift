//
//  PharmacyVC.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 17/07/21.
//

import UIKit
import RxSwift

class PharmacyVC: BaseViewController {
    
    var  viewModel : PharmacyViewModel!
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    var isOpen:Bool = false
    
    init(viewModel: PharmacyViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "PharmacyVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        fetchData()
    }
    
    func fetchData(){
        startLoading()
        viewModel.fetcCompany().subscribe { [self] result in
            switch result {
            case .completed: tableView.reloadSections([0], with: .automatic)
            case .error(_): snackView(msg: viewModel.message)
            }
            stopLoading()
        }.disposed(by: self.disposeBag )
    }
    
    func initTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(CompanyCell.self)
        tableView.reloadSections([0], with: .automatic)
    }
    
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
extension PharmacyVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.company.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CompanyCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.fill(with: viewModel.company[indexPath.row],onAction:{
            self.viewModel.companyID = self.viewModel.company[indexPath.row].id ?? -100
            self.viewModel.mySegue(parent: self, info: self.viewModel.company[indexPath.row])
        })
        return cell
    }
    
    
}
