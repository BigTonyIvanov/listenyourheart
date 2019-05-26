//
//  ConfirmPersonalDataVC.swift
//  listenyourheart
//
//  Created by Антон Иванов on 1/27/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

enum ChineseYears: String, CaseIterable {
   
    case dog = "Dog"
    case pig = "Pig"
    case rat = "Rat"
    case bull = "Bull"
    case tiger = "Tiger"
    case rabbit = "Rabbit"
    case dragon = "Dragon"
    case snake = "Snake"
    case horse = "Horse"
    case goat = "Capricorn"
    case monkey = "Monkey"
    case cock = "Rooster"
}

enum ZodiacSigns: String, CaseIterable {
    
    case aries = "Aries"
    case taurus = "Taurus"
    case gemini = "Gemini"
    case cancer = "Cancer"
    case leo = "Leo"
    case virgo = "Virgo"
    case libra = "Libra"
    case scorpio = "Scorpio"
    case sagitarius = "Sagitarius"
    case capricorn = "Capricorn"
    case aquarius = "Aquarius"
    case pisces = "Pisces"
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
            case 1:  zodiac = (day <= 20) ? ZodiacSigns.capricorn.rawValue : ZodiacSigns.aquarius.rawValue
            case 2:  zodiac = (day <= 19) ? ZodiacSigns.aquarius.rawValue : ZodiacSigns.pisces.rawValue
            case 3:  zodiac = (day <= 20) ? ZodiacSigns.pisces.rawValue : ZodiacSigns.aries.rawValue
            case 4:  zodiac = (day <= 20) ? ZodiacSigns.aries.rawValue : ZodiacSigns.taurus.rawValue
            case 5:  zodiac = (day <= 21) ? ZodiacSigns.taurus.rawValue : ZodiacSigns.gemini.rawValue
            case 6:  zodiac = (day <= 21) ? ZodiacSigns.gemini.rawValue : ZodiacSigns.cancer.rawValue
            case 7:  zodiac = (day <= 22) ? ZodiacSigns.cancer.rawValue : ZodiacSigns.leo.rawValue
            case 8:  zodiac = (day <= 23) ? ZodiacSigns.leo.rawValue : ZodiacSigns.virgo.rawValue
            case 9:  zodiac = (day <= 23) ? ZodiacSigns.virgo.rawValue : ZodiacSigns.libra.rawValue
            case 10:  zodiac = (day <= 23) ? ZodiacSigns.libra.rawValue : ZodiacSigns.scorpio.rawValue
            case 11:  zodiac = (day <= 22) ? ZodiacSigns.scorpio.rawValue : ZodiacSigns.sagitarius.rawValue
            case 12:  zodiac = (day <= 23) ? ZodiacSigns.sagitarius.rawValue : ZodiacSigns.capricorn.rawValue

        default:
            break
        }
        
        view().setZodiacSign(with: zodiac)   
    }
    

}
