//
//  EntryViewController.swift
//  recruit_LFS_20170301
//
//  Created by Arisa on 2017/03/01.
//  Copyright © 2017年 Arisa. All rights reserved.
//

import UIKit
import RealmSwift

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var companyTextField: UITextField!
    @IBOutlet var IDTextField: UITextField!
    
    var saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        companyTextField.text = saveData.object(forKey: "company") as! String?
        IDTextField.text = saveData.object(forKey: "ID") as! String?
        companyTextField.delegate = self
        IDTextField.delegate = self
        
    }
    
    @IBAction func save() {
        
        let company = Company()
        company.id = IDTextField.text
        company.name = companyTextField.text
        let realm = try! Realm()
        try! realm.write {
            realm.add(company)
        }
        //        saveData.set(companyTextField.text, forKey: "company")
//        saveData.set(IDTextField.text, forKey: "ID")
//        saveData.synchronize()
        
        let alert: UIAlertController = UIAlertController(
            title: "保存",
            message: "保存が完了しました。",
            preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    self.dismiss(animated: true, completion: nil)
            }
            )
        )
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
