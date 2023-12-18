//
//  ViewController.swift
//  TravelMeit
//
//  Created by Enrique Alata Vences on 7/12/23.
//

import UIKit
import Login


class ViewController: UIViewController {
    
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    
    let projectNameLabel: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logoTravelmeit")?.withRenderingMode(.alwaysTemplate))
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let wellcomeTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Where do you want to go today?"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        if let thirdColor = UIColor(named: "ThirdColor") {
            label.textColor = thirdColor
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let accessButton = UIButton(type: .system)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackGroundImage()
        configureWellcomeButton()
        setupLayout()
        adjustImageSizes()
    }
    
    private func configureBackGroundImage() {
        backgroundImage.image = UIImage(named: "PantallaEntrada")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
    
    private func setupLayout() {
        view.addSubview(projectNameLabel)
        NSLayoutConstraint.activate([
            projectNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            projectNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
        ])
        
        view.addSubview(wellcomeTextLabel)
        NSLayoutConstraint.activate([
            wellcomeTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wellcomeTextLabel.topAnchor.constraint(equalTo: projectNameLabel.bottomAnchor),
            wellcomeTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            wellcomeTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        view.addSubview(accessButton)
        NSLayoutConstraint.activate([
            accessButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            accessButton.topAnchor.constraint(equalTo: wellcomeTextLabel.bottomAnchor, constant: 100),
        ])
    }
    
    private func configureWellcomeButton() {
        let buttonImage = UIImage(named: "buttonStart")
        accessButton.setImage(buttonImage, for: .normal)
        accessButton.translatesAutoresizingMaskIntoConstraints = false
        accessButton.setTitle(nil, for: .normal)
        accessButton.addTarget(self, action: #selector(tapNavigateLogin(_:)), for: .touchUpInside)
    }
    
    private func adjustImageSizes() {
        if let logoImage = UIImage(named: "logoTravelmeit") {
            let logoSize = logoImage.size
            NSLayoutConstraint.activate([
                projectNameLabel.widthAnchor.constraint(equalToConstant: logoSize.width / 1.15),
                projectNameLabel.heightAnchor.constraint(equalToConstant: logoSize.height / 1.15)
            ])
        }

        if let buttonImage = UIImage(named: "buttonStart") {
            let buttonSize = buttonImage.size
            NSLayoutConstraint.activate([
                accessButton.widthAnchor.constraint(equalToConstant: buttonSize.width / 3),
                accessButton.heightAnchor.constraint(equalToConstant: buttonSize.height / 3)
            ])
        }
    }
    
    @objc func tapNavigateLogin(_ sender: Any) {
        guard let loginViewController = LoginViewBuilder.getFirstView() else { return }
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }

}
