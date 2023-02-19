//
//  SettingsViewController.swift
//  PI-Game
//
//  Created by Ahmed Salem on 11/02/2023.
//

import UIKit

class SettingsViewController: UIViewController {

    //Mark:- back Outlet
    @IBOutlet weak var backSettingButton: UIButton!
    //Mark:- back Action
    @IBAction func backSettingButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    //Mark:- Table View
    @IBOutlet weak var settingTableView: UITableView!
    
    //Mark:- Setting Options
    let SettingsTableViewData = ["Dark Mode", "Statistics", "Piems", "Language"]
    override func viewDidLoad() {
        super.viewDidLoad()

        //Mark:- Styling table View
        settingTableView.layer.cornerRadius = 5
        
        // Mark:- UITableView Self Delegation and DataSource
        settingTableView.delegate = self
        settingTableView.dataSource = self
        //Mark:- UITable Veiw registeration
        settingTableView.register(UITableViewCell.self,
                                forCellReuseIdentifier: "SettingTableViewCell")
    }
    

   

}

// Mark:- Table data source and delegation
extension SettingsViewController :UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return SettingsTableViewData.count
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell",for: indexPath)
        cell.textLabel?.font = UIFont(name:"Helvetica Neue", size:15)
        cell.textLabel?.text = SettingsTableViewData[indexPath.row]
        
        switch indexPath.row
        {
            case 0:
            
               //here is programatically switch make to the table view
               let switchView = UISwitch(frame: .zero)
               
               //Mark:- Setting Application Mode
             
               switchView.setOn(false, animated: true)
             
              
               switchView.tag = indexPath.row // for detect which row switch Changed
               
               cell.accessoryView = switchView
            
            default:
                    print("Do Not Do Any Thing")
        }
        return cell
        
    }
}
