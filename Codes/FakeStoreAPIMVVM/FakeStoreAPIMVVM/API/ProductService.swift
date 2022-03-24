//
//  ProductService.swift
//  FakeStoreAPIMVVM
//
//  Created by Burak Emre gündeş on 21.03.2022.
//

import Foundation


enum ProductServiceEndPoint : String{
    case BASE_URL = "https://fakestoreapi.com"
    case PATH = "/products"

    static func productsPath() -> URL {
        return URL(string: "\(BASE_URL.rawValue)\(PATH.rawValue)")!
    }
    static func oneProductPath(id: Int) -> URL{
        return URL(string: "\(BASE_URL.rawValue)\(PATH.rawValue)/\(String(id))")!
    }
}



protocol IProductService{
    func fetchAllProducts(completion : @escaping(Result<[ProductModel]?,DownloandError>)->())
    func getOneProduct(id : Int,completion : @escaping(ProductModel?)->())
}


struct ProductService : IProductService{
    
    func fetchAllProducts(completion: @escaping (Result<[ProductModel]?,DownloandError>) -> ()) {
        URLSession.shared.dataTask(with: ProductServiceEndPoint.productsPath()) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badUrl))
            }else{
                
                
                guard let data = data, error == nil else {
                    return completion(.failure(.noData))
                }
                
                guard let results = try? JSONDecoder().decode([ProductModel].self, from: data) else {
                    return completion(.failure(.dataParserError))
                }
                        
                completion(.success(results))
          
        }
        }.resume()
    }
    
    func getOneProduct(id: Int, completion: @escaping (ProductModel?) -> ()) {
        print("sea")
    }
    

    
    
    
}

enum DownloandError : Error{
    case badUrl
    case noData
    case dataParserError
}

