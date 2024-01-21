//
//  QuizViewController.swift
//  Color Quizz
//
//  Created by SingleClick on 20/01/24.
//

import UIKit

class QuizViewController: UIViewController {
    var numeroPregunta: Int
    var preguntaLabel =  UILabel()
    var yesButton = UIButton(type: .system)
    var noButton = UIButton(type: .system)
    
    static var respuestas: [Bool] = Array(repeating: false, count: GeneratorPreguntas.preguntas.count )
    
    init(numeroPregunta: Int){
        self.numeroPregunta = numeroPregunta
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder){
        numeroPregunta = 0
        super.init(coder: aDecoder)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.title = "Pregunta " + String(numeroPregunta + 1)
        
        view.addSubview(preguntaLabel)
        preguntaLabel.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            preguntaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            preguntaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            preguntaLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.6)
        ])
        
        view.addSubview(yesButton)
        yesButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            yesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            yesButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40)
        ])
        
        view.addSubview(noButton)
        noButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            noButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            noButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40)
        ])
     
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hue: 0.8028, saturation: 0.72, brightness: 0.65, alpha: 1.0)
        
        preguntaLabel.textColor = UIColor.white
        preguntaLabel.font = preguntaLabel.font.withSize(20)
        preguntaLabel.numberOfLines = 0
        
        yesButton.setTitle("Si", for: .normal)
        yesButton.setTitleColor(.white, for: .normal)
        yesButton.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 18)
        yesButton.addTarget(self, action: #selector(QuizViewController.seleccionYes), for: .touchUpInside)
        
        noButton.setTitle("No", for: .normal)
        noButton.setTitleColor(.white, for: .normal)
        noButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        noButton.addTarget(self, action: #selector(QuizViewController.seleccionNo), for: .touchUpInside)
        
        
        preguntaLabel.text = GeneratorPreguntas.getPregunta(numeroPregunta: numeroPregunta)
        

        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func seleccionYes(){
        QuizViewController.respuestas[numeroPregunta] =  true;
        nextView();
    }
    
    @objc func seleccionNo(){
        QuizViewController.respuestas[numeroPregunta] =  false;
        nextView();
    }
    
    func nextView(){
        if GeneratorPreguntas.getBackPregunta(numeroPregunta: numeroPregunta){
            navigationController?.pushViewController(ResultViewController(), animated: true)
        }else{
            navigationController?.pushViewController(QuizViewController(numeroPregunta: numeroPregunta + 1), animated: true)
        }
    }
}
