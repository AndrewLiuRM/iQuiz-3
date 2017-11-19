//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Andrew Liu on 11/12/17.
//  Copyright © 2017 Andrew Liu. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    @IBAction func backBtnClicked(_ sender: Any) {
        var viewController =
            storyboard?
                .instantiateViewController(withIdentifier: "Main")
                as! ViewController
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        view.window!.layer.add(transition, forKey: kCATransition)
        present(viewController, animated: false, completion: nil)
    }
    public var current:Int?
    public var question:QuestionList?
    public var result:[Bool]?
    //public var answerViewController: AnswerViewController!
    public var questionViewController: QuestionViewController!
    @IBOutlet weak var prompt: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var correct: UILabel!
    @IBAction func nextBtnClicked(_ sender: Any) {
//        UIView.beginAnimations("View Flip", context: nil)
//        UIView.setAnimationDuration(0.4)
//        UIView.setAnimationCurve(.easeInOut)
        if (result!.count >= question!.list.count) {
            var resultViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Result")
                as! ResultViewController
            resultViewController.result = self.result!
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromRight
            view.window!.layer.add(transition, forKey: kCATransition)
            present(resultViewController, animated: false, completion: nil)
            
        } else {
            questionBuilder()
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromRight
            view.window!.layer.add(transition, forKey: kCATransition)
            present(questionViewController, animated: false, completion: nil)
        }
        
        
//
//        UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
//        questionViewController.view.frame = view.frame
//        switchViewController(nil, to: questionViewController)
//        UIView.commitAnimations()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("answer loaded")
        prompt.text = question!.list[current!].prompt
        correct.text = question!.list[current!].correct
        if (result![current!]) {
            status.text = "You are correct!"
        } else {
            status.text = "WRONG! WRONG!"
        }
//        if questionViewController != nil {
//            questionViewController!.willMove(toParentViewController: nil)
//            questionViewController!.view.removeFromSuperview()
//            questionViewController!.removeFromParentViewController()
//        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func switchViewController(_ from: UIViewController?, to: UIViewController?) {
//        NSLog("called")
//        if from != nil {
//            from!.willMove(toParentViewController: nil)
//            from!.view.removeFromSuperview()
//            from!.removeFromParentViewController()
//        }
//
//        if to != nil {
//            self.addChildViewController(to!)
//            self.view.insertSubview(to!.view, at: 0)
//            to!.didMove(toParentViewController: self)
//        }
//    }
//
    fileprivate func questionBuilder() {
        NSLog("Question Loaded")
        if questionViewController == nil {
            questionViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Question")
                as! QuestionViewController
        }
        questionViewController.current = self.current! + 1
        questionViewController.question = self.question!
        questionViewController.result = self.result!
//        questionViewController.questionViewController = self.questionViewController
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
