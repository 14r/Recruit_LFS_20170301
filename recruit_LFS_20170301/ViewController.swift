//
//  ViewController.swift
//  recruit_LFS_20170301
//
//  Created by Arisa on 2017/03/01.
//  Copyright © 2017年 Arisa. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var company: UITableView!
    
    let companies = try! Realm().objects(Company.self)
    
    
    
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        company.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        company.dataSource = self
        company.delegate = self
        
//        companyLabel.text = saveData.object(forKey: "company") as! String?
//        IDLabel.text = saveData.object(forKey: "ID") as! String?
//        companyLabel.delegate = self
//        IDLabel.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CompanyTableViewCell
        let company = companies[indexPath.row]
        cell.companyLabel.text = company.name
        cell.IDLabel.text = company.id
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected", indexPath.row)
        self.performSegue(withIdentifier: "showdetail", sender: nil)
    }

}

