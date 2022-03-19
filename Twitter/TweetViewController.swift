//
//  TweetViewController.swift
//  Twitter
//
//  Created by Victoria Simakova on 3/18/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var tweetTextView: UITextView!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if (!tweetTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
        
        
        
//        if (tweetTextView.text.isEmpty) {
//            self.dismiss(animated: true, completion: nil)
//            print("something is wrong")
//        } else {
//            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
//                            self.dismiss(animated: true, completion: nil)
//                        }, failure: { (error) in
//                            print("Error posting tweet \(error)")
//                            self.dismiss(animated: true, completion: nil)
//                        })
////            self.dismiss(animated: true, completion: nil)
//        }
    }

}
