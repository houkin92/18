//
//  MainViewController.swift
//  卖机票2
//
//  Created by 方瑾 on 2019/3/1.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var airportTicketTableView: UITableView!
    @IBOutlet weak var danChengButton: UIButton!
    @IBOutlet weak var wangfanButton: UIButton!
    @IBOutlet weak var duoChengButton: UIButton!
    var numTitle = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        danChengButton.addTarget(self, action: #selector(change), for: .touchUpInside)
        wangfanButton.addTarget(self, action: #selector(change), for: .touchUpInside)
        duoChengButton.addTarget(self, action: #selector(change), for: .touchUpInside)
        airportTicketTableView.delegate = self
        airportTicketTableView.dataSource = self
//        airportTicketTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        airportTicketTableView.tableFooterView = UIView() //表示不显示cell的地方，不再以cell的形式出现   tableFooterView 没有用到的cell
       
        
    }
    @objc func change(_ sender:UIButton) {
        switch sender {
        case danChengButton:
            numTitle = sender.tag
            danChengButton.backgroundColor = .white
            danChengButton.titleLabel?.textColor = .black
            wangfanButton.backgroundColor = .black
            wangfanButton.titleLabel?.textColor = .white
            duoChengButton.backgroundColor = .black
            duoChengButton.titleLabel?.textColor = .white
        case wangfanButton:
            numTitle = sender.tag
            wangfanButton.backgroundColor = .white
            wangfanButton.titleLabel?.textColor = .black
            danChengButton.backgroundColor = .black
            danChengButton.titleLabel?.textColor = .white
            duoChengButton.backgroundColor = .black
            duoChengButton.titleLabel?.textColor = .white
        default:
            numTitle = sender.tag
            duoChengButton.backgroundColor = .white
            duoChengButton.titleLabel?.textColor = .black
            danChengButton.backgroundColor = .black
            danChengButton.titleLabel?.textColor = .white
            wangfanButton.backgroundColor = .black
            wangfanButton.titleLabel?.textColor = .white
        }
         airportTicketTableView.reloadData()
    }
}
extension MainViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            switch numTitle {
            case 2:
                return 2
            case 3:
                return 3
            default:
                return 1
            }
        default:
            return 1
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! FirstTableViewCell
            switch numTitle {
            case 1:
                cell.arriveTimeTextField.isHidden = true
            case 2:
                cell.arriveTimeTextField.isHidden = false
            default:
                cell.arriveTimeTextField.isHidden = false
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath) as! SecondTableViewCell
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100
        default:
            return 100
        }
    }
    
    
}
