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
    func fetchAllProducts(completion : @escaping([ProductModel]?)->())
    func getOneProduct(id : Int,completion : @escaping(ProductModel?)->())
}


struct ProductService : IProductService{
    
    func fetchAllProducts(completion: @escaping ([ProductModel]?) -> ()) {
        URLSession.shared.dataTask(with: ProductServiceEndPoint.productsPath()) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else{
                if let data = data{
                    do{
                        let results =  try JSONDecoder().decode([ProductModel].self, from: data)
                            completion(results)
                    }catch{
                        print("Product Çevirme İşleminde Hata Oluştu")
                    }
                    
            }
        }
    }
    }
    
    func getOneProduct(id: Int, completion: @escaping (ProductModel?) -> ()) {
        <#code#>
    }
    

    
    
    
}
