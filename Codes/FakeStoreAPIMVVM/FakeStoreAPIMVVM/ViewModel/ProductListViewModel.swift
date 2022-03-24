//
//  ProductListViewModel.swift
//  FakeStoreAPIMVVM
//
//  Created by Burak Emre gündeş on 21.03.2022.
//

import Foundation


protocol IProductListViewModel {
    func getAllProducts()
    var products : [ProductModel]{get set}
    var productService : IProductService {get set}
    var productListOutPut : IProductListOutPut? {get set}
    func setDelegate(output: IProductListOutPut)
}


final class ProductListViewModel : IProductListViewModel{
  
    
    var productListOutPut: IProductListOutPut?

    var productService: IProductService
    var products: [ProductModel] = []
    
    init(){
        self.productService = ProductService()
    }
   
    
     func getAllProducts() {
        productService.fetchAllProducts { results in
            
            switch results {
            case .success(let products):
                if let products = products{
                    self.products = products
                    self.productListOutPut?.saveDatas(values: products)
                }
            case .failure(let error):
                print(error)
                
            }
           
        }
       
    }
    
    func setDelegate(output: IProductListOutPut) {
        self.productListOutPut=output
    }
    
}

