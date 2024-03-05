//
//  MakerView.swift
//  4hw7
//
//  Created by Telegey Nurbekova on 02/03/24.
//

import UIKit

class MakerView {
    
    func makerLabel(text: String = "",
                    font: UIFont = Fonts.regular.size(16),
                    textColor: UIColor = .black,
                    backgroundColor: UIColor = .clear,
                    cornerRadius: CGFloat = 0,
                    textAlignment: NSTextAlignment = .left,
                    numberOfLines: Int = 0,
                    lineBreakMode:NSLineBreakMode = .byWordWrapping,
                    translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.backgroundColor = backgroundColor
        label.layer.cornerRadius = cornerRadius
        label.clipsToBounds = true
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return label
    }
    
    func makerButton(backgroundColor: UIColor = .white,
                     image: UIImage? = nil,
                     imageWidth: CGFloat = 60,
                     imageHeight: CGFloat = 20,
                     imageArrow: UIImage? = UIImage(systemName: "chevron.right") ?? UIImage(),
                     title: String = "",
                     titleColor: UIColor = .init(hex: "00214E"),
                     titleFont: UIFont = Fonts.semiBold.size(17),
                     cornerRadius: CGFloat = 15,
                     borderWidth: CGFloat = 1,
                     borderColor: UIColor = .clear,
                     translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UIButton {
        let button = UIButton()
        button.backgroundColor = backgroundColor
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = titleFont
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        
        
        if let image = image {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            
            button.addSubview(imageView)
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.leadingAnchor.constraint(equalTo: button.leadingAnchor,constant: 12),
                imageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                imageView.widthAnchor.constraint(equalToConstant: imageWidth),
                imageView.heightAnchor.constraint(equalToConstant: imageHeight)
            ])
        }
        
        if let imageArrow = imageArrow {
            let coloredImage = imageArrow.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
            
            let imageView = UIImageView(image: coloredImage)
            imageView.contentMode = .scaleAspectFit
            
            button.addSubview(imageView)
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -10),
                imageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 30),
                imageView.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
        return button
    }
    
    func makerView(backgroundColor: UIColor = .white,
                   cornerRadius: CGFloat = 15,
                   translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = cornerRadius
        view.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return view
    }
    
    func makerImage(imageName: String = "",
                    translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: imageName)
        image.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return image
    }
    
    func makerTextField(text: String = "",
                        placeholder: String = "",
                        cornerRadius: CGFloat = 15,
                        textColor: UIColor = .init(hex: "00214E"),
                        backgroundColor: UIColor = .init(hex: "#FFFFFF"),
                        borderColor: UIColor = .lightGray,
                        borderWidth: CGFloat = 0,
                        keyboardType: UIKeyboardType = .numberPad,
                        placeholderColor: UIColor = .darkGray,
                        currency: String = "",
                        placeholderFont: UIFont = Fonts.extraLight.size(20),
                        translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UITextField {
        let tf = UITextField()
        tf.text = text
        tf.placeholder = placeholder
        tf.layer.cornerRadius = cornerRadius
        tf.backgroundColor = backgroundColor
        tf.layer.borderColor = borderColor.cgColor
        tf.layer.borderWidth = borderWidth
        tf.textColor = textColor
        tf.keyboardType = keyboardType
        tf.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: placeholderColor,
            .font: placeholderFont
        ]
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 15))
        tf.leftView = view
        tf.leftViewMode = .always
        
        let currencyLabel = UILabel()
        currencyLabel.text = currency
        currencyLabel.font = Fonts.regular.size(13)
        currencyLabel.textColor = textColor
        currencyLabel.sizeToFit()
        tf.rightView = currencyLabel
        tf.rightViewMode = .always
        return tf
    }
    
    func makerSimpleButton(backgroundColor: UIColor = .white,
                           title: String = "",
                           titleColor: UIColor = .init(hex: "00214E"),
                           titleFont: UIFont = Fonts.semiBold.size(17),
                           cornerRadius: CGFloat = 15,
                           borderWidth: CGFloat = 0,
                           borderColor: UIColor = .clear,
                           translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UIButton {
        let button = UIButton()
        button.backgroundColor = backgroundColor
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = titleFont
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return button
    }
    
}
