//
//  CGDrawLineCell.swift
//  DemoGroup
//
//  Created by Shi Feng on 2018/11/9.
//  Copyright © 2018 Shi Feng. All rights reserved.
//

import UIKit

class CGDrawLineCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let drawView = CGDrawLineDemoView(frame: CGRect(x: 30, y: 30, width: 120, height: 120))
        self.addSubview(drawView)
        
        let drawCircleView = CGDrawCircleLineDemoView(frame: CGRect(x: 200, y: 30, width: 60, height: 60))
        self.addSubview(drawCircleView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

class CGDrawLineDemoView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let lineRect = self.bounds.insetBy(dx: 20, dy: 20)
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: lineRect.minX, y: lineRect.minY))
        path.addLine(to: CGPoint(x: lineRect.maxX, y: lineRect.minY))
        path.addLine(to: CGPoint(x: lineRect.maxX, y: lineRect.maxY))
        
        context.addPath(path)
        context.setStrokeColor(UIColor.yellow.cgColor) //笔触颜色
        context.setLineWidth(20) //笔触宽度
        /**
         .mitre：锐角斜切（默认值）
         .round：圆头
         .bevel：平头斜切
        **/
        context.setLineJoin(.round) //线条拐点样式
        context.setShadow(offset: CGSize(width: 10, height: 10), blur: 5, color: UIColor.lightGray.cgColor) //设置阴影（偏移量，模糊度，颜色）
        
        /**
         phase表示开始绘制之前跳过多少点进行绘制，默认一般设置为0
         lengths通常都包含两个数字，第一个是绘制的宽度，第二个表示跳过的宽度，也可以设置多个，多个情况下，奇数为绘制的宽度，偶数为间隔的宽度，无限循环
        **/
        let length: [CGFloat] = [15, 4, 8]
        context.setLineDash(phase: 0, lengths: length) //设置虚线
        
        context.strokePath() //绘制
    }
}

class CGDrawCircleLineDemoView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
}
