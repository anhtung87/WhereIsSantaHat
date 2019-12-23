//
//  SecondViewController.swift
//  WhereIsSantaHat?
//
//  Created by Hoang Tung on 12/22/19.
//  Copyright © 2019 Hoang Tung. All rights reserved.
//

import UIKit

struct Size {
    var width: CGFloat
    var height: CGFloat
}

class SecondViewController: UIViewController {
    
    var timer: Timer!
    
    var victoryViewSize: Size = Size(width: 400, height: 400)
    var victoryWidthAnchor: NSLayoutConstraint!
    var victoryHeightAnchor: NSLayoutConstraint!
    
    var defeatViewSize: Size = Size(width: 400, height: 400)
    var defeatWidthAnchor: NSLayoutConstraint!
    var defeatHeightAnchor: NSLayoutConstraint!
    
    var isCorrect: Bool = false
    
    var questionImageWidthAnchor: NSLayoutConstraint!
    var questionImageHeightAnchor: NSLayoutConstraint!
    
    var count: Int = 59
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "59"
        label.font = .boldSystemFont(ofSize: 40)
        label.textColor = .systemRed
        return label
    }()
    
    let victoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tìm thấy rồi, bạn đã kịp tìm lại chiếc mũ cho Santa Claus trước 12h!"
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.numberOfLines = 0
        return label
    }()
    
    let defeatLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hết thời gian, bạn không tìm được mũ cho Santa Clause. Santa Claus đành đi tặng quà các em nhỏ với cái đầu hói!"
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.textColor = .systemRed
        label.numberOfLines = 0
        return label
    }()
    
    let questionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "santa")
        return imageView
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Kết thúc", for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 8
        return button
    }()
    
    let circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        view.addSubview(countLabel)
        view.addSubview(questionImageView)
        view.addSubview(victoryLabel)
        view.addSubview(defeatLabel)
        view.addSubview(cancelButton)
        view.addSubview(circleView)
        
        setupLayout()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
        circleView.isUserInteractionEnabled = true
        circleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeState)))
    }
    
    func setupLayout() {
        countLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        countLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        countLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        countLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        questionImageWidthAnchor = questionImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxX)
        questionImageWidthAnchor.isActive = true
        questionImageHeightAnchor = questionImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxX)
        questionImageHeightAnchor.isActive = true
        questionImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        questionImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        circleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 260).isActive = true
        circleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 270).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        victoryLabel.isHidden = true
        defeatLabel.isHidden = true
        cancelButton.isHidden = true
    }
    
    @objc func countDown() {
        if count == 0 {
            timer.invalidate()
            showDefeat()
            showCancelButton()
            disappearImage()
        }
        count -= 1
        countLabel.text = String(count)
        if self.isCorrect == true {
            timer.invalidate()
            showVictory()
            showCancelButton()
            disappearImage()
        }
    }
    
    func disappearImage() {
        questionImageView.isHidden = true
        countLabel.isHidden = true
    }
    
    func showVictory() {
        victoryWidthAnchor = victoryLabel.widthAnchor.constraint(equalToConstant: victoryViewSize.width)
        victoryWidthAnchor.isActive = true
        victoryHeightAnchor = victoryLabel.heightAnchor.constraint(equalToConstant: victoryViewSize.height)
        victoryHeightAnchor.isActive = true
        victoryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        victoryLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        victoryLabel.isHidden = false
    }
    
    func showDefeat() {
        defeatWidthAnchor = defeatLabel.widthAnchor.constraint(equalToConstant: defeatViewSize.width)
        defeatWidthAnchor.isActive = true
        defeatHeightAnchor = defeatLabel.heightAnchor.constraint(equalToConstant: defeatViewSize.height)
        defeatHeightAnchor.isActive = true
        defeatLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        defeatLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        defeatLabel.isHidden = false
    }
    
    @objc func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showCancelButton() {
        cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        cancelButton.isHidden = false
    }
    
    @objc func changeState() {
        self.isCorrect = true
    }

}
