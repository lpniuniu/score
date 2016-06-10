//
//  AbilityTableViewCell.swift
//  score
//
//  Created by FanFamily on 16/6/10.
//  Copyright © 2016年 niuniu. All rights reserved.
//

import UIKit
import SnapKit
import Cosmos

class AbilityTableViewCell: UITableViewCell {
    
    let abilityDeclareLabel:UILabel = UILabel()
    let starView:CosmosView = CosmosView()
        
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .None
        
        addSubview(abilityDeclareLabel)
        abilityDeclareLabel.font = UIFont.systemFontOfSize(16.0)
        abilityDeclareLabel.numberOfLines = 0
        abilityDeclareLabel.textAlignment = .Natural
        abilityDeclareLabel.snp_makeConstraints { (make) in
            make.left.equalTo(self).inset(15)
            make.right.equalTo(self).inset(10)
            make.top.equalTo(self)
        }
        
        addSubview(starView)
        starView.backgroundColor = UIColor.whiteColor()
        starView.snp_makeConstraints { (make) in
            make.top.equalTo(abilityDeclareLabel.snp_bottom)
            make.left.equalTo(abilityDeclareLabel)
            make.right.equalTo(self)
            make.height.equalTo(25)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
