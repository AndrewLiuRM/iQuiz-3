//
//  SwitchViewController.swift
//  iQuiz
//
//  Created by Andrew Liu on 11/12/17.
//  Copyright © 2017 Andrew Liu. All rights reserved.
//

import UIKit

class SwitchViewController: UIViewController {
    public var data: QuestionList?
    public var isAnswer:Bool = false
    
    

    
    // {{## BEGIN fields ##}}
    fileprivate var questionViewController : QuestionViewController!
    fileprivate var answerViewController : AnswerViewController!
    // {{## END fields ##}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("loaded")
        // Do any additional setup after loading the view.
        questionBuilder()
        switchViewController(nil, to: questionViewController)
//        let transition = CATransition()
//        transition.duration = 0.3
//        transition.type = kCATransitionPush
//        transition.subtype = kCATransitionFromRight
//        view.window!.layer.add(transition, forKey: kCATransition)
//        present(questionViewController, animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // {{## BEGIN builders ##}}
    fileprivate func questionBuilder() {
        NSLog("Question Loaded")
        if questionViewController == nil {
            questionViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Question")
                as! QuestionViewController
        }
        questionViewController.question = data
        questionViewController.current = 0
//        questionViewController.questionViewController = self.questionViewController
        questionViewController.result = []
    }
    // {{## END builders ##}}
    
    // {{## BEGIN switchViewController ##}}
    func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        NSLog("called")
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }

        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }
    // {{## END switchViewController ##}}
    
    // {{## BEGIN switch-with-animation ##}}
//    fileprivate func switchViewsNext() {
//        UIView.beginAnimations("View Flip", context: nil)
//        UIView.setAnimationDuration(0.4)
//        UIView.setAnimationCurve(.easeInOut)
//
//        if questionViewController == nil ||
//            questionViewController?.view.superview == nil {
//            questionBuilder()
//            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
//            questionViewController.view.frame = view.frame
//            switchViewController(answerViewController, to: questionViewController)
//        }
//        UIView.commitAnimations()
//    }
    // {{## END switch-with-animation ##}}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
