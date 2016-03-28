//
//  HomeMenuBtn.swift
//  ZFMeiTuan
//
//  Created by 赵飞 on 16/3/18.
//  Copyright © 2016年 赵飞. All rights reserved.
//

import UIKit

class HomeMenuBtn: UIButton {
    
    init(frame: CGRect, imageName: String, title: String) {
        super.init(frame: frame)
        let imageView = UIImageView(frame: CGRect(x: frame.width / 2 - 22, y: 5, width: 44, height: 44))
        imageView.image = UIImage(named: imageName)
        self.addSubview(imageView)
        
        let label = UILabel(frame: CGRect(x: 0, y: CGRectGetMaxY(imageView.frame) + 5, width: frame.width, height: 11))
        label.text = title
        label.font = UIFont.systemFontOfSize(12)
        label.textAlignment = .Center
        self.addSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
