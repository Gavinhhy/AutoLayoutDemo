//
//  ViewController2.swift
//  AutoLayoutDemo
//
//  Created by Gavin on 16/4/3.
//  Copyright © 2016年 Gavin. All rights reserved.
//

import UIKit

class ViewController2: UIViewController , UITableViewDelegate ,UITableViewDataSource{
    
    var ctrlnames :[String] = ["病例详情","任务二","任务三"]
    var tableView : UITableView?
    
    override func loadView() {
        super.loadView()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "首页"
        //创建表视图
        self.tableView = UITableView(frame: self.view.frame , style: UITableViewStyle.Plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        //注册一个重复使用的cell
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(tableView!)
       //
        let rightButton = UIBarButtonItem(title: "详情", style: UIBarButtonItemStyle.Plain, target: self, action: "clickRightButton")
        self.navigationItem.rightBarButtonItem = rightButton
        
        
        
    }
    func clickRightButton(){
       let anotherDetail = UIViewController()
        anotherDetail.title = "详情页"
        anotherDetail.view.backgroundColor = UIColor.whiteColor()
        //在子页面中隐藏底部bar 
        anotherDetail.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(anotherDetail, animated: true)
    }
    
    //设定section的个数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //设定row的个数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ctrlnames.count
    }
    
    //创建cell中的显示内容(创建indexPath指定的单元)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //重复使用cell，定义一个和之前注册一样个cell identify
        let identify:String = "SwiftCell"
        //同一形式的单元格重复使用，在声明时已注册
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath)
        //设置每行的文本
        cell.textLabel?.text = self.ctrlnames[indexPath.row]
        return cell
    }
    
    //定义cell 的点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView!.deselectRowAtIndexPath(indexPath, animated: true)
        let itemString = self.ctrlnames[indexPath.row]
        let detailController = DetailViewController()
        detailController.view.backgroundColor = UIColor.whiteColor()
        
        detailController.itemString = itemString
        detailController.title = itemString
        detailController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailController, animated: true)
        
        //给下个页面传递一个参数
//        self.performSegueWithIdentifier("showDetail", sender: itemString)
    }
    
    //在这方法中给新的页面传递参数
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showDetail"{
//            let controller = segue.destinationViewController as! DetailViewController
//            controller.itemString = sender as? String
//            //self.navigationController?.pushViewController(controller, animated: true)
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
