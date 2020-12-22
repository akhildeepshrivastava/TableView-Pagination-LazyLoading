//
//  APICaller.swift
//  Pagination-LazyLoading
//
//  Created by Shweta Shrivastava on 12/19/20.
//

import Foundation

class APICaller {
        
    func fetchData(pageNumber: Int, completion: @escaping (Result<[String], Error>) -> Void) {
        
        let page1 = [
            "Apple",
            "Facebook",
            "Google",
            "PayPal",
            "Apple",
            "Facebook",
            "Google",
            "PayPal",
            "Apple",
            "Facebook",
            "Google",
            "PayPal",
            "Apple",
            "Facebook",
            "Google",
            "PayPal",
            "Apple",
            "Facebook",
            "Google",
            "PayPal",
            "Apple",
            "Facebook",
            "Google",
            "PayPal",
            "Apple",
            "Facebook",
            "Google",
            "PayPal",
            "Apple",
            "Facebook",
            "Google",
            "PayPal",
            "Apple",
            "Facebook",
            "Google",
            "PayPal"
        ]
        
        let page2 = [
            "Apple2",
            "Facebook2",
            "Google2",
            "PayPal2",
            "Apple2",
            "Facebook2",
            "Google2",
            "PayPal2",
            "Apple2",
            "Facebook2",
            "Google2",
            "PayPal2",
            "Apple2",
            "Facebook2",
            "Google2",
            "PayPal2",
            "Apple2",
            "Facebook2",
            "Google2",
            "PayPal2",
            "Apple2",
            "Facebook2",
            "Google2",
            "PayPal2",
            "Apple2",
            "Facebook2",
            "Google2",
            "PayPal2",
            "Apple2",
            "Facebook2",
            "Google2",
            "PayPal2",
            "Apple2",
            "Facebook2",
            "Google2",
            "PayPal2"
        ]
        
        let page3 = [
            "Apple3",
            "Facebook3",
            "Google3",
            "PayPal3",
            "Apple3",
            "Facebook3",
            "Google3",
            "PayPal3",
            "Apple3",
            "Facebook3",
            "Google3",
            "PayPal3",
            "Apple3",
            "Facebook3",
            "Google3",
            "PayPal3",
            "Apple3",
            "Facebook3",
            "Google3",
            "PayPal3",
            "Apple3",
            "Facebook3",
            "Google3",
            "PayPal3",
            "Apple3",
            "Facebook3",
            "Google3",
            "PayPal3",
            "Apple3",
            "Facebook3",
            "Google3",
            "PayPal3",
            "Apple3",
            "Facebook3",
            "Google3",
            "PayPal3"
        ]
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                        
            if pageNumber == 2 {
                completion(.success(page2))
            } else if pageNumber == 3 {
                completion(.success(page3))
            } else {
                completion(.success(page1))
            }
        }
    }
}
