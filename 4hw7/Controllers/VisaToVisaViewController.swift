//
//  VisaToVisaViewController.swift
//  4hw7
//
//  Created by Telegey Nurbekova on 04/03/24.
//

import UIKit

class VisaToVisaViewController: UIViewController, TransferValidationProtocol {
    
    private let transfersLabel = MakerView().makerLabel(text: "Transfers from Visa To Visa", font: Fonts.semiBold.size(20), textColor: .init(hex: "00214E"))
    private let userCardView = MakerView().makerView()
    private let fromCardLabel = MakerView().makerLabel(text: "From card",font: Fonts.extraLight.size(12), textColor: .init(hex: "#00214E"))
    private let cardImage = MakerView().makerImage(imageName: "card")
    private let cardNameLabel = MakerView().makerLabel(text: "Visa card", font: Fonts.regular.size(13), textColor: .init(hex: "#00214E"))
    private let cardNumberLabel = MakerView().makerLabel(text: "xxxx 3236", font: Fonts.extraLight.size(11), textColor: .darkGray)
    private let sum: Float = 48736.49
    private let ammountLabel = MakerView().makerLabel(text: "48736.49 KGS", font: Fonts.extraLight.size(13), textColor: .darkGray)
    private let toCardLabel = MakerView().makerLabel(text: "To card",font: Fonts.extraLight.size(12), textColor: .init(hex: "#00214E"))
    private let cardNumberTF = MakerView().makerTextField(placeholder: "xxxx xxxx xxxx xxxx", placeholderFont: Fonts.extraLight.size(17))
    private let summaLabel = MakerView().makerLabel(text: "Ammount",font: Fonts.extraLight.size(12), textColor: .init(hex: "#00214E"))
    private let ammountTF = MakerView().makerTextField(placeholder: "0", currency: "KGS   ", placeholderFont: Fonts.extraLight.size(17))
    private let sendBtn = MakerView().makerSimpleButton(backgroundColor: .init(hex: "#00214E"), title: "Send Money", titleColor: .white, cornerRadius: 24)
    
    private var initialBalance: Float = 0.0
    private var amount: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI(){
        
        view.backgroundColor = .init(hex: "#d4e1f0")
        
        view.addSubview(transfersLabel)
        NSLayoutConstraint.activate([
            transfersLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            transfersLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(fromCardLabel)
        NSLayoutConstraint.activate([
            fromCardLabel.topAnchor.constraint(equalTo: transfersLabel.bottomAnchor, constant: 20),
            fromCardLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23)
        ])
        
        view.addSubview(userCardView)
        NSLayoutConstraint.activate([
            userCardView.topAnchor.constraint(equalTo: fromCardLabel.bottomAnchor, constant: 3),
            userCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userCardView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        userCardView.addSubview(cardImage)
        NSLayoutConstraint.activate([
            cardImage.centerYAnchor.constraint(equalTo: userCardView.centerYAnchor),
            cardImage.leadingAnchor.constraint(equalTo: userCardView.leadingAnchor, constant: 8),
            cardImage.heightAnchor.constraint(equalToConstant: 30),
            cardImage.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        userCardView.addSubview(cardNameLabel)
        NSLayoutConstraint.activate([
            cardNameLabel.centerYAnchor.constraint(equalTo: cardImage.centerYAnchor, constant: -4),
            cardNameLabel.leadingAnchor.constraint(equalTo: cardImage.trailingAnchor, constant: 12)
        ])
        
        userCardView.addSubview(cardNumberLabel)
        NSLayoutConstraint.activate([
            cardNumberLabel.topAnchor.constraint(equalTo: cardNameLabel.bottomAnchor, constant: 3),
            cardNumberLabel.leadingAnchor.constraint(equalTo: cardImage.trailingAnchor, constant: 12)
        ])
        
        userCardView.addSubview(ammountLabel)
        NSLayoutConstraint.activate([
            ammountLabel.bottomAnchor.constraint(equalTo: userCardView.bottomAnchor, constant: -8),
            ammountLabel.trailingAnchor.constraint(equalTo: userCardView.trailingAnchor, constant: -8)
        ])
        
        view.addSubview(toCardLabel)
        NSLayoutConstraint.activate([
            toCardLabel.topAnchor.constraint(equalTo: userCardView.bottomAnchor, constant: 20),
            toCardLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23)
        ])
        
        view.addSubview(cardNumberTF)
        NSLayoutConstraint.activate([
            cardNumberTF.topAnchor.constraint(equalTo: toCardLabel.bottomAnchor, constant: 3),
            cardNumberTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardNumberTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardNumberTF.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        view.addSubview(summaLabel)
        NSLayoutConstraint.activate([
            summaLabel.topAnchor.constraint(equalTo: cardNumberTF.bottomAnchor, constant: 20),
            summaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23)
        ])
        
        view.addSubview(ammountTF)
        NSLayoutConstraint.activate([
            ammountTF.topAnchor.constraint(equalTo: summaLabel.bottomAnchor, constant: 3),
            ammountTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ammountTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ammountTF.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        view.addSubview(sendBtn)
        NSLayoutConstraint.activate([
            sendBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            sendBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65),
            sendBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65),
            sendBtn.heightAnchor.constraint(equalToConstant: 65)
        ])
        sendBtn.addTarget(self, action: #selector(sendBtnTapped), for: .touchUpInside)
        
    }
    
    @objc private func sendBtnTapped() {
        guard let cardNumber = cardNumberTF.text, let amountText = ammountTF.text, let amount = Float(amountText) else {
            return
        }
        
        if isValidCardNumber(cardNumber: cardNumber) && isValidTransferAmount(amount: amount, balance: sum) {
            initialBalance = sum
            self.amount = amount
            let vc = SuccessViewController(initialBalance: initialBalance, amount: amount)
            navigationController?.pushViewController(vc, animated: true)
        } else {
            if !isValidCardNumber(cardNumber: cardNumber) {
                showError(message: "Invalid Card Number", in: cardNumberTF)
            }
            if !isValidTransferAmount(amount: amount, balance: sum) {
                showError(message: "Invalid Transfer Amount", in: ammountTF)
            }
        }
    }
    
    private func showError(message: String, in textField: UITextField) {
        textField.text = nil
        textField.placeholder = message
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.red.cgColor
    }
    
}
