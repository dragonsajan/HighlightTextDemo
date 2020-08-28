//
//  CATextLayerTestController.swift
//  TestHilightApp
//
//  Created by Sajan Kushwaha on 8/8/20.
//  Copyright © 2020 Sajan Kushwaha. All rights reserved.
//

import UIKit

class CATextLayerTestController: UIViewController {

    @IBOutlet weak var sampleView: UIView!
    @IBOutlet weak var sampleTextView: UITextView!
    
    var caTextLayer: CATextLayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // To dismiss keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        self.view.endEditing(true)
    }


    //MARK: - Button Pressed Event
    @IBAction func createLayerPressed(_ sender: Any) {
        
        if let _ = caTextLayer {
            self.sampleView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        }
        
        
        caTextLayer = CATextLayer()
        caTextLayer?.string = sampleTextView.text
        caTextLayer?.frame = CGRect(x:0, y:0, width:sampleTextView.bounds.width, height:sampleTextView.bounds.height)
        caTextLayer?.backgroundColor = UIColor.yellow.cgColor
        
        
        let myAttributes = [
            NSAttributedString.Key.font: sampleTextView.font, // font
            NSAttributedString.Key.foregroundColor: UIColor.black                    // text color
        ]
        let myAttributedString = NSAttributedString(string: sampleTextView.text, attributes: myAttributes as [NSAttributedString.Key : Any] )
        
        
        caTextLayer?.string = myAttributedString


        
        if let caTextLayer = caTextLayer {
            sampleView.layer.addSublayer(caTextLayer)
            caTextLayer.highlightAllText()
        }
        
    }
}
