//
//  EVRegisterViewController.swift
//  Eventyk
//
//  Created by Alfredo Luco on 15-09-16.
//  Copyright © 2016 Innovarco. All rights reserved.
//

import UIKit
import RealmSwift

class EVRegisterViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate,UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - IBOutlets
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var birthTextField: UITextField!
    @IBOutlet var mailTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    @IBOutlet var femaleSelection: UIView!
    @IBOutlet var maleSelection: UIView!
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var tastesTableView: UITableView!
    
    //MARK: - Global Variables
    var female: Bool = false
    var male: Bool = false
    var cities =  ["Viña del Mar", "Valparaiso", "Santiago", "La serena", "Punta arenas"]
    var tastes = ["Cine", "Espectaculos","Fiestas","Conciertos"]
    var selectedTastes = List<Taste>()
    //pickerViews
    var datePicker = UIDatePicker()
    var cityPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //birthDatePicker settings
        self.datePicker = UIDatePicker(frame: CGRectMake(0, 200, view.frame.width, 300))
        self.datePicker.datePickerMode = .Date
        self.datePicker.addTarget(self, action: #selector(EVRegisterViewController.dateChanging), forControlEvents: .ValueChanged)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(EVRegisterViewController.doneButton))
        toolBar.setItems([doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        
        self.birthTextField.inputView = self.datePicker
        self.birthTextField.inputAccessoryView = toolBar
        
        //mail settings
        self.mailTextField.keyboardType = .EmailAddress
        
        //male and female settings
        
        self.femaleSelection.layer.borderWidth = 1.0
        self.femaleSelection.layer.borderColor = UIColor.whiteColor().CGColor
        self.femaleSelection.layer.backgroundColor = UIColor.clearColor().CGColor
        let selectFemale = UITapGestureRecognizer(target: self, action: #selector(EVRegisterViewController.selectFemale))
        self.femaleSelection.addGestureRecognizer(selectFemale)
        
        self.maleSelection.layer.borderWidth = 1.0
        self.maleSelection.layer.borderColor = UIColor.whiteColor().CGColor
        self.maleSelection.layer.backgroundColor = UIColor.clearColor().CGColor
        let selectMale = UITapGestureRecognizer(target: self, action: #selector(EVRegisterViewController.selectMale))
        self.maleSelection.addGestureRecognizer(selectMale)
        
        //TODO: city settings, bring them from http (Alamofire)
        self.cityPicker = UIPickerView(frame: CGRectMake(0, 200, view.frame.width, 200))
        self.cityPicker.delegate = self
        self.cityPicker.dataSource = self
        self.cityPicker.showsSelectionIndicator = true
        self.cityTextField.delegate = self
        
        let toolBar2 = UIToolbar()
        toolBar2.barStyle = UIBarStyle.Default
        toolBar2.translucent = true
        toolBar2.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar2.sizeToFit()
        
        toolBar2.setItems([UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil),doneButton], animated: true)
        toolBar2.userInteractionEnabled = true

        self.cityTextField.inputView = self.cityPicker
        self.cityTextField.inputAccessoryView = toolBar2
        
        //TODO: Tastes settings
        self.tastesTableView.delegate = self
        self.tastesTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - ViewController settings
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    //MARK: Picker delegate
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.cities.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.cities[row]
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.cityTextField.text = self.cities[row]
    }
    
    //MARK: - TableView Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tastes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tasteCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.tastes[indexPath.row]
        
        return cell
    }
    
        
    
    //MARK: - IBAction
    
    @IBAction func registerUser(sender: AnyObject) {
        //code
    }
    
    @IBAction func cancelRegistration(sender: AnyObject) {
        //code
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: - Selector Methods
    
    func selectMale(){
        //code
        self.male = true
        self.female = false
        self.maleSelection.backgroundColor = UIColor(red:0.39, green:0.66, blue:0.48, alpha:1.0)
        self.femaleSelection.backgroundColor = UIColor.clearColor()
        
    }
    
    func selectFemale(){
        //code
        self.female = true
        self.male = false
        self.maleSelection.backgroundColor = UIColor.clearColor()
        self.femaleSelection.backgroundColor = UIColor(red:0.39, green:0.66, blue:0.48, alpha:1.0)
    }
    
    func dateChanging(){
        //code
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale.systemLocale()
        formatter.dateFormat = "yyyy-MM-dd"
        self.birthTextField.text = formatter.stringFromDate(self.datePicker.date)
    }
    
    func doneButton(){
        //code
        self.birthTextField.resignFirstResponder()
        self.cityTextField.resignFirstResponder()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
