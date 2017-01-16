//
//  SecondInterfaceController.swift
//  BasicWatchKitApp
//
//  Created by Sridivya on 12/30/16.
//  Copyright © 2016 Techjini. All rights reserved.
//

import UIKit
import WatchKit

class SecondInterfaceController: WKInterfaceController {

    //Set of phrases for suggestions to speech recognisation
    let initialPhrases = ["When are you free?","Yes","No","Can we meet tomorrow?","Huh?"," Let's do Dinner.","Okay"]
    var isPresented:ObjCBool = false
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
    }
    override func didAppear() {
        super.didAppear()
        
        if(!isPresented.boolValue){ //presenting text input screen at first time only
        self.findingTextInput()
        }
    }
    private func findingTextInput(){
        
        self.presentTextInputController(withSuggestions: initialPhrases, allowedInputMode: WKTextInputMode.plain){ (results) -> Void in
            
            self.isPresented = true
            
            if ((results != nil) && (results?.count)! > 0) {
                let aResult = results?[0] as? String
                print(aResult)
                let actions = [WKAlertAction.init(title: "ok:", style: WKAlertActionStyle.default, handler: {
                    print("Ok button is Tapped")
                })]
                let alertTitle = "TextFound!"
                let alertMessage = "Text Found  is \(aResult)"
                self.presentAlert(withTitle: alertTitle, message: alertMessage, preferredStyle: .alert, actions: actions)
                
            } else {
                
                let actions = [WKAlertAction.init(title: "ok:", style: WKAlertActionStyle.default, handler: {
                    print("Ok button is Tapped")
                })]
                let alertTitle = "Text Not Found!"
                let alertMessage = "Text Not Found "
                self.presentAlert(withTitle: alertTitle, message: alertMessage, preferredStyle: .alert, actions: actions)
            }
        }
    }
}
