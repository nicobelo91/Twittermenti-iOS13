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
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!
    let sentimentClassifier = TweetSentimentClassifier()
    let swifter = Swifter(consumerKey: APIKeys.mainKey, consumerSecret: APIKeys.secretKey)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func predictPressed(_ sender: Any) {
        
        if let searchText = textField.text {
            
            swifter.searchTweet(using: searchText, lang: "en", count: 100, tweetMode: .extended) { (results, metadata) in
                //print(results)
                
                var tweets = [TweetSentimentClassifierInput]()
                
                for i in 0..<100 {
                    if let tweet = results[i]["full_text"].string {
                        let tweetForClassification = TweetSentimentClassifierInput(text: tweet)
                        tweets.append(tweetForClassification)
                    }
                }
                
                do {
                    let predictions = try self.sentimentClassifier.predictions(inputs: tweets)
                    
                    var sentimentScore = 0
                    for prediction in predictions {
                        let sentiment = prediction.label
                        
                        if sentiment == "Pos" {
                            sentimentScore += 1
                        } else if sentiment == "Neg" {
                            sentimentScore -= 1
                        }
                    }
                        var emojiManager = EmojiManager()
                    self.sentimentLabel.text =                    emojiManager.chooseEmoji(sentimentScore)
                    
                } catch {
                    print(error)
                }
                
            } failure: { (error) in
                print("There was an error with the Twitter API Request, \(error)")
            }
        }
    
    }
    
}

