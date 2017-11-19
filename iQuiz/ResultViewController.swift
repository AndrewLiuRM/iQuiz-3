//
//  ResultViewController.swift
//  iQuiz
//
//  Created by Andrew Liu on 11/13/17.
//  Copyright © 2017 Andrew Liu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    public var result:[Bool]!
    @IBOutlet weak var Status: UILabel!
    @IBOutlet weak var Result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var total = result.count;
        var count = 0
        for value in result {
            if (value) {
                count = count + 1
            }
        }
        var percent = Double(count) / Double(total)
        if (total == count) {
            Status.text = "PERFECT!"
        } else if (percent > 0.8) {
            Status.text = "Almost!"
        } else if (percent > 0.6) {
            Status.text = "I'll give you a pass..."
            
        } else {
            Status.text = "Hmmmm... I have nothing to say..."
        }
        Result.text = "\(count)/\(total)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
