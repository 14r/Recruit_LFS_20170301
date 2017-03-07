//
//  ScheduleViewController.swift
//  recruit_LFS_20170301
//
//  Created by Arisa on 2017/03/07.
//  Copyright © 2017年 Arisa. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ScheduleViewController: UIViewController {
    
    
    @IBOutlet var company: UITableView!
    
    let companies = try! Realm().objects(Company.self)
    
    var saveData: UserDefaults = UserDefaults.standard
    
    
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var IDLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
//        let company = companies[indexPath.row]
//        companyLabel.text = saveData.object(forKey: "company") as! String?
//        IDLabel.text = saveData.object(forKey: "ID") as! String?
//        company.dataSource = self
//        company.delegate = self
        
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CompanyTableViewCell
        let company = companies[indexPath.row]
        companyLabel.text = saveData.object(forKey: "company") as! String?
        IDLabel.text = saveData.object(forKey: "ID") as! String?
        return cell
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
