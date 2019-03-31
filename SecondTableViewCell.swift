//
//  SecondTableViewCell.swift
//  卖机票2
//
//  Created by 方瑾 on 2019/3/1.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    @IBOutlet weak var chooseSeatTextField: UITextField!
    
    @IBOutlet weak var haveChildrenTextField: UITextField!
    var chooseSeatPickerView = UIPickerView()
    var haveChildrenPickerView = UIPickerView()
    var seat = ["经济舱","公务/头等舱"]
    var child = ["无","婴儿","儿童"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        chooseSeatTextField.inputView = chooseSeatPickerView
        chooseSeatPickerView.delegate = self
        chooseSeatPickerView.dataSource = self
        haveChildrenTextField.inputView = haveChildrenPickerView
        haveChildrenPickerView.delegate = self
        haveChildrenPickerView.dataSource = self
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
    }
    
}
extension SecondTableViewCell: UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case chooseSeatPickerView:
            return 1
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case chooseSeatPickerView:
            return seat.count
        default:
            return child.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case chooseSeatPickerView:
            return seat[row]
        default:
            return child[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case chooseSeatPickerView:
            chooseSeatTextField.text = seat[row]
        default:
            haveChildrenTextField.text = child[row]
        }
    }
    
}
