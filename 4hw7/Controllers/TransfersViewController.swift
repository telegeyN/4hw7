//
//  ViewController.swift
//  4hw7
//
//  Created by Telegey Nurbekova on 02/03/24.
//

import UIKit

class MainViewController: UIViewController {
    
    private let transfersLabel = MakerView().makerLabel(text: "Transfers", font: Fonts.semiBold.size(35), textColor: .init(hex: "00214E"))
    private let newTransferLabel = MakerView().makerLabel(text: "New transfer", font: Fonts.semiBold.size(20), textColor: .init(hex: "00214E"))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    private func setUpUI(){
        
        view.backgroundColor = .systemBackground
        
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
        
    }


}

