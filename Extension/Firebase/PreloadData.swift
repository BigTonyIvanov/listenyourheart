//
//  PreloadData.swift
//  listenyourheart
//
//  Created by Антон Иванов on 3/18/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import Foundation
import Firebase

class PreloadData {
    
    let queue = DispatchQueue(label: "firebase.load.data", qos: .utility, attributes: .concurrent)
    let semaphore : DispatchSemaphore
    
    init(){
        semaphore = DispatchSemaphore(value: 0)
    }
    
    // Download data for creating nedeed VC. Use semaphore for consistently load information!
    
    func loadData(complition: @escaping()->()){
        
        queue.async {
            Authorization.sharedInstance.signInAnonimously {
                DispatchQueue.main.async {
                    print("Анонимный пользователь зарегистрирован")
                }
                
                self.semaphore.signal()
            }
        }
        
      
        queue.async {
            self.semaphore.wait()
            print("---Start get info!!!")
            FirebaseData.sharedInstanse.getUserData(completion: {
                self.semaphore.signal()
            })
        }

        queue.async {
            self.semaphore.wait()
            print("--- work with RcValues")
            if RCValues.sharedInstance.fetchComplete == true{
                complition()
            }
            RCValues.sharedInstance.loadingDoneCallback = complition
        }
        
        
        
    }

}

