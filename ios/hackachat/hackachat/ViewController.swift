//
//  ViewController.swift
//  hackachat
//
//  Created by ALPHAvibe on 1/3/16.
//  Copyright © 2016 AVD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var chatBox: UITextView!

    @IBOutlet weak var message: UITextField!
    
    let socket = SocketIOClient(socketURL: "192.168.1.104:3000/chat")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.addHandlers()
        self.socket.connect()
        
        
        
        chatBox.text = "Hello World"
        message?.text? = "Replace me"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitTapped(sender: AnyObject) {
        if message.text?.isEmpty == false {
            socket.emit("chat message", message.text!)
            message.text = "";
        }
    }
    func addHandlers() {
        socket.on("chat message") {data, ack in
            self.chatBox.text = self.chatBox.text + "\n" + (data[0] as! String);
        }
    }
}

