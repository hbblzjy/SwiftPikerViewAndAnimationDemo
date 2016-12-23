//
//  ViewController.swift
//  SwiftPikerViewDemo
//
//  Created by healthmanage on 16/12/23.
//  Copyright © 2016年 healthmanager. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    var emojiArray = NSArray()
    var dataArr1 = NSMutableArray()
    var dataArr2 = NSMutableArray()
    var dataArr3 = NSMutableArray()
    var dataArr4 = NSMutableArray()
    
    var centerP:CGPoint? = nil
    var myPickerV = UIPickerView()
    var resultLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.cyan
        
        emojiArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        for _ in 0 ..< 100 {
            dataArr1.add(Int(arc4random() % 10))
            dataArr2.add(Int(arc4random() % 10))
            dataArr3.add(Int(arc4random() % 10))
            dataArr4.add(Int(arc4random() % 10))
        }
        
        resultLabel = UILabel.init(frame: CGRect.init(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: 50))
        resultLabel.textAlignment = .center
        resultLabel.font = UIFont.systemFont(ofSize: 23)
        self.view.addSubview(resultLabel)
        
        myPickerV = UIPickerView.init(frame: CGRect.init(x: 20, y: 120, width: self.view.frame.size.width-40, height: 100))
        myPickerV.delegate = self
        myPickerV.dataSource = self
        myPickerV.backgroundColor = UIColor.lightGray
        myPickerV.layer.cornerRadius = 5
        self.view.addSubview(myPickerV)
        
        
        let goBtn = UIButton.init(frame: CGRect.init(x: (self.view.frame.size.width-200)/2, y: 300, width: 200, height: 50))
        goBtn.setTitle("开始", for: .normal)
        goBtn.layer.cornerRadius = 5
        goBtn.backgroundColor = UIColor.blue
        goBtn.isSelected = false
        self.view.addSubview(goBtn)
        goBtn.addTarget(self, action: #selector(goBtnClick(btn:)), for: .touchUpInside)
        
        self.centerP = goBtn.center
        
    }
    //MARK:--------------按钮点击事件
    func goBtnClick(btn:UIButton) {
        
        if !btn.isSelected {
            
            btn.isSelected = true
            
            myPickerV.selectRow(Int(arc4random()%90)+3, inComponent: 0, animated: true)
            myPickerV.selectRow(Int(arc4random()%90)+3, inComponent: 1, animated: true)
            myPickerV.selectRow(Int(arc4random()%90)+3, inComponent: 2, animated: true)
            myPickerV.selectRow(Int(arc4random()%90)+3, inComponent: 3, animated: true)
            
    
            if String(describing: dataArr1[myPickerV.selectedRow(inComponent: 0)]) == String(describing: dataArr2[myPickerV.selectedRow(inComponent: 1)]) && String(describing: dataArr2[myPickerV.selectedRow(inComponent: 1)]) == String(describing: dataArr3[myPickerV.selectedRow(inComponent: 2)]) && String(describing: dataArr3[myPickerV.selectedRow(inComponent: 2)]) == String(describing: dataArr4[myPickerV.selectedRow(inComponent: 3)]
                
                ) {
                resultLabel.text = "厉害了我的哥！"
            }else{
                resultLabel.text = "再接再厉💔💔💔"
            }
            
            //添加按钮动画
            UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .curveLinear, animations: { 
                btn.bounds = CGRect.init(x: 0, y: 0, width: 200, height: 100)
            }, completion: { (complete:Bool) in
                UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions(), animations: {
                    btn.bounds = CGRect.init(x: 0, y: 0, width: 200, height: 50)
                }, completion: nil)
                btn.isSelected = false
                self.resultLabel.text = ""
            })
        }
    }
    //MARK:--------------UIPickerViewDelegate,UIPickerViewDataSource
    //每个区有多少行
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    //有多少区
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    //行高
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 70
    }
    //每个区每个行的内容
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if component == 0 {
//            return "1"
//        }else if component == 1 {
//            return "2"
//        }else if component == 2 {
//            return "3"
//        }else{
//            return "4"
//        }
//    }
    //返回每个区每个行的视图
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        if component == 0 {
            pickerLabel.text = emojiArray[dataArr1[row] as! Int] as? String
        }else if component == 1 {
            pickerLabel.text = emojiArray[dataArr2[row] as! Int] as? String
        }else if component == 2 {
            pickerLabel.text = emojiArray[dataArr3[row] as! Int] as? String
        }else{
            pickerLabel.text = emojiArray[dataArr4[row] as! Int] as? String
        }
        pickerLabel.font = UIFont.init(name: "Apple Color Emoji", size: 50)
        pickerLabel.textAlignment = .center
        
        return pickerLabel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

