//
//  CountryDetailsTableViewCell.swift
//  Assignment1 
//
//  Created by Reshma Pai on 28/05/23.
//

import UIKit

class CountryDetailsTableViewCell: UITableViewCell {
    
    var cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        stackView.alignment = .leading
        return stackView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Title"
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Desc"
        return label
    }()
    
    var detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .cyan
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //setupCellUI()
    }
    
    func setupCellUI() {
        
        contentView.addSubview(cellStackView)
        contentView.addSubview(detailImageView)
        addCellStackViewConstraint()
        addImageViewConstraint()
        addTitleLabelConstraints()
        
        setNeedsLayout()
    }
    
    func addCellStackViewConstraint() {
        NSLayoutConstraint.activate([
            cellStackView.leadingAnchor.constraint(equalTo: detailImageView.trailingAnchor, constant: 10),
            cellStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cellStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16)
        ])
    }
    
    func addTitleLabelConstraints() {
        cellStackView.addArrangedSubview(titleLabel)
        cellStackView.addArrangedSubview(descriptionLabel)
    }
    
    func addImageViewConstraint() {
        NSLayoutConstraint.activate([
            detailImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            detailImageView.widthAnchor.constraint(equalToConstant: 100),
            detailImageView.topAnchor.constraint(equalTo: topAnchor, constant: -15),
            detailImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 15)
        ])
    }
    
    func setupTitle(text: String?) {
        titleLabel.text = text
    }
    
    func setupDescription(text: String?) {
        descriptionLabel.text = text
    }
    
    func setupImageView(image: UIImage) {
        detailImageView.image = image
    }
    
}
