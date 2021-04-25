//
//  DatePickerTextField.swift
//  MobileWallet
//
//  Created by karollo on 23/04/2021.
//

import SwiftUI


struct DatePickerTextField: UIViewRepresentable {
    private let textfield = UITextField()
    private let datePicker = UIDatePicker()
    private let helper = Helper()
    //    private let helper
    //    private let dateFormatter: DateFormatter = {
    //
    //    }
    public var placeHolder: String = ""
    @Binding public var date: Date?
    
    func makeUIView(context: UIViewRepresentableContext<DatePickerTextField>) -> UITextField {
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self.helper, action: #selector(self.helper.dateValueChanged), for: .valueChanged)
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSize = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self.helper, action: #selector(self.helper.doneButtonAction))
        
        toolbar.setItems([flexibleSize, doneButton], animated: true)
        self.textfield.inputAccessoryView = toolbar
        
        self.helper.dateChanged = {
            self.date = self.datePicker.date
        }
        
        self.helper.doneButtonTapped = {
            self.textfield.resignFirstResponder()
        }
        
        self.datePicker.sizeToFit()
        self.datePicker.backgroundColor = .white
        toolbar.backgroundColor = .white
        self.textfield.placeholder = self.placeHolder
        textfield.attributedPlaceholder = NSAttributedString(string: "Set time",
                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        self.textfield.inputView = self.datePicker
        self.textfield.underlined()
        
        self.textfield.tintColor = UIColor.clear
        
        return self.textfield
    }
    
    class Helper {
        public var dateChanged: (() -> Void)?
        public var doneButtonTapped: (() -> Void)?
        
        @objc func dateValueChanged() {
            self.dateChanged?()
        }
        
        @objc func doneButtonAction() {
            self.doneButtonTapped?()
        }
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

extension UITextField {
    
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.green.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
