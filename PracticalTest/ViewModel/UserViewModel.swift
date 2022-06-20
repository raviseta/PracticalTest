//
//  UserViewModel.swift
//  PracticalTest
//
//  Created by raviseta on 20/06/22.
//

import Foundation

class UserViewModel {
    
    func getDataFromFile(fileName : String,
            success:@escaping (([UserResponse]) -> ()),
             failure:@escaping ((String) -> ())){
        do {
            if let bundlePath = Bundle.main.path(forResource: fileName,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                do {
                    let decodedData = try JSONDecoder().decode([UserResponse].self,
                                                               from: jsonData)
                    success(decodedData)
                }
                catch {
                    failure(error.localizedDescription)
                }
            }else{
                failure("File not found")
            }
        }catch {
            failure(error.localizedDescription)
        }
    }
    
}
