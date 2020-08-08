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
    
    
    //MARK: - UITextView Delegate
    func textViewDidChange(_ textView: UITextView) {
        textView.highlightAllText()
    }

}
