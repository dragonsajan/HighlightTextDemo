//
//  UILableTextController.swift
//  TestHilightApp
//
//  Created by Sajan Kushwaha on 8/8/20.
//  Copyright © 2020 Sajan Kushwaha. All rights reserved.
//

import UIKit

class UILableTextController: UIViewController {

    @IBOutlet weak var sampleTextView: UITextView!
    @IBOutlet weak var sampleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // To dismiss keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.view.addGestureRecognizer(tap)
        sampleTextView.text = "The first time I cannot I had a good day and a lot more to get better app better "
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        self.view.endEditing(true)
    }


    //MARK: - Button Pressed Event
    @IBAction func updateLablePressed(_ sender: Any) {
        print(sampleLabel.frame)
        sampleLabel.text = sampleTextView.text
        sampleLabel.highlightAllText()
    }
    
    @IBAction func changeFontSize(_ sender: UISlider) {
        let text = sampleLabel.text
               sampleLabel.text = ""
               sampleLabel.font = sampleLabel.font?.withSize(CGFloat(sender.value))
               sampleLabel.text = text
               DispatchQueue.main.async {
                   self.sampleLabel.highlightAllText()
               }
    }
}



