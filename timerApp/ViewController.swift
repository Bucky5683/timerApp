//
//  ViewController.swift
//  timerApp
//
//  Created by 김서연 on 2023/08/01.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    weak var timer: Timer?
    
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI(){
        mainLabel.text = "초를 선택하세요"
        slider.setValue(0.5, animated: true)
        number = 0
        timer?.invalidate()
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        let seconds = Int(slider.value * 60)
        number = seconds
        mainLabel.text = "\(seconds) 초"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){
            [self] _ in
            //반복을 하고 싶은 코드
            if number > 0{
                number -= 1
                slider.value = Float(number) / Float(60)
                mainLabel.text = "\(number) 초"
            }else{
                number = 0
                mainLabel.text = "초를 선택하세요"
                //소리나게!
                AudioServicesPlayAlertSound(SystemSoundID(1322))
                //타이머 끝
                timer?.invalidate()
            }
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        configureUI()
    }
    
}

