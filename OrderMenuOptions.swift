//
//  OrderMenuOptions.swift
//  NoutoOrderSystem
//
//  Created by Yamashita T on 2017/05/18.
//  Copyright © 2017年 Nouto co.,ltd. All rights reserved.
//

import Foundation
import PagingMenuController

struct MenuItemUsers: MenuItemViewCustomizable {}
struct MenuItemRepository: MenuItemViewCustomizable {}
struct MenuItemGists: MenuItemViewCustomizable {}
struct MenuItemOrganization: MenuItemViewCustomizable {}

struct OrderPagingMenuOptions: PagingMenuControllerCustomizable {

    var componentType : ComponentType
    var lazyLoadingPage: LazyLoadingPage {
        return .all
    }
    
    init(viewControllers: [OrderItemTableViewController], height: CGFloat){
        let menuOptions = MenuOptions(viewControllers: viewControllers, height: height)
        self.componentType = .all(menuOptions: menuOptions, pagingControllers: viewControllers)
    }
}

struct MenuOptions: MenuViewCustomizable {
    var itemsOptions: [MenuItemViewCustomizable] = []
    
    var displayMode: MenuDisplayMode {
        //return .segmentedControl
        return .standard(widthMode: .flexible, centerItem: false, scrollingMode: .scrollEnabledAndBouces)
        //return .infinite(widthMode: .flexible, scrollingMode: .pagingEnabled)
    }
    
    var focusMode: MenuFocusMode {
        return .roundRect(radius: 5, horizontalPadding: 5, verticalPadding: 5, selectedColor: UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1.0))
    }
    
    init(viewControllers: [OrderItemTableViewController], height: CGFloat){
        for vc in viewControllers{
            self.height = height
            self.itemsOptions.append(Menu_Title(titleName: vc.title!, height: height))
        }
    }
    
    var backgroundColor: UIColor{
        return UIColor.white
        
    }
    
    var height: CGFloat = 0
}

struct Menu_Title: MenuItemViewCustomizable {
    let title : MenuItemText
    init(titleName: String, height: CGFloat){
        self.title = MenuItemText(text: titleName, color: UIColor.black, selectedColor: UIColor.white, font: .systemFont(ofSize: height / 2), selectedFont: .systemFont(ofSize: height / 2))
    }
    var displayMode: MenuItemDisplayMode {
        return .text(title: title)
    }
}
