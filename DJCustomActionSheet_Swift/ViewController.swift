//
//  ViewController.swift
//  DJCustomActionSheet_Swift
//
//  Created by minstone.DJ on 2020/3/16.
//  Copyright © 2020 minstone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let btn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btn.frame = CGRect.init(x: 100, y: 200, width: 120, height: 44)
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 5.0
        btn.layer.masksToBounds = true
        btn.setTitle("Click", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func btnAction(_ btn: UIButton) -> Void {
        print("Btn Action")
        
        let dataSource = NSMutableArray()
        
        let defaultSelectedIndex = arc4random() % 4
        
        for i in 0...10 {
            let model = DJActionSheetModel.init()
            model.type = .typeCheck
            model.itemText = "我是选项：\(i)" as NSString

            
            model.isSelected = false
            if i == defaultSelectedIndex {
                model.isSelected = true
            }
            
//            model.textFont = UIFont.systemFont(ofSize: 20)
//            model.textColor = .red
            model.textAlign = .center
            
            dataSource.add(model)
        }
        
        let customActionSheet = DJActionSheet.init(frame: kScreenBounds, dataSource: dataSource)
        customActionSheet.show()
        customActionSheet.delegate = self
        
    }


}

extension ViewController: DJActionSheetDelegate {
    func actionSheetSelect(_ selectedModel: DJActionSheetModel, selectedIndex: NSInteger) {
        print("selectedModel ==== \(selectedModel), selectedIndex === \(selectedIndex)")
    }
    
    
}

