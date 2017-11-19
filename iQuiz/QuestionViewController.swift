//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Andrew Liu on 11/12/17.
//  Copyright © 2017 Andrew Liu. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var backBtn: UIBarButtonItem!
//    @IBAction func swipeHandler(_ gestureRecognizer : UISwipeGestureRecognizer) {
//        if gestureRecognizer.state == .ended {
//            backBtnClicked(backBtn)
//        }
//    }
    @IBAction func backBtnClicked(_ sender: Any) {
        NSLog("back clicked")
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
    public var question:QuestionList?
    public var selected:String?
    fileprivate var answerViewController:AnswerViewController!
    //public var questionViewController:QuestionViewController!
    public var current:Int?
    public var result:[Bool]?
    @IBOutlet weak var table: UITableView!
    @IBAction func submitBtnClicked(_ sender: Any) {
        if (self.selected != nil) {
            result!.append(selected! == (question!.list[current!].correct))
            NSLog("current: \(current) \(selected) == \(question!.list[current!].correct)")
//            UIView.beginAnimations("View Flip", context: nil)
//            UIView.setAnimationDuration(0.4)
//            UIView.setAnimationCurve(.easeInOut)
            answerBuilder()

//            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
//            answerViewController.view.frame = view.frame
//            switchViewController(nil, to: answerViewController)
//            UIView.commitAnimations()
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromRight
            view.window!.layer.add(transition, forKey: kCATransition)
            present(answerViewController, animated: false, completion: nil)
        }
        //SwitchViewController.
    }
    @IBOutlet weak var Prompt: UILabel!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question!.list[current!].answer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseCell")!
        let text = question!.list[current!].answer[indexPath.row]
        cell.textLabel?.text = text
        return cell
    }
    
    fileprivate func answerBuilder() {
        NSLog("Answer Loaded")
        if answerViewController == nil {
            answerViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Answer")
                as! AnswerViewController
        }
        answerViewController.current = self.current!
        answerViewController.question = self.question!
        answerViewController.result = self.result!
//        answerViewController.answerViewController = self.answerViewController
        //answerViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
//        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
//        self.view.addGestureRecognizer(leftSwipe)
        Prompt.text = question!.list[current!].prompt
        table.dataSource = self
        table.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = tableView.cellForRow(at: indexPath)?.textLabel?.text
        NSLog(selected!)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
