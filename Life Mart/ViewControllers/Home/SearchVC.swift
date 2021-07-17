//
//  SearchVC.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 16/07/21.
//

import UIKit
import RxSwift

class SearchVC: BaseViewController {
    var  viewModel : SearchViewModel!
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var switcher: UISwitch!
    
    
    var isOpen:Bool = false
    var query:String = ""
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "SearchVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        initTableview()
        initView()
        
    }
    
    func initView(){
        searchTextField.becomeFirstResponder()
        searchTextField.roundedCorners()
    }
    
    func fetchData(){
        startLoading()
        viewModel.fetchSearch(with: isOpen, shortName: query, sortBy: viewModel.sort).subscribe { [self] result in
            switch result {
            case .completed: updateTablView()
            case .error(_): snackView(msg: viewModel.message)
            }
            searchShown  = true
            stopLoading()
        }.disposed(by: self.disposeBag )
    }
    
    func updateTablView(){
        tableView.reloadSections([0], with: .automatic)
    }
    
    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: viewModel.sort = SortModel.price.rawValue
            if searchShown{ fetchData()}
        default: viewModel.sort = SortModel.distance.rawValue
            if searchShown{ fetchData()}
            
        }
    }
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func switchTapped(_ sender: UISwitch) {
        if sender.isOn {
            isOpen = true
            if searchShown{ fetchData()}
        }
        else {
            isOpen = false
            if searchShown{ fetchData()}
        }
    }
    
    
    func initTableview(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(CompanyCell.self)
        tableView.reloadSections([0], with: .automatic)
        
    }
    
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        query = searchTextField.text ?? ""
        if query != "" {fetchData()}
        self.view.endEditing(true)
        return false
    }
}

extension SearchVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CompanyCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.fillSearch(with: viewModel.searchResult[indexPath.row],onAction:{
            self.viewModel.companyId = self.viewModel.searchResult[indexPath.row].id ?? -100
            self.viewModel.mySegue(parent: self, info: self.viewModel.searchResult[indexPath.row].company!)
        })
        return cell
    }
    
    
}
