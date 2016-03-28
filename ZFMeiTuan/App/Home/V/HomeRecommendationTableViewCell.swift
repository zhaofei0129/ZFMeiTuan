//
//  HomeRecommendationTableViewCell.swift
//  ZFMeiTuan
//
//  Created by 赵飞 on 16/3/18.
//  Copyright © 2016年 赵飞. All rights reserved.
//

import UIKit

class HomeRecommendationTableViewCell: UITableViewCell {

    var shopImageView: UIImageView!
    var shopNameLabel: UILabel!
    var distanceLabel: UILabel!
    var shopInfoLabel: UILabel!
    var priceLabel: UILabel!
    var soldedLabel: UILabel!
        
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 店铺头像
        shopImageView =  UIImageView(frame: CGRect(x: 10, y: 10, width: 80, height: 80))
        shopImageView.layer.masksToBounds = true
        shopImageView.layer.cornerRadius = 4.0
        self.contentView.addSubview(shopImageView)
        
        // 距离
        distanceLabel = UILabel(frame: CGRect(x: self.frame.width - 10 - 40, y: 10, width: 40, height: 20))
        distanceLabel.font = UIFont.systemFontOfSize(12)
        distanceLabel.textColor = UIColor.grayColor()
        self.contentView.addSubview(distanceLabel)
        
        // 店名
        shopNameLabel = UILabel(frame: CGRect(x: CGRectGetMaxX(shopImageView.frame) + 10, y: 10, width: CGRectGetMinX(distanceLabel.frame) - CGRectGetMaxX(shopImageView.frame) - 10 - 10, height: 20))
        shopNameLabel.font = UIFont.systemFontOfSize(15)
        self.contentView.addSubview(shopNameLabel)
        
        // 店铺简要
        shopInfoLabel = UILabel(frame: CGRect(x: CGRectGetMaxX(shopImageView.frame) + 10, y: CGRectGetMaxY(shopNameLabel.frame) + 5, width: self.frame.width - CGRectGetMaxX(shopImageView.frame) - 10 - 20, height: 30))
        shopInfoLabel.font = UIFont.systemFontOfSize(12)
        shopInfoLabel.textColor = UIColor.grayColor()
        shopInfoLabel.numberOfLines = 2
        self.contentView.addSubview(shopInfoLabel)
        
        // 价格
        priceLabel = UILabel(frame: CGRect(x: CGRectGetMaxX(shopImageView.frame) + 10, y: CGRectGetMaxY(shopInfoLabel.frame) + 5, width: 40, height: 20))
        priceLabel.font = UIFont.systemFontOfSize(17)
        priceLabel.textColor = gSystemGreen
        self.contentView.addSubview(priceLabel)
        
        // 已售
        soldedLabel = UILabel(frame: CGRect(x: self.frame.width - 10 - 80, y: CGRectGetMaxY(shopInfoLabel.frame) + 5, width: 80, height: 20))
        soldedLabel.font = UIFont.systemFontOfSize(12)
        soldedLabel.textColor = UIColor.grayColor()
        soldedLabel.textAlignment = .Right
        self.contentView.addSubview(soldedLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal func setRecommendationModel(recommendation: HomeRecommendationModel) {
        
        shopImageView.image = UIImage(named: recommendation.shopImageName)
        
        distanceLabel.text = "\(recommendation.distance)km"
        
        shopNameLabel.text = recommendation.shopName
        
        shopInfoLabel.text = recommendation.shopInfo
        
        priceLabel.text = "¥\(recommendation.price)"
        
        soldedLabel.text = "已售\(recommendation.soldedNumber)"
    }
}