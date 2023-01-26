//
//  ViewController.swift
//  SpiritualGrowth
//
//  Created by Brian Cordeau on 12/21/22.
//

import UIKit
//s

//declare an empty discipline string for adding to

var activitiesTodoToday=1

let refreshControl = UIRefreshControl()

let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Activities.plist")






func saveActivities(){
    
    //build encoder to save out activity list in its current state
    
    let encoder = PropertyListEncoder()
    
    do{
        let data = try encoder.encode(spiritualDisciplines)
        try data.write(to:dataFilePath!)
    }catch{
        print("error encoding item array")
    }
}


func loadActivities(){
    
    //load plist to spiritual disciplines in its current state
    
    if let data = try? Data(contentsOf: dataFilePath!)
    {
        let decoder = PropertyListDecoder()
        do{
            spiritualDisciplines = try decoder.decode([Activity].self, from: data)
            
        } catch{
            print("error")
        }
    }
    
    
    
    
    
    
    
    
    
}


class ViewController: UIViewController {
    
    @IBOutlet weak var activityTableView: UITableView!
    
    @IBOutlet weak var numberOfActivities: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //  print (dataFilePath)
        
        //load activities based on current save
        
        loadActivities()
        
        
        numberOfActivities.text = String(activitiesTodoToday)
        
        activityTableView.delegate = self
        activityTableView.dataSource = self
        activityTableView.allowsSelection = true
        activityTableView.isUserInteractionEnabled = true
        
        
        refreshControl.addTarget(self, action: #selector(self.refreshActivities(_:)), for: .valueChanged)
        
        activityTableView.addSubview(refreshControl)
        refreshActivities((Any).self)
        
        refreshControl.endRefreshing()
        
        
    }
    
    
    
    @IBAction func stepperUpdate(_ sender: UIStepper) {
        
        activitiesTodoToday = Int(sender.value)
        
        numberOfActivities.text =  String(activitiesTodoToday)
        
        refreshActivities((Any).self)
        
        
        
    }
    
    @IBAction func refreshActivities(_ sender: Any) {
        
        
        
        //        numberOfActivities.text =  String(activitiesTodoToday)
        
        
        
        spiritualDisciplines.shuffle()
        
        activityTableView.reloadData()
        
        
        refreshControl.endRefreshing()
        
        saveActivities()
    }
    
    
    // Do any additional setup after loading the view.
    
    @IBAction func shareMe(_ sender: UIButton) {
        
        
        
        let activityListForLabel = NSMutableAttributedString()
        
        
        for c in 0...activitiesTodoToday-1 {
            
            let boldText = spiritualDisciplines[c].title + "\n"
            let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30)]
            let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
            
            let normalText = spiritualDisciplines[c].name+"\n\n"
            let normalString = NSMutableAttributedString(string:normalText)
            
            attributedString.append(normalString)
            //attributedString.append(activityListForLabel)
            activityListForLabel.append(attributedString)
            
        }
        
        
        // text to share
        let text = "I'm doing these:\n\n"+activityListForLabel.string+"\n\nDownload SpiritualGrowth App from the appstore"
        
        // set up activity view controller
        let textToShare = [text]
        let activityViewController = UIActivityViewController(activityItems: textToShare as [Any], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func makeSuggestion(_ sender: Any) {
        
        
        guard let url = URL(string: "https://forms.gle/3cE917kTV8pYCRLV9") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
        
        
        
    }
    
    
}


extension ViewController: UITableViewDataSource,UITableViewDelegate
{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activitiesTodoToday
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "activitiesToDo", for: indexPath)
        tableView.cellForRow(at: indexPath)?.accessoryType = .none

        
        cell.textLabel?.numberOfLines = 0
        
        
        let activityListForLabel = NSMutableAttributedString("")
        
        
        let boldText = spiritualDisciplines[indexPath.row].title + "\n"
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30)]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        
        let normalText = spiritualDisciplines[indexPath.row].name
        let normalString = NSMutableAttributedString(string:normalText)
        
        attributedString.append(normalString)
        //attributedString.append(activityListForLabel)
        activityListForLabel.append(attributedString)
        
        
        cell.textLabel?.attributedText =  activityListForLabel
        cell.isUserInteractionEnabled = true
        //reloadData()
        return cell
    }
    

    func tableView(_ tableView: UITableView,     didSelectRowAt indexPath: IndexPath)  {

        
        
        
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

  //      if         tableView.cellForRow(at: indexPath)?.accessoryType == //.checkmark{
 //           tableView.cellForRow(at: indexPath)?.accessoryType = .none
//}
 //       else {
 //           tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
  //      }
//
  //      tableView.deselectRow(at: indexPath, animated: true)

        
        
        
        
        
        
        
       // performSegue(withIdentifier: "showAdditionalResources", sender:self)
        
    }
  
    
    
    
}
