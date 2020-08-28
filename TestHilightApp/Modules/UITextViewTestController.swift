//
//  UITextViewTestController.swift
//  TestHilightApp
//
//  Created by Sajan Kushwaha on 8/8/20.
//  Copyright © 2020 Sajan Kushwaha. All rights reserved.
//

import UIKit

class UITextViewTestController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var highlightTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // To dismiss keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.view.addGestureRecognizer(tap)
        
        highlightTextView.delegate = self
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.view.endEditing(true)
    }
    
    @IBAction func changeFontSize(_ sender: UISlider) {
        let text = highlightTextView.text
        highlightTextView.text = ""
        highlightTextView.font = highlightTextView.font?.withSize(CGFloat(sender.value))
        highlightTextView.text = text
        DispatchQueue.main.async {
            self.highlightTextView.highlightAllText()
        }
        
    }
    
    
//    - (IBAction)sliderTap:(UISlider*)sender {
//        tvVarse.text=@"";//Just provided blank text before loading textview again
//        tvVarse.font = [tvVarse.font fontWithSize:sender.value];
//        tvVarse.text=strTextToShow;
//
//    }
//
    
    //MARK: - UITextView Delegate
    func textViewDidChange(_ textView: UITextView) {
        textView.highlightAllText()
    }

}
