//
//  CountryModel.swift
//  Assignment1
//
//  Created by Reshma Pai on 28/05/23.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

struct CountryDetails {
    var countryDetail = RowItem(title: "", description: nil, imageHref: nil)
}

class CountryViewModel {
    
    var model: Observable<DataResponseModel>?
    var images: Observable<[UIImage]>?
    private var pageTitle = BehaviorRelay<String>(value: String())
    private var countryDetails = BehaviorRelay<[CountryDetails]>(value: [])
    var countryDetailsObserver: Observable<[CountryDetails]> {
        return self.countryDetails.asObservable()
    }
    var pageTitleObserver: Observable<String> {
        return self.pageTitle.asObservable()
    }
    
    private let disposeBag = DisposeBag()
    
    func getCountryInfo() {
        let apiRequest = APIRequest()
        let apiHelper = APIHelper()
        if let url = apiHelper.getApiURL(type: .country) {
            model = apiRequest.callAPI(url: url)
            model?.subscribe(onNext: { countryDetails in
                self.pageTitle.accept(countryDetails.title ?? "")
                if let rowItems = countryDetails.rows {
                    var countryInfo = [CountryDetails]()
                    for index in 0..<rowItems.count {
                        var countryDetail = CountryDetails()
                        countryDetail.countryDetail = rowItems[index]
                        countryInfo.append(countryDetail)
                    }
                    self.countryDetails.accept(countryInfo)
                }
            }, onError: { error in
                _ = self.countryDetails.catch { error in
                    Observable.empty()
                }
                _ = self.pageTitle.catch { error in
                    Observable.empty()
                }
                print(error.localizedDescription)
            })
            .disposed(by: disposeBag)
        }
    }
    
    func getImages() {
        
    }
}
