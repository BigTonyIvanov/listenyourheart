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
    func loadData(completion: @escaping()->()){
        
//        queue.async {
////            self.semaphore.wait()
//            print("--- 1")
//            Authorization.sharedInstance.signInAnonimously {
//                DispatchQueue.main.async {
//                    print("--- Anonim user is registered")
//                    print("--- UID user is" , Authorization.sharedInstance.uid!)
//                }
//                self.semaphore.signal()
//            }
//        }
        
        queue.async {
//            self.semaphore.wait()
            print("--- Start get info!!!")
            print("--- 2")

//            FirebaseData.sharedInstanse.getUserData(byID: Author, completion: {
//                print("--- 2.2")
//                self.semaphore.signal()
//            })
        }

        queue.async {
            self.semaphore.wait()
            print("--- Work with RcValues")
            print("--- 3")

            if RCValues.sharedInstance.fetchComplete == true{
                completion()
            }
            RCValues.sharedInstance.loadingDoneCallback = completion
        }
        
    }
    
    
    func loadData1(completion: @escaping()->()){
        
    }

}

