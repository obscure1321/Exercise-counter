//
//  ViewController.swift
//  Счетчик упражнений
//
//  Created by Miras Maratov on 18.04.2023.
//

import UIKit

class ViewController: UIViewController {
// MARK: - IBOutlet
    @IBOutlet weak var exerciseName: UILabel!
    @IBOutlet weak var exerciseCount: UILabel!
    @IBOutlet weak var pushUpCount: UILabel!
    @IBOutlet weak var sitUpCount: UILabel!
    @IBOutlet weak var absCount: UILabel!
    @IBOutlet weak var overallCount: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
 
// MARK: - life cycle func
    override func viewDidLoad() {
        super.viewDidLoad()
        confugureView()
    }
    
    class Count {
        static let shared = Count()
        var count = 0
        var pushUp = 0
        var sitUp = 0
        var abs = 0
        var summ = 0
    }
    
// MARK: - IBAction
    @IBAction func buttonDone(_ sender: Any) {
        if self.exerciseName.text == "Отжимания"{
            Count.shared.pushUp += Count.shared.count
            Count.shared.summ += Count.shared.pushUp
            self.pushUpCount.text = "Отжимания \(Count.shared.pushUp) раз"
            self.overallCount.text = "Итого за подход \(Count.shared.summ) раз"
            Count.shared.count = 0
            self.exerciseCount.text = "\(Count.shared.count)"
            
        }
        if self.exerciseName.text == "Приседания"{
            Count.shared.sitUp += Count.shared.count
            Count.shared.summ += Count.shared.sitUp
            self.sitUpCount.text = "Приседания \(Count.shared.sitUp) раз"
            self.overallCount.text = "Итого за подход \(Count.shared.summ) раз"
            Count.shared.count = 0
            self.exerciseCount.text = "\(Count.shared.count)"
        }
        if self.exerciseName.text == "Пресс"{
            Count.shared.abs += Count.shared.count
            Count.shared.summ += Count.shared.abs
            self.absCount.text = "Пресс \(Count.shared.abs) раз"
            self.overallCount.text = "Итого за подход \(Count.shared.summ) раз"
            Count.shared.count = 0
            self.exerciseCount.text = "\(Count.shared.count)"
        }
    }
    
    @IBAction func buttonStartDay(_ sender: Any) {
        Count.shared.count = 0
        Count.shared.pushUp = 0
        Count.shared.sitUp = 0
        Count.shared.abs = 0
        Count.shared.summ = 0
        self.exerciseName.text = "Начнем?"
        self.sitUpCount.text = "Приседания \(Count.shared.sitUp) раз"
        self.absCount.text = "Пресс \(Count.shared.abs) раз"
        self.pushUpCount.text = "Отжимания \(Count.shared.pushUp) раз"
        self.overallCount.text = "Итого за подход \(Count.shared.summ) раз"
    }
    
    @IBAction func buttonEndDay(_ sender: Any) {
        self.exerciseName.text = "До следующего визита!"
    }
    
    @IBAction func absTask(_ sender: Any) {
        self.exerciseName.text = "Пресс"
    }
    
    @IBAction func sitUpTask(_ sender: Any) {
        self.exerciseName.text = "Приседания"
    }
    
    @IBAction func pushUpTask(_ sender: Any) {
        self.exerciseName.text = "Отжимания"
    }
    
    @IBAction func countPlus(_ sender: Any) {
        Count.shared.count += 1
        self.exerciseCount.text = "\(Count.shared.count)"
        
    }
    
    @IBAction func countMinus(_ sender: Any) {
        Count.shared.count -= 1
        self.exerciseCount.text = "\(Count.shared.count)"
    }



}
//MARK: - flow func
extension ViewController{
    
    private func confugureView(){
        exerciseName.text = "Привет!"
        sitUpCount.text = "Приседания \(Count.shared.sitUp) раз"
        absCount.text = "Пресс \(Count.shared.abs) раз"
        pushUpCount.text = "Отжимания \(Count.shared.pushUp) раз"
        overallCount.text = "Итого за подход \(Count.shared.summ) раз"
        backButton.setTitle("<< Назад", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.addTarget(self, action: #selector(closeGame), for: .touchUpInside)
    }
    
    @objc private func closeGame(){
        self.dismiss(animated: true)
    }
}
