//
//  APIRequest.swift
//  Assignment1
//
//  Created by Reshma Pai on 28/05/23.
//

import Foundation
import RxSwift
import RxCocoa

class APIRequest {
    
    let session = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask? = nil
    
    func callAPI<T: Codable>(url: URL) -> Observable<T> {
        
        return Observable<T>.create { observer in
            
            self.dataTask = self.session.dataTask(with: url, completionHandler: { data, response, error in
                do {
                    let model: DataResponseModel = try JSONDecoder().decode(DataResponseModel.self, from: data ?? Data())
                    observer.onNext(model as! T)
                    
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            })
            self.dataTask?.resume()
            return Disposables.create {
                self.dataTask?.cancel()
            }
        }
    }
    
    func callImageAPI<T: Codable>(url: URL) -> Observable<T> {
        
        return Observable<T>.create { observer in
            
            self.dataTask = self.session.dataTask(with: url, completionHandler: { data, response, error in
                do {
                    let model: DataResponseModel = try JSONDecoder().decode(DataResponseModel.self, from: data ?? Data())
                    observer.onNext(model as! T)
                    
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            })
            self.dataTask?.resume()
            return Disposables.create {
                self.dataTask?.cancel()
            }
        }
    }
}
