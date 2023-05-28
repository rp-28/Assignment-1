//
//  CountryViewController.swift
//  Assignment1
//
//  Created by Reshma Pai on 27/05/23.
//

import UIKit
import RxSwift
import RxCocoa

class CountryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let countryViewModel = CountryViewModel()
    let countryDetails = BehaviorRelay<[CountryDetails]>(value: [])
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        countryViewModel.getCountryInfo()
        countryViewModel.countryDetailsObserver.subscribe(onNext: { countryDetails in
            self.countryDetails.accept(countryDetails)
        }, onError: { error in
            print(error.localizedDescription)
        }).disposed(by: disposeBag)
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        countryViewModel.pageTitleObserver.subscribe(onNext: { pageTitle in
            
        }, onError: { error in
            print(error.localizedDescription)
        }).disposed(by: disposeBag)
        
        
        countryDetails.bind(to: tableView.rx.items(cellIdentifier: "CountryDetailsTableViewCell", cellType: CountryDetailsTableViewCell.self)) { row,
            model, cell in
            cell.setupCellUI()
            cell.setupTitle(text: model.countryDetail.title)
            cell.setupDescription(text: model.countryDetail.description)
            //cell.setupImageView(image: model)
        }.disposed(by: disposeBag)
    }
    
    func registerCell() {
        tableView.register(CountryDetailsTableViewCell.self, forCellReuseIdentifier: "CountryDetailsTableViewCell")
    }
}
 
extension CountryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200//UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
