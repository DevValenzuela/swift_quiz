//
//  Quiz.swift
//  Color Quizz
//
//  Created by SingleClick on 20/01/24.
//

import Foundation


struct GeneratorPreguntas {
    static let preguntas = [
        "Te gusta resolver problemas de logica y razonamiento",
        "Te gusta trabajar de noche?",
        "Te gusta encontrar soluciones eficientes?",
        "Te gustan los acertijos"
    ]
    
    static func getPregunta(numeroPregunta: Int) -> String {
        return preguntas[numeroPregunta]
    }
    
    static func getBackPregunta(numeroPregunta: Int) -> Bool{
        return numeroPregunta  == preguntas.count - 1
    }
}



