//
//  ResultViewController.swift
//  Color Quizz
//
//  Created by SingleClick on 20/01/24.
//

import UIKit

class ResultViewController: UIViewController {
    
    var resultLabel = UILabel()
    var resetButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hue: 0.8028, saturation: 0.72, brightness: 0.65, alpha: 1.0)
        
        resultLabel.text = getResult()
        resultLabel.textColor = .white
        resultLabel.font = resultLabel.font.withSize(20)
        resultLabel.numberOfLines = 0
        
        resetButton.setTitle("Reiniciar", for: .normal)
        resetButton.setTitleColor(.white, for: .normal)
        resetButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        resetButton.addTarget(self, action: #selector(ResultViewController.reset) , for: .touchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
     
        view.addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            resetButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ])
        
    }
    
    @objc func reset() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    func getResult() -> String{
        var puntaje = 0
        var result =  ""
        for respuesta in QuizViewController.respuestas{
            if respuesta == true {
                puntaje += 1
            }
        }
        
        if puntaje >= 3  {
            result = "La carrera de Ingenieria sera una buena opción para ti"
        }else{
            result = "La licenciatura sea una buena opción para ti"
        }
        
        return result
    }
    
}
