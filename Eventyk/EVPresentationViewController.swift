//
//  EVPresentationViewController.swift
//  Eventyk
//
//  Created by Alfredo Luco on 14-09-16.
//  Copyright © 2016 Innovarco. All rights reserved.
//

import UIKit
import LIHImageSlider

class EVPresentationViewController: UIViewController,LIHSliderDelegate {

    //MARK: - IBOutlets
    @IBOutlet var imageSlider: UIView!
    
    //MARK: - Global variables
    var vc2: LIHSliderViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //imageSlider settings
        let images = [UIImage(named: "Intro1")!, UIImage(named: "Charlas")!, UIImage(named: "Espectaculos")!]
        let slider1 = LIHSlider(images: images)
        slider1.sliderDescriptions = ["Encuentra los mejores eventos de acuerdo a tus gustos e intereses", "Descripcion2", "Descripcion3"]
        self.vc2 = LIHSliderViewController(slider: slider1)
        self.vc2?.delegate = self
        self.addChildViewController(self.vc2!)
        self.view.addSubview(self.vc2!.view)
        self.vc2?.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - View Controller options
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    //MARK: - IBActions
    
    @IBAction func jumpView(sender: AnyObject) {
        //code to jump to initial view
        
    }
    
    @IBAction func goToRegister(sender: AnyObject) {
        self.performSegueWithIdentifier("registerSegue", sender: self)
    }
    
    
    //TODO: registrar por facebook
    
    //MARK: - LIHSlider dlegate
    override func viewDidLayoutSubviews() {
        
        self.vc2!.view.frame = self.imageSlider.frame
        
    }
    func itemPressedAtIndex(index index: Int) {
        
        print("index \(index) is pressed")
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
