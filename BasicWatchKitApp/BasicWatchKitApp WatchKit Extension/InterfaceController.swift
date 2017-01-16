//
//  InterfaceController.swift
//  BasicWatchKitApp WatchKit Extension
//
//  Created by Sridivya on 12/29/16.
//  Copyright © 2016 Techjini. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet var animatedImage: WKInterfaceImage!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        animatedImage.setImageNamed("frame_") //Animating Images by ImageName
        animatedImage.startAnimating()
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
