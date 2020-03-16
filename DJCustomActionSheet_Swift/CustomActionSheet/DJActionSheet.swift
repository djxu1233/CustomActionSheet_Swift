//
//  DJActionSheet.swift
//  DJCustomActionSheet_Swift
//
//  Created by minstone.DJ on 2020/3/16.
//  Copyright © 2020 minstone. All rights reserved.
//

import UIKit

protocol DJActionSheetDelegate {
    func actionSheetSelect(_ selectedModel: DJActionSheetModel, selectedIndex: NSInteger) -> Void
}

let cellHeight: CGFloat = 55.0

class DJActionSheet: UIView {
    
    let bgView = UIView()
    let containerV = UIView()
    let tableView = UITableView()
    let cancelBtn = UIButton()
    let seperateV = UIView()
    
    var delegate: DJActionSheetDelegate?
    
    
    var dataSource = NSMutableArray()
    
    
    var containerVHeight: CGFloat = 0
    var tableHeight: CGFloat = 0
    //展开收起时间
    var expendTime:Double = 0.25
    
    

    init(frame: CGRect, dataSource: NSMutableArray) {
        super.init(frame: frame)
        
        self.dataSource = dataSource
        if dataSource.count > 4 {
            self.tableHeight = cellHeight * 4 + 36.0
        } else {
            self.tableHeight = cellHeight * CGFloat(dataSource.count)
        }
        
        self.containerVHeight = self.tableHeight + cellHeight + 6 + CGFloat(bottomSafeHeight);
        // 展开时间
        self.expendTime = 0.25;
        
        self.configUI()
    
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configUI() {
        
        self.setupBgView()
        self.setupContainV()
        
        self.tableView.reloadData()
    }
    
    func show() {
        //显示之前收起当前页面的键盘
        
        UIApplication.shared.windows.first?.endEditing(true)
        UIApplication.shared.windows.first?.addSubview(self)
    
        self.bgView.alpha = 0;
        UIView.animate(withDuration: self.expendTime, animations: {
            self.bgView.alpha = 1.0;
            self.containerV.frame = CGRect.init(x: 0, y: self.frame.size.height - self.containerVHeight, width: self.frame.size.width, height: self.containerVHeight)
            
        }) { (finished) in
            
        }
    }
    
    func hide() {
        
        self.bgView.alpha = 1.0
        
        UIView.animate(withDuration: self.expendTime, animations: {
            self.bgView.alpha = 0;
            self.containerV.frame = CGRect.init(x: 0, y: self.frame.size.height, width: self.frame.size.width, height: self.containerVHeight)

        }) { (finished) in
            self.removeFromSuperview()
        }
        
    }
    
    //创建黑色背景
    func setupBgView() {
        self.bgView.frame = self.bounds
        self.bgView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        self.addSubview(self.bgView)
    }
    
    //创建容器
    func setupContainV() {
        self.containerV.frame = CGRect.init(x: 0, y: self.frame.height, width: kScreenWidth, height: self.containerVHeight)
        self.containerV.backgroundColor = .white
        self.addSubview(self.containerV)
        self.setupTableView()
        self.setupCancelBtn()
        self.setupSeperateV()
    }
    
    // 创建tableView
    func setupTableView() {
        self.tableView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: self.tableHeight)
        self.tableView.separatorStyle = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.contentInsetAdjustmentBehavior = .never
        self.tableView.register(DJActionSheetCell.self, forCellReuseIdentifier: NSStringFromClass(DJActionSheetCell.self))
        self.containerV.addSubview(self.tableView)
    }
    
    // 创建取消按钮cancelBtn
    func setupCancelBtn() {
        self.cancelBtn.frame = CGRect.init(x: 0, y: self.tableHeight + 6, width: kScreenWidth, height: 50)
        self.cancelBtn.setTitle("取消", for: .normal)
        self.cancelBtn.setTitleColor(.black, for: .normal)
        self.cancelBtn.setTitleColor( UIColor.black.withAlphaComponent(0.5), for: .highlighted)
        self.cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        self.cancelBtn.addTarget(self, action: #selector(cancelBtnAction(_:)), for: .touchUpInside)
        self.containerV.addSubview(self.cancelBtn)
    }
    
    // 创建分割线
    func setupSeperateV() {
        self.seperateV.frame = CGRect.init(x: 0, y: self.tableHeight, width: kScreenWidth, height: 6.0)
        self.seperateV.backgroundColor = UIColor.lightGray.withAlphaComponent(0.25)
        self.containerV.addSubview(self.seperateV)
    }

    // 懒加载渐变gradientLayer
    lazy var gradientLayer: CAGradientLayer = {

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.white.withAlphaComponent(0.1).cgColor, UIColor.white.cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 0, y: 1.0)
        gradientLayer.frame = CGRect.init(x: 0, y: self.tableHeight - 60, width: kScreenWidth, height: 60)
        return gradientLayer
    }()
    
    @objc func cancelBtnAction(_ sender: UIButton) {
        
        print("cancel Button clicked")
        self.hide()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            //获取用户的点击坐标
            let point: CGPoint = touch.location(in: self)
            let pointY = point.y
            
            if (pointY < self.frame.size.height - self.containerVHeight) {
                
                // 点击背景回调block
                self.hide()
            }
        }
        
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension DJActionSheet: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(DJActionSheetCell.self)) as! DJActionSheetCell
        
        let model: DJActionSheetModel = self.dataSource[indexPath.row] as! DJActionSheetModel
        cell.configModel(model)
        
        if indexPath.row < self.dataSource.count - 1 {
            cell.lineV.isHidden = false
        } else {
            cell.lineV.isHidden = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedModel: DJActionSheetModel = self.dataSource[indexPath.row] as! DJActionSheetModel
        
        self.delegate?.actionSheetSelect(selectedModel, selectedIndex: indexPath.row)
        self.hide()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (self.dataSource.count > 4) {
            self.gradientLayer.removeFromSuperlayer()
            self.containerV.layer.addSublayer(self.gradientLayer)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset: CGPoint = scrollView.contentOffset
        
        if (self.dataSource.count > 4) {
            if (offset.y >= CGFloat(self.dataSource.count) * CGFloat(cellHeight) - self.tableHeight) {
                self.gradientLayer.removeFromSuperlayer()
            } else {
                self.containerV.layer.addSublayer(self.gradientLayer)
            }
        }
    }
    
}


