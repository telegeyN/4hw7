//
//  SuccessViewController.swift
//  4hw7
//
//  Created by Telegey Nurbekova on 05/03/24.
//

import UIKit

class SuccessViewController: UIViewController {
    
    private let checkImage = MakerView().makerImage(imageName: "checked")
    private let successLabel = MakerView().makerLabel(text: "Money sent successfully!", font: Fonts.semiBold.size(20), textColor: .init(hex: "00214E"), textAlignment: .center)
    private let moneyLeftLabel = MakerView().makerLabel(text: "Money left: ", font: Fonts.regular.size(18), textColor: .init(hex: "00214E"), backgroundColor: .white,cornerRadius: 15, textAlignment: .center)
    
    private let initialBalance: Float
    private let amount: Float
    
    init(initialBalance: Float, amount: Float) {
        self.initialBalance = initialBalance
        self.amount = amount
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .init(hex: "#d4e1f0")
        
        view.addSubview(successLabel)
        NSLayoutConstraint.activate([
            successLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            successLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            successLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        view.addSubview(checkImage)
        NSLayoutConstraint.activate([
            checkImage.topAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 20),
            checkImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkImage.widthAnchor.constraint(equalToConstant: 150),
            checkImage.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        view.addSubview(moneyLeftLabel)
        NSLayoutConstraint.activate([
            moneyLeftLabel.topAnchor.constraint(equalTo: checkImage.bottomAnchor, constant: 20),
            moneyLeftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            moneyLeftLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            moneyLeftLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let remainingBalance = initialBalance - amount
        moneyLeftLabel.text?.append("\(remainingBalance) KGS")
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
