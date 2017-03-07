//
//  EntryViewController.swift
//  recruit_LFS_20170301
//
//  Created by Arisa on 2017/03/01.
//  Copyright © 2017年 Arisa. All rights reserved.
//

import UIKit
import RealmSwift

class EntryViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var companyTextField: UITextField!
    @IBOutlet var IDTextField: UITextField!
    @IBOutlet var schedulePickerView: UIPickerView!
    var scheduleArray: NSArray = ["説明会", "セミナー", "ES", "テスト", "面接"]
//    @IBOutlet var timeDatePicker: UIDatePicker!
    
    var saveData: UserDefaults = UserDefaults.standard
    var pickedRow: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        companyTextField.text = saveData.object(forKey: "company") as! String?
        IDTextField.text = saveData.object(forKey: "ID") as! String?
        companyTextField.delegate = self
        IDTextField.delegate = self
        schedulePickerView.delegate = self
        schedulePickerView.dataSource = self
        
    }
    
    @IBAction func save (_ pickerRow:Int) {
        
        let company = Company()
        company.id = IDTextField.text
        company.name = companyTextField.text
        company.schedule = (scheduleArray[pickerRow] as AnyObject).text

        
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
    
    func numberOfComponents(in PickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView:UIPickerView,numberOfRowsInComponent component:Int)->Int{
        return scheduleArray.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return scheduleArray[row] as? String
    }

    func pickerView(_ pickerView:UIPickerView,didSelectRow row:Int,inComponent component:Int){
        var saveData2: UserDefaults = UserDefaults.standard
        
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
