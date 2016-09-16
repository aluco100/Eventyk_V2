//
//  EVRegisterViewController.swift
//  Eventyk
//
//  Created by Alfredo Luco on 15-09-16.
//  Copyright © 2016 Innovarco. All rights reserved.
//

import UIKit

class EVRegisterViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: birthDatePicker settings
        
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
        
        //TODO: city settings
        
        //TODO: Tastes settings
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - ViewController settings
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
