//
//  ViewController.swift
//  PI-Game
//
//  Created by Ahmed Salem on 07/02/2023.
//

import UIKit

class MainViewController: UIViewController {

    //Mark:- setting game finished variables
    public static var flag:Bool = false
    public static var bestScore:String = ""
    public static var globalTimeString:String = "00 : 00 : 00"
    public static var currentScore:String = ""
    //Mark:- user choices array
    public static var userChoices:[Int?] = []
    
    //Mark:- Pi Collection View
    @IBOutlet weak var PICollectionView: UICollectionView!
    
    //Mark:- Time Lable
    @IBOutlet weak var timeLable: UILabel!
    
    //MArk:- timer varibles
    var timer:Timer = Timer()
    var count:Int = 0
    var timingCounting:Bool = false
    
    //Mark:- Settings Icon outlet
    @IBOutlet weak var settingButton: UIButton!
    //Mark:- Settings Icon Action
    
    @IBAction func settingButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "showSettings", sender: nil)
    }
    
    
    //Mark:- numbers OutLets
    @IBOutlet weak var numberOneBtn: UIButton!
    @IBOutlet weak var numbertwoBtn: UIButton!
    @IBOutlet weak var numberThreeBtn: UIButton!
    @IBOutlet weak var numberFourBtn: UIButton!
    @IBOutlet weak var numberFiveBtn: UIButton!
    @IBOutlet weak var numberSixBtn: UIButton!
    @IBOutlet weak var numberSevenBtn: UIButton!
    @IBOutlet weak var numberEightBtn: UIButton!
    @IBOutlet weak var numberNineBtn: UIButton!
    @IBOutlet weak var numberZeroBtn: UIButton!
    
    //Mark:- Actions
    
    @IBAction func numberOneBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
        //read the number from the user
        readNumber(number: 1)
        fireTimer()
        //reload collection view data source
        PICollectionView.reloadData()
        
    }
    
    @IBAction func numberTwoBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
        //read the number from the user
        readNumber(number: 2)
        //reload collection view data source
        PICollectionView.reloadData()
    }
    
    @IBAction func numberThreeBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
        //read the number from the user
        readNumber(number: 3)
        //reload collection view data source
        PICollectionView.reloadData()
    }
    
    
    @IBAction func numberFourBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
        //read the number from the user
        readNumber(number: 4)
        //reload collection view data source
        PICollectionView.reloadData()
    }
    
    
    @IBAction func numberFiveBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
        //read the number from the user
        readNumber(number: 5)
        //reload collection view data source
        PICollectionView.reloadData()
    }
    
    @IBAction func numberSixBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
        //read the number from the user
        readNumber(number: 6)
        //reload collection view data source
        PICollectionView.reloadData()
    }
    
    
    @IBAction func numberSevenBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
        //read the number from the user
        readNumber(number: 7)
        //reload collection view data source
        PICollectionView.reloadData()
    }
    
    
    @IBAction func numberEightBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
        //read the number from the user
        readNumber(number: 8)
        //reload collection view data source
        PICollectionView.reloadData()
    }
    
    
    @IBAction func numberNineBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
        //read the number from the user
        readNumber(number: 9)
        //reload collection view data source
        PICollectionView.reloadData()
    }
    
    @IBAction func numberZeroBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
        //read the number from the user
        readNumber(number: 0)
        //reload collection view data source
        PICollectionView.reloadData()
    }
    
    //Mark:- pi model declaration
    var PIDigitsModels = [PIDigitsModel]()
    
    
    //Mark:- fraction numbers array
    var fractionNumbers:[Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //unwraping the file string
        guard let PIDigitString : String = OfflineServices.PIDigits else { return }
        
        //add empty space at the begining
        PIDigitsModels.append(PIDigitsModel(digitValue: " ",digitIndex: " "))
        for (index, char) in PIDigitString.enumerated()
        {
            if index == 0 || index == 1
            {
                //filling the model with pi digits
                PIDigitsModels.append(PIDigitsModel(digitValue: String(char),digitIndex: " "))
            }else{
                
                //Default Filling
                //filling the model with pi digits
                PIDigitsModels.append(PIDigitsModel(digitValue: "  ",digitIndex: String(index-1)))
                if let number = Int(String(char)) {
                    fractionNumbers.append(number)
                }
                
            }
            
        }
        
        
        //collection view delegate and datasource
        PICollectionView.delegate = self
        PICollectionView.dataSource = self
        
        //collection view Register
        PICollectionView.register(PIFractionSequenceCollectionViewCell.nib(), forCellWithReuseIdentifier: PIFractionSequenceCollectionViewCell.identifier)
        
       
       
    }

    //Mark:- fading effect function
    func fadingEffect(sender:UIButton)
    {
        sender.alpha = 0.4
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 ) {
            sender.alpha = 1.0
        }
    }
}


//Mark:- Collection Delegation and DataSource confirm
extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PIDigitsModels.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = PICollectionView.dequeueReusableCell(withReuseIdentifier: PIFractionSequenceCollectionViewCell.identifier, for: indexPath) as? PIFractionSequenceCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: PIDigitsModels[indexPath.row])
        
        //Mark:- Update the view
        cell.updateView(index: indexPath.row)
        //Mark:- cell fading effect
        cell.cellFadingEffect(index: indexPath.row)
        //Mark:- scrolling to the last item in the list
        collectionView.isPagingEnabled = false
        collectionView.scrollToItem(
            at: IndexPath(item: MainViewController.userChoices.count, section: 0),
            at: .centeredHorizontally,
            animated: false
        )
        collectionView.isPagingEnabled = true
        
        //Mark:- coloring the number sequence
        cell.coloringTheNumbersSequence(index: indexPath.row)
        

        
        return cell
    }
    
    
    
}

extension MainViewController
{
    //Mark:- Fire Timer
    func fireTimer()
    {
        if !timingCounting
        {
            
            timingCounting = true
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
        
    }
    
    //Mark:- Stop Timer
    func stopTimer()
    {
        if timingCounting
        {
            timingCounting = false
            timer.invalidate()
        }
    }
    
    //Mark:- @obj for timer Counter
    @objc func timerCounter()
    {
        count = count + 1
        let time = secondsToHoursMiniutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        MainViewController.globalTimeString = timeString
        timeLable.text = timeString
    }
    
    //Mark:- seconds to hours minutes seconds (seconds: Int) -> (Int, Int, Int)
    func secondsToHoursMiniutesSeconds(seconds: Int) -> (Int, Int, Int)
    {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    //MArk:- make time string function
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String
    {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
      
        return timeString
    }
    
    
}

extension MainViewController
{
    
    //Mark:- read number from the user
    func readNumber(number: Int){
        MainViewController.userChoices.append(number)
    }
}

extension MainViewController{
    //Mark:- Controlling SubViews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if MainViewController.flag
        {
            fireBottomCustomViews()
            stopTimer()
        }
    }
    
    //Mark:- setup the game finished popup
    func fireBottomCustomViews()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "GameFinisedViewController")

        if let sheet = secondVC.sheetPresentationController{

            sheet.preferredCornerRadius = 40

            sheet.detents = [.custom(resolver: {
                context in
                0.6 * context.maximumDetentValue
            }), .large()]

        }
        
        present(secondVC, animated: true)
    }
    
    
}


