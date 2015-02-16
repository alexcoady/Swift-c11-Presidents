//
//  DetailViewController.swift
//  11 - Presidents
//
//  Created by Alex Coady on 16/02/2015.
//  Copyright (c) 2015 Alex Coady. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        
        if let detail: AnyObject = self.detailItem {
            
            if let label = self.detailDescriptionLabel {
                
                let dict = detail as [String: String]
                let urlString = dict["url"]!
                label.text = urlString
                
                let url = NSURL(string: urlString)!
                let request = NSURLRequest(URL: url)
                webView.loadRequest(request)
                
                let name = dict["name"]!
                title = name
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

