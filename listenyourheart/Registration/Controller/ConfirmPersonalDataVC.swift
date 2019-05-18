//
//  ConfirmPersonalDataVC.swift
//  listenyourheart
//
//  Created by Антон Иванов on 1/27/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

enum ChineseYears: String, CaseIterable {
   
    case dog = "dog.png"
    case pig = "horse1"
    case rat = "horse2"
    case bull = "horse3"
    case tiger = "horse"
    case rabbit = "rabbit.png"
    case dragon = "dragon.png"
    case snake = "snake.png"
    case horse = "horse.png"
    case goat = "goat.png"
    case monkey = "monkey.png"
    case cock = "cock.png"
}

enum ZodiacSigns: String, CaseIterable {
    
    case oven = "dog.png"
    case telec = "libra1"
    case blizneci = "libra2"
    case rak = "libra3"
    case lev = "libra"
    case deva = "rabbit.png"
    case vesi = "dragon.png"
    case skorpion = "snake.png"
    case strelec = "horse.png"
    case kozerog = "goat.png"
    case vodolei = "monkey.png"
    case ribi = "cock.png"
}



class ConfirmPersonalDataVC: UIViewController, ViewSpecificController {
    
 typealias RootView = ConfirmPersonalDataView
    
    var name = ""
    var birthday = ""
    fileprivate var nextScreen: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view().nameLabel.text = " " + self.name + " "
        view().birthDateLabel.text = " " + self.birthday + " "
        
        
        getZodiacSign(self.birthday)
        getChineseYear(self.birthday)
        

    }
    
    
    @IBAction func confirmData(_ sender: Any) {
        let userData = ["name": self.name,"birthDate": self.birthday, "buy": "false"]
        
        var uid = Authorization.sharedInstance.getUIDCurrentUser()
        if uid == nil{
            Authorization.sharedInstance.signInAnonimously { (authData) in
                guard let currUid = authData?.user.uid else {return}
                uid = currUid
            }
        }
        
        // save data into database (FirebaseData it`s my own class singelton)
        FirebaseData.sharedInstanse.saveIntoFirebase(for: uid, userData: userData)
        

        self.changeScreen()

        
    }
    
}

extension ConfirmPersonalDataVC{
    
    func changeScreen(){
        
        let needBuying = RCValues.sharedInstance.bool(forKey: .requiredSubscription)
        
        DispatchQueue.main.async {
            
            let contentController = SubscriptionViewController.instantiateInitialFromStoryboard()
            
            let onboardingController = OnboardingViewController.instantiateInitialFromStoryboard()
            onboardingController.embedController(contentController,
                                                 actionsDatasource: contentController)

            let modalController = onboardingController.wrapInModalContainer()
           
            let btn = modalController.view().closeButton
            
            if needBuying == true{
                btn?.isHidden = true
            }else{
                modalController.setCloseAction {
                    let storyboard = UIStoryboard(name: "Predictions", bundle: nil)
                    let downloadViewController = storyboard.instantiateViewController(withIdentifier: "DownloadViewController") as! DownloadViewController
//                    let downloadViewController = storyboard.instantiateViewController(withIdentifier: "LuckyLuckViewController") as! LuckyLuckViewController
                    
                    self.present(downloadViewController, animated: true)
                }
            }

            self.present(modalController, animated: true)
            
        }
    }
    
    private func getZodiacSign(_ birthDate: String){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm-dd-yyyy"
        let date = dateFormatter.date(from: birthDate)
        let year = dateFormatter.calendar.component(.year, from: date!)
        
        
        // initialize point of start year 1970!
        let dateX = Date(timeIntervalSince1970: 0.0)
        let fromYear = dateFormatter.calendar.component(.year, from: dateX)

        let years = ChineseYears.allCases
        
        var identValue = (year-fromYear) % 12
        if identValue < 0 {
            identValue+=12
        }
        
        view().setChineseYear(with: years[identValue].rawValue)
    
    }
    
    func getChineseYear(_ birthDate: String){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.date(from: birthDate)
        let month = dateFormatter.calendar.component(.month, from: date!)
        let day = dateFormatter.calendar.component(.day, from: date!)

        var zodiac: String!
        
        switch month {
            case 1:  zodiac = (day <= 20) ? ZodiacSigns.kozerog.rawValue : ZodiacSigns.vodolei.rawValue
            case 2:  zodiac = (day <= 19) ? ZodiacSigns.vodolei.rawValue : ZodiacSigns.ribi.rawValue
            case 3:  zodiac = (day <= 20) ? ZodiacSigns.ribi.rawValue : ZodiacSigns.oven.rawValue
            case 4:  zodiac = (day <= 20) ? ZodiacSigns.oven.rawValue : ZodiacSigns.telec.rawValue
            case 5:  zodiac = (day <= 21) ? ZodiacSigns.telec.rawValue : ZodiacSigns.blizneci.rawValue
            case 6:  zodiac = (day <= 21) ? ZodiacSigns.blizneci.rawValue : ZodiacSigns.rak.rawValue
            case 7:  zodiac = (day <= 22) ? ZodiacSigns.rak.rawValue : ZodiacSigns.lev.rawValue
            case 8:  zodiac = (day <= 23) ? ZodiacSigns.lev.rawValue : ZodiacSigns.deva.rawValue
            case 9:  zodiac = (day <= 23) ? ZodiacSigns.deva.rawValue : ZodiacSigns.vesi.rawValue
            case 10:  zodiac = (day <= 23) ? ZodiacSigns.vesi.rawValue : ZodiacSigns.skorpion.rawValue
            case 11:  zodiac = (day <= 22) ? ZodiacSigns.skorpion.rawValue : ZodiacSigns.strelec.rawValue
            case 12:  zodiac = (day <= 23) ? ZodiacSigns.strelec.rawValue : ZodiacSigns.kozerog.rawValue

        default:
            break
        }
        
        view().setZodiacSign(with: zodiac)   
    }
    

}
