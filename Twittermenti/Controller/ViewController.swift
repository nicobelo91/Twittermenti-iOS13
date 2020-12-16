//
//  ViewController.swift
//  Twittermenti
//
//  Created by Angela Yu on 17/07/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import SwifteriOS
import CoreML

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!
    let sentimentClassifier = TweetSentimentClassifier()
    
    let swifter = Swifter(consumerKey: APIKeys.mainKey, consumerSecret: APIKeys.secretKey)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let prediction = try! sentimentClassifier.prediction(text: "@Apple is the best company")
        
        print(prediction.label)
        
        swifter.searchTweet(using: "@Apple", lang: "en", count: 100, tweetMode: .extended) { (results, metadata) in
            //print(results)
        } failure: { (error) in
            //print("There was an error with the Twitter API Request, \(error)")
        }

    }

    @IBAction func predictPressed(_ sender: Any) {
    
    
    }
    
}

