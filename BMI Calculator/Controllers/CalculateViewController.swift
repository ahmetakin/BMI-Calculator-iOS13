//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain() //struct belirledik

    @IBOutlet weak var hightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSlider(_ sender: UISlider) {
        let height = String(format:"%.2f",sender.value)
        hightLabel.text = "\(height)m"
        //print(String(format:"%.2f",sender.value))
    }
    
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weightLabel.text = String(Int(sender.value)) + "kg"
        //print(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
    
        let height = heightSlider.value
        let weight = weightSlider.value
        
  
        calculatorBrain.calculateBMI(height:height,weight:weight)
        
        self.performSegue(withIdentifier:"goToResult",sender:self)
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController // bmi değeri için yazdın as sonrasını
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

