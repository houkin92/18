//
//  FirstTableViewCell.swift
//  卖机票2
//
//  Created by 方瑾 on 2019/3/1.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var arriveTextField: UITextField!
    @IBOutlet weak var fromTimeTextField: UITextField!
    @IBOutlet weak var arriveTimeTextField: UITextField!
    @IBOutlet weak var flyButton: UIButton!
    var country = ["杭州","北京","上海","厦门","西安","深圳","福州","武汉","成都","青岛","广州","大连","三亚","长沙","济南"]
    var yearArray = ["2019","2020","2021","2022","2023","2024","2025","2026","20227","2028","2029","2030","2031","2032","2033","2034","2035","2036","2037","2038","2039","2040","2041","2042","2043","2044","2045","2046","2047","2048","2049","2050"]
    
    var monthArray = ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]
    var dayArray = ["1日","2日","3日","4日","5日","6日","7日","8日","9日","10日","11日","12日","13日","14日","15日","16日","17日","18日","19日","20日","21日","22日","23日","24日","25日","26日","27日","28日","29日","30日","31日"]
    
    var fromTextFieldPickerView = UIPickerView()
    var arriveTextFieldPickerView = UIPickerView()
    var fromTimeTextFieldPickerView = UIPickerView()
    var arriveTimeTextFieldPickerView = UIPickerView()
    var count = 31
    var count1 = 31
    var year = Int()
    var month = Int()
    var day = Int()
    var year1 = Int()
    var month1 = Int()
    var day1 = Int()
    var num = 0
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fromTextField.inputView = fromTextFieldPickerView
        fromTextFieldPickerView.delegate = self
        fromTextFieldPickerView.dataSource = self
        arriveTextField.inputView = arriveTextFieldPickerView
        arriveTextFieldPickerView.delegate = self
        arriveTextFieldPickerView.dataSource = self
        fromTimeTextField.inputView = fromTimeTextFieldPickerView
        fromTimeTextFieldPickerView.delegate = self
        fromTimeTextFieldPickerView.dataSource = self
        arriveTimeTextField.inputView = arriveTimeTextFieldPickerView
        arriveTimeTextFieldPickerView.delegate = self
        arriveTimeTextFieldPickerView.dataSource = self
        flyButton.addTarget(self, action: #selector(changeFly), for: .touchUpInside)
    }
    @objc func changeFly() {
        UIView.animate(withDuration: 0.5, animations: {
            self.num += 1
            let otherTextField = self.fromTextField.frame
            self.fromTextField.frame = self.arriveTextField.frame
            self.arriveTextField.frame = otherTextField
            if self.num % 2 != 0 {
                self.fromTextField.textAlignment = .right
                self.arriveTextField.textAlignment = .left
            } else {
                self.fromTextField.textAlignment = .left
                self.arriveTextField.textAlignment = .right
            }

        })
    }
}
extension FirstTableViewCell : UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case fromTextFieldPickerView:
            return 1
        case arriveTextFieldPickerView:
            return 1
        case fromTimeTextFieldPickerView:
            return 3
        default:
            return 3
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case fromTextFieldPickerView:
            return country.count
        case arriveTextFieldPickerView:
            return country.count
        case fromTimeTextFieldPickerView:
            return count
        default:
            return count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case fromTextFieldPickerView:
            return country[row]
        case arriveTextFieldPickerView:
            return country[row]
        case fromTimeTextFieldPickerView:
            switch component {
            case 0:
                return yearArray[row]
            case 1:
                return monthArray[row]
            default:
                return dayArray[row]
            }
        default:
            switch component {
            case 0:
                return yearArray[row]
            case 1:
                return monthArray[row]
            default:
                return dayArray[row]
            }
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case fromTextFieldPickerView:
            fromTextField.text = country[row]
        case arriveTextFieldPickerView:
            arriveTextField.text = country[row]
        case fromTimeTextFieldPickerView:
            switch component {
            case 0:
                year = row
            case 1:
                month = row
                switch monthArray[month] {
                case "1月","3月","5月","7月","8月","10月","12月":
                    count = 31
                case "2月":
                    count = 28
                default:
                    count = 30
                }
            default:
                day = row
                
            }
            pickerView.reloadComponent(2)
            fromTimeTextField.text = "\(yearArray[year])年\(monthArray[month])\(dayArray[day])"
        default:
            switch component {
            case 0:
                year1 = row
            case 1:
                month1 = row
                switch monthArray[month] {
                case "1月","3月","5月","7月","8月","10月","12月":
                    count1 = 31
                case "2月":
                    count1 = 28
                default:
                    count1 = 30
                }
            default:
                day1 = row
                
            }
            pickerView.reloadComponent(2)
            fromTimeTextField.text = "\(yearArray[year])年\(monthArray[month])\(dayArray[day])"
        }
    }
        
}
