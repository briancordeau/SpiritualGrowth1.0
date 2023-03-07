//
//  ViewController.swift
//  SpiritualGrowth
//
//  Created by Brian Cordeau on 12/21/22.
//

import UIKit
//s

//declare an empty discipline string for adding to


//save as playlist to account for user's last preference on closing app
//It should know what the last items were and keep them in order until refresh
//Also keep the number of activities stored.


var spiritualDisciplines = spiritualDisciplinesOriginal







var goalsForMe=spiritualDisciplines[0].activities

let refreshControl = UIRefreshControl()


//Set a playlist to store the order, future checkboxes, etc etc
//will need to use core data at some point in the future
let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Activities.plist")


//made this global to pass back and forth between classes
var currentindex = 0


class ViewController: UIViewController {
    
    @IBOutlet weak var activityStepper: UIStepper!

    
    
    //set up a table view for activity cells
    @IBOutlet weak var activityTableView: UITableView!
    
    //label for number of activities, this text needs to be loaded by playlist
    @IBOutlet weak var numberOfActivities: UILabel!
    
    
    override func viewDidLoad() {
                
        super.viewDidLoad()
        
        activityStepper.value = Double(goalsForMe)

        
        activityStepper.setDecrementImage(activityStepper.decrementImage(for: .normal), for: .normal)
        activityStepper.setIncrementImage(activityStepper.incrementImage(for: .normal), for: .normal)
        
        //load activities based on current save
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent("Activities.plist") {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath) {
                //   print("FILE AVAILABLE")
                loadActivities()
                //    print(url)
                //   print(dataFilePath as Any)
            } else {
                saveActivities()
                //   print("FILE NOT AVAILABLE")
                //   print(dataFilePath as Any)
                
            }
        }
        
        //set up initial view and table to self
        numberOfActivities.text = String(goalsForMe)
        
        activityTableView.delegate = self
        activityTableView.dataSource = self
        activityTableView.allowsSelection = true
        activityTableView.isUserInteractionEnabled = true
        
        //upon refresh the items are shuffled and put back into cells
        refreshControl.addTarget(self, action: #selector(self.refreshActivities(_:)), for: .valueChanged)
        
        //refresh table
        activityTableView.addSubview(refreshControl)
        // refreshActivities((Any).self)
        
        
        
    }
    
    
    //code to work on stepper, each time it updates the class is shuffled, activity number changes,
    
    @IBAction func stepperUpdate(_ sender: UIStepper) {
        
        

        goalsForMe = Int(sender.value)
       
        numberOfActivities.text =  String(goalsForMe)
        
        refreshActivities((Any).self)
                
        saveActivities()
        
        
    }
    
    //shuffle the activity data using built in function
    @IBAction func refreshActivities(_ sender: Any) {
        
        spiritualDisciplines = spiritualDisciplinesOriginal
        saveActivities()



        
        spiritualDisciplines.shuffle()
        //print(activitiesTodoToday)
        //save activity to data model
        
        refreshControl.endRefreshing()
        
        //reload table
        activityTableView.reloadData()
        
    }
    
    
    //share button to send out activities to people
    
    @IBAction func shareMe(_ sender: UIButton) {
        
        //need to revisit this code, seems slow
        //also what if things are not set up properlty?
        //maybe this is version 2?
        
        let activityListForLabel = NSMutableAttributedString()
        
        for c in 0...goalsForMe-1 {
            
            
            activityListForLabel.append(formatText(rowNum: c))
            activityListForLabel.append(NSMutableAttributedString("\n\n"))
        }
        
        
        // text to share
        
        
        let text = "Goal(s) for me:\n\n"+activityListForLabel.string+"Learn more at https://growth2day.wordpress.com/"
        
        // set up activity view controller
        let textToShare = [text]
        let activityViewController = UIActivityViewController(activityItems: textToShare as [Any], applicationActivities: nil)
      //  activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
       // activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        
        
        
    }
    
    //Open up google form for suggestions
    //maybe this is version 2? It gets cluttered with the lower text, maybe remove
    
    @IBAction func makeSuggestion(_ sender: Any) {
        
        
        
        guard let url = URL(string: "https://forms.gle/3cE917kTV8pYCRLV9") else {
            return //be safe
        }
        
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
   // prepare for segue by getting the activity resources set up in the system
     //font formatting, new view controller, set up strings in same format
    //why do this multiple times, how to fix the formatting to be consistent without regenerating code
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if(segue.identifier == "showAdditionalResources"){
            let displayVC = segue.destination as! ResourcesViewController


            displayVC.activityText =  formatText(rowNum:currentindex)
            displayVC.resourceText = spiritualDisciplines[currentindex].resource

            // cell.isUserInteractionEnabled = true





        }



    }
    
    
    
}


//table starts here

extension ViewController: UITableViewDataSource,UITableViewDelegate
{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalsForMe
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "activitiesToDo", for: indexPath)
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.attributedText =  formatText(rowNum:indexPath.row)
        cell.isUserInteractionEnabled = true
        //reloadData()
        
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView,     didSelectRowAt indexPath: IndexPath)  {
        
        currentindex = indexPath.row
        
        
        performSegue(withIdentifier: "showAdditionalResources", sender:self)
        
    }
    
    
    
    
}


func saveActivities()

{
    
    for index in 0 ..< spiritualDisciplines.count {
        spiritualDisciplines[index].activities = goalsForMe
    }
    
    //build encoder to save out activity list in its current save state, do not shuffle
    //until user specifies by swiping down
    
    
    //build encoder to save class data to playlist
    let encoder = PropertyListEncoder()
    
    do{
        let data = try encoder.encode(spiritualDisciplines)
        try data.write(to:dataFilePath!)
    }catch{
        print("error encoding item array")
    }
    
}


func loadActivities()
{
    //default plist must be generated first?
    //load plist to spiritual disciplines in its current state
    //if nothing in playlist, run save activities
    
    if let data = try? Data(contentsOf: dataFilePath!)
    {
        let decoder = PropertyListDecoder()
        do{
            spiritualDisciplines = try decoder.decode([Goal].self, from: data)
            //print("activities loaded")
        } catch{
            //if file does not exist do this first... shuffle, save, print errors
            //this should only happen the first time the app runs
            spiritualDisciplines.shuffle()
            saveActivities()
            print("activies did not load, new one created")
        }
    }
        
}


func formatText(rowNum:Int)->NSMutableAttributedString {
    
    let activityListForLabel = NSMutableAttributedString("")
    
    
    let boldText = spiritualDisciplines[rowNum].title + "\n"
    let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30)]
    let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
    
    let normalText = spiritualDisciplines[rowNum].activity
    let normalString = NSMutableAttributedString(string:normalText)
    
    attributedString.append(normalString)
    //attributedString.append(activityListForLabel)
    activityListForLabel.append(attributedString)
    return activityListForLabel
}



// concatenate attributed strings
func + (left: NSAttributedString, right: NSAttributedString) -> NSAttributedString
{
    let result = NSMutableAttributedString()
    result.append(left)
    result.append(right)
    return result
}
