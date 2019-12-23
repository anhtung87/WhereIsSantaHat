//
//  ViewController.swift
//  WhereIsSantaHat?
//
//  Created by Hoang Tung on 12/22/19.
//  Copyright © 2019 Hoang Tung. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var soundPlayer: AVAudioPlayer?
    
    let introLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vậy là chỉ còn 1 phút nữa là đến Giáng Sinh. Ông già Noel, Santa Claus, đã chuẩn bị xong những món quà cho các bé thiếu nhi. Chỉ còn chờ đồng hồ chỉ đúng 12h00 là Santa Claus sẽ bắt đầu chuyến hành trình đi phát quà. Nhưng, chú yêu tinh nghịch ngợm, Fred, đã nổi hứng, giấu chiếc mũ của ông già noel lẫn vào trong những chú người tuyết. Bạn hãy giúp Santa Claus tìm mũ để kịp thời gian khởi hành nhé!"
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .justified
        label.textColor = .systemBlue
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Bắt đầu", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemPink
        return button
    }()
    
    let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "star1")
        return imageView
    }()
    
    let ball1ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ball1")
        return imageView
    }()
    
    let ball2ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ball2")
        return imageView
    }()
    
    let plant1ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "plants1")
        return imageView
    }()
    
    let wreath1ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "wreath1")
        return imageView
    }()
    
    let ball3ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ball2")
        return imageView
    }()
    
    let gift1ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "gift1")
        return imageView
    }()
    
    let gift2ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "gift2")
        return imageView
    }()
    
    let gift3ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "gift1")
        return imageView
    }()
    
    let stocking1ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "stocking1")
        return imageView
    }()
    
    let stocking2ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "stocking2")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        playSound()
        
        view.addSubview(introLabel)
        view.addSubview(startButton)

        view.addSubview(starImageView)
        view.addSubview(ball1ImageView)
        view.addSubview(ball2ImageView)
        view.addSubview(plant1ImageView)
        view.addSubview(wreath1ImageView)
        view.addSubview(ball3ImageView)
        
        view.addSubview(gift1ImageView)
        view.addSubview(gift2ImageView)
        view.addSubview(gift3ImageView)
        view.addSubview(stocking1ImageView)
        view.addSubview(stocking2ImageView)
        
        setupLayout()
        
        startButton.addTarget(self, action: #selector(goto), for: .touchUpInside)
    }

    func setupLayout() {
        introLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.maxY / 5).isActive = true
        introLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.maxX / 10).isActive = true
        introLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIScreen.main.bounds.maxX / 10).isActive = true
        introLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.maxY / 3).isActive = true
        
        startButton.topAnchor.constraint(equalTo: introLabel.bottomAnchor, constant: 64).isActive = true
        startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.maxX / 4).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxX / 2).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        starImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        starImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        starImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        starImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        ball1ImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        ball1ImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        ball1ImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        ball1ImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        ball2ImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        ball2ImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        ball2ImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        ball2ImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        plant1ImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        plant1ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.midX - 30).isActive = true
        plant1ImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        plant1ImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        wreath1ImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        wreath1ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.midX - 100).isActive = true
        wreath1ImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        wreath1ImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        ball3ImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        ball3ImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        ball3ImageView.widthAnchor.constraint(equalToConstant: 55).isActive = true
        ball3ImageView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        gift1ImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        gift1ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        gift1ImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        gift1ImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        gift2ImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        gift2ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        gift2ImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        gift2ImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        gift3ImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        gift3ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150).isActive = true
        gift3ImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        gift3ImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        stocking1ImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        stocking1ImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        stocking1ImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        stocking1ImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        stocking2ImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        stocking2ImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        stocking2ImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        stocking2ImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    @objc func goto() {
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
    }
    
    func playSound() {
        let path = Bundle.main.path(forResource: "We-Wish-You-A-Merry-Chirstmas-Aly-AJ.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.play()
            // đặt numberOfLoops = -1 để nó chạy lại khi chạy hết!
            soundPlayer?.numberOfLoops = -1
        } catch {
            print("Error!")
        }
    }
    
}

