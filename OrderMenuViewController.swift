//
//  OrderMenuViewController.swift
//  NoutoOrderSystem
//
//  Created by Yamashita T on 2017/05/18.
//  Copyright © 2
//

import UIKit
import PagingMenuController
import SideMenu

class OrderMenuViewController: UIViewController{
    
    //PagingMenuに追加するVCたち
    var orderItemTableVCs : [OrderItemTableViewController] = []
    
    override func viewDidLoad() {

        //VCにいれるDataたち(気にしなくてOK)
        var orderItemDatas : [[OrderItemData]] = [[]]
        orderItemDatas = ItemDataManager.selectedDatas
        
        //VCの作成
        for itemData in orderItemDatas{
            let orderItemTableVC = OrderItemTableViewController(orderItemDatas: itemData)
            orderItemTableVCs.append(orderItemTableVC)
        }
        
        //PagingMenuの宣言してるとこ
        var pagingMenuController : PagingMenuController
        pagingMenuController = PagingMenuController(options: OrderPagingMenuOptions(viewControllers: orderItemTableVCs,height: self.view.frame.height / 20))
        super.viewDidLoad()
        
        addChildViewController(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMove(toParentViewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func SortData(){
        print("test")
    }

}

