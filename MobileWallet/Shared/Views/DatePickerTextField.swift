//
//  DatePickerTextField.swift
//  MobileWallet
//
//  Created by karollo on 23/04/2021.
//

import SwiftUI


struct DatePickerTextField: UIViewRepresentable {
    private let helper = Helper()
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter
    }()
    
    public var placeHolder: String = ""
    @Binding public var date: Date?
    
    func makeUIView(context: UIViewRepresentableContext<DatePickerTextField>) -> UITextField {
        
        
        let datePicker = createDatePicker()
        let textField = createTextField(with: datePicker)
        
        helper.dateChanged = {
            date = datePicker.date
        }
        
        helper.doneButtonTapped = {
            textField.resignFirstResponder()
        }
        
        return textField
       
    }
    
    private func createTextField(with datePicker: UIDatePicker) -> UITextField {
        let textField = UITextField()
        let toolbar = createToolbar()
        let datePicker = datePicker
        
        textField.inputView = datePicker
        textField.inputAccessoryView = toolbar
        textField.placeholder = placeHolder
        textField.attributedPlaceholder = NSAttributedString(string: placeHolder,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textField.underlined()
        
        textField.tintColor = UIColor.clear
        
        return textField
    }
    
    private func createDatePicker() -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(helper, action: #selector(helper.dateValueChanged), for: .valueChanged)
        datePicker.sizeToFit()
        datePicker.backgroundColor = .white
        return datePicker
    }
    
    private func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSize = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: helper, action: #selector(helper.doneButtonAction))
        
        toolbar.setItems([flexibleSize, doneButton], animated: true)
        toolbar.backgroundColor = .white
        return toolbar
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        if let selectedDate = date {
            uiView.text = dateFormatter.string(from: selectedDate)
        }
    }
}

extension DatePickerTextField {
    class Helper {
        public var dateChanged: (() -> Void)?
        public var doneButtonTapped: (() -> Void)?
        
        @objc func dateValueChanged() {
            dateChanged?()
        }
        
        @objc func doneButtonAction() {
            doneButtonTapped?()
        }
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
