//
//  ViewController.swift
//  Color Quizz
//
//  Created by SingleClick on 19/01/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ShowQuizz(_ sender: Any) {
        navigationController?.pushViewController(QuizViewController(numeroPregunta: 0), animated: true)
    }
    
}

