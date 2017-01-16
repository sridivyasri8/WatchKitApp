//
//  FirstInterfaceController.swift
//  BasicWatchKitApp
//
//  Created by Sridivya on 12/30/16.
//  Copyright © 2016 Techjini. All rights reserved.
//

import UIKit
import WatchKit

class FirstInterfaceController: WKInterfaceController {
    
    @IBOutlet var customTableView: WKInterfaceTable!
    
    //Table Data for displaying rows
    let rowData = [" Row1"," Row2"," Row3"," Row4"," Row5"," Row6"," Row7"," Row8"]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        loadCustomTableViewData()
        // Configure interface objects here.
    }
    private func loadCustomTableViewData(){
        
        //setting number of rows
        customTableView.setNumberOfRows(rowData.count, withRowType: "CustomTableRowController")
        
        for index in 0..<rowData.count {
            
            let controller = customTableView.rowController(at: index) as? CustomTableRowController
            controller?.rownameLabel.setText(rowData[index])
            controller?.cellImageName.setImageNamed("frame_\(index)")            
        }
    }
    //Did Select at table row Function
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
       if(rowIndex == 0){
            print(" Row name title: \(rowData[rowIndex])")
        }
    }
}
