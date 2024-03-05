//
//  ViewController.swift
//  4hw7
//
//  Created by Telegey Nurbekova on 02/03/24.
//

import UIKit

class TransfersViewController: UIViewController {
    
    private let transfersLabel = MakerView().makerLabel(text: "Transfers", font: Fonts.semiBold.size(35), textColor: .init(hex: "00214E"))
    private let newTransferLabel = MakerView().makerLabel(text: "New transfer", font: Fonts.semiBold.size(20), textColor: .init(hex: "00214E"))
    private let visaToVisaBtn = MakerView().makerButton(image: UIImage(named: "visa"), title: "Visa To Visa", borderColor: .init(hex: "#faa61a"))
    private let elcartToElcartBtn = MakerView().makerButton(image: UIImage(named: "elcart"), title: "Elcart To Elcart", borderColor: .init(hex: "#2668b3"))
    private let swiftTransferBtn = MakerView().makerButton(image: UIImage(named: "swift"),imageWidth: 45, imageHeight: 45, title: "Swift", borderColor: .init(hex: "#fb4b29"))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    private func setUpUI(){
        
        view.backgroundColor = .init(hex: "#d4e1f0")
        
        view.addSubview(transfersLabel)
        NSLayoutConstraint.activate([
            transfersLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -20),
            transfersLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
        
        view.addSubview(newTransferLabel)
        NSLayoutConstraint.activate([
            newTransferLabel.topAnchor.constraint(equalTo: transfersLabel.bottomAnchor, constant: 40),
            newTransferLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        ])
        
        view.addSubview(visaToVisaBtn)
        NSLayoutConstraint.activate([
            visaToVisaBtn.topAnchor.constraint(equalTo: newTransferLabel.bottomAnchor, constant: 35),
            visaToVisaBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            visaToVisaBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            visaToVisaBtn.heightAnchor.constraint(equalToConstant: 80)
        ])
        visaToVisaBtn.addTarget(self, action: #selector(visaToVisaTapped), for: .touchUpInside)
        
        view.addSubview(elcartToElcartBtn)
        NSLayoutConstraint.activate([
            elcartToElcartBtn.topAnchor.constraint(equalTo: visaToVisaBtn.bottomAnchor, constant: 12),
            elcartToElcartBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            elcartToElcartBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            elcartToElcartBtn.heightAnchor.constraint(equalToConstant: 80)
        ])
        elcartToElcartBtn.addTarget(self, action: #selector(elcartToElcarTapped), for: .touchUpInside)
        
        view.addSubview(swiftTransferBtn)
        NSLayoutConstraint.activate([
            swiftTransferBtn.topAnchor.constraint(equalTo: elcartToElcartBtn.bottomAnchor, constant: 12),
            swiftTransferBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            swiftTransferBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            swiftTransferBtn.heightAnchor.constraint(equalToConstant: 80)
        ])
        swiftTransferBtn.addTarget(self, action: #selector(swiftTransferTapped), for: .touchUpInside)
    }
    
    @objc private func visaToVisaTapped() {
        let vc = VisaToVisaViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func elcartToElcarTapped() {
        let vc = ElcartToElcartViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func swiftTransferTapped() {
        let vc = SwiftViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

