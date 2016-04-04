//
//  CaseList.swift
//  AutoLayoutDemo
//
//  Created by Gavin on 16/4/3.
//  Copyright © 2016年 Gavin. All rights reserved.
//

import UIKit

class CaseList: UITableViewController {
    var dataArray:NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "行业动态"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        //创建一个重用的单元格
        self.tableView.registerNib(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "myCell")
        
        //创建nsurl对象
        let urlString :String = "http://yidao.happysoft.co:8000/article/"
        let url:NSURL! = NSURL(string: urlString)
        //创建请求对象
        let request:NSURLRequest = NSURLRequest(URL: url)
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if error != nil{
                print(error?.code)
                print(error?.description)
            }else{
                self.dataArray = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
                //把行为加到主线程中去
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView?.reloadData()
                    return
                })
            }
        }
        dataTask.resume()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //返回section个数
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //返回cell个数
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArray.count
    }
    
    //返回cell的高度
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! MyTableViewCell
        let item = self.dataArray[indexPath.row] as! NSDictionary
        cell.customTitle.text = item.objectForKey("title") as? String
        cell.customDesc.text = item.objectForKey("description") as? String
        var urlString = item.objectForKey("img_url") as? String
        urlString = urlString!.stringByRemovingPercentEncoding!
        let url = NSURL(string: urlString!)
        let data = NSData(contentsOfURL: url!)
        cell.customImage.image = UIImage(data: data!)
        


        return cell
    }


}
