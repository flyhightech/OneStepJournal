//
//  CreateJournalViewController.swift
//  OneStepJournal
//
//  Created by Bernard Huff on 9/6/18.
//  Copyright © 2018 Flyhightech.LLC. All rights reserved.
//

import UIKit

class CreateJournalViewController: UIViewController {

    @IBOutlet weak var aboveNavbarView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var journalTextView: UITextView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    var date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navBar.barTintColor = UIColor(red: 0.298, green: 0.757, blue: 0.988, alpha: 1.00)
        
        navBar.tintColor = .white
        
        navBar.isTranslucent = false
        
        navBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        
        aboveNavbarView.backgroundColor = UIColor(red: 0.298, green: 0.757, blue: 0.988, alpha: 1.00)
        
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateDate()
    }
    
    func updateDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d, yyyy"
        navBar.topItem?.title = formatter.string(from: date)
    }
    
    @objc func KeyboardWillHide(notification: Notification) {
        
        changeKeyboardHeight(notification: notification)
    }
    
    @objc func KeyboardWillShow(notification: Notification) {
        
        changeKeyboardHeight(notification: notification)
    }
    
    func changeKeyboardHeight(notification: Notification) {
        
        if let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue) {
            
            let keyHeight = keyboardFrame.cgRectValue.height
            bottomConstraint.constant = keyHeight + 10
        }
    }

    @IBAction func cancelBtnTapped(_ sender: Any) {
        
        
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        
        
    }
    
    @IBAction func setDateTapped(_ sender: Any) {
        journalTextView.isHidden = false
        datePicker.isHidden = true
        setButton.isHidden = true
        date = datePicker.date
        updateDate()
    }
    
    @IBAction func calenderBtnTapped(_ sender: Any) {
        journalTextView.isHidden = true
        datePicker.isHidden = false
        setButton.isHidden = false
        datePicker.date = date
    }
    
    @IBAction func cameraBtnTapped(_ sender: Any) {
        
        
    }
    
    
    
    
    
    
    
    
    
} //End of the code on this view controller
