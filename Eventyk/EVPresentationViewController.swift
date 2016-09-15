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
    @IBOutlet var SloganLabel: UILabel!
    @IBOutlet var imageSlider: UIView!
    
    //MARK: - Global variables
    var vc2: LIHSliderViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //imageSlider settings
        let images = [UIImage(named: "Cine")!, UIImage(named: "Charlas")!, UIImage(named: "Espectaculos")!]
        let slider1 = LIHSlider(images: images)
        slider1.sliderDescriptions = ["Descripcion1", "Descripcion2", "Descripcion3"]
        self.vc2 = LIHSliderViewController(slider: slider1)
        self.vc2?.delegate = self
        self.addChildViewController(self.vc2!)
        self.view.addSubview(self.vc2!.view)
        self.vc2?.didMoveToParentViewController(self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - IBActions
    
    @IBAction func jumpView(sender: AnyObject) {
        //code to jump to initial view
        
    }
    
    @IBAction func goToRegister(sender: AnyObject) {
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
