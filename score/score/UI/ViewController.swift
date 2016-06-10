//
//  ViewController.swift
//  score
//
//  Created by FanFamily on 16/6/10.
//  Copyright © 2016年 niuniu. All rights reserved.
//

import UIKit

extension UIFont {
    func sizeOfString (string: String, constrainedToHeight height: Double) -> CGSize {
        return NSString(string: string).boundingRectWithSize(CGSize(width: DBL_MAX, height: height),
                                                             options: NSStringDrawingOptions.UsesLineFragmentOrigin,
                                                             attributes: [NSFontAttributeName: self],
                                                             context: nil).size
    }
    
    func sizeOfString (string: String, constrainedToWidth width: Double) -> CGSize {
        return NSString(string: string).boundingRectWithSize(CGSize(width: width, height: DBL_MAX),
                                                             options: NSStringDrawingOptions.UsesLineFragmentOrigin,
                                                             attributes: [NSFontAttributeName: self],
                                                             context: nil).size
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let abilityTableView = UITableView()
    var abiliryList:[Ability] = [Ability]()
    let kAbilityCellIdentifier = "kAbilityCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initAbilityTableView()
        
        for _:Int in 1...100 {
            abiliryList.append(Ability(declare: "1dakajsdklajdklajsdklajkldjaskldjaklsdjakldsjaklsdjaklsdjaklsdjakldjsaklsdjaklsd", score: 10))
        }
    }
    
    func initAbilityTableView() {
        view.addSubview(abilityTableView)
        abilityTableView.snp_makeConstraints { (make) in
            make.top.equalTo(topLayoutGuide)
            make.bottom.equalTo(bottomLayoutGuide)
            make.left.right.equalTo(view)
        }
        
        abilityTableView.dataSource = self
        abilityTableView.delegate = self
        abilityTableView.registerClass(AbilityTableViewCell.self, forCellReuseIdentifier: kAbilityCellIdentifier)
        abilityTableView.backgroundColor = UIColor.whiteColor()
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return abiliryList.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kAbilityCellIdentifier) as! AbilityTableViewCell
        cell.abilityDeclareLabel.text = abiliryList[indexPath.row].declare
        return cell
    }
    
    internal func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let height:CGFloat = UIFont.systemFontOfSize(16.0).sizeOfString(abiliryList[indexPath.row].declare, constrainedToWidth: Double(view.frame.width - 25)).height + 30
        return height
    }
}

