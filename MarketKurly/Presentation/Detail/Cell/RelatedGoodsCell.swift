//
//  RelatedGoodsCell.swift
//  MarketKurly
//
//  Created by 이세민 on 11/26/24.
//

import UIKit

import SnapKit
import Then

class RelatedGoodsCell: UITableViewCell {
    static let identifier: String = "RelatedGoodsCell"
    
    private let goodsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 3.06
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let goodsNameLabel: UILabel = {
        let label = UILabel()
        label.font = MarketKurlyFont.bodySemiBold14.font // bodyMedium14 확인 필요
        label.textColor = .gray7
        return label
    }()
    
    private let discountRateLabel: UILabel = {
        let label = UILabel()
        label.font = MarketKurlyFont.bodySemiBold14.font // bodyExtraBold14 확인 필요
        label.textColor = .red
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = MarketKurlyFont.bodySemiBold14.font // bodyExtraBold14 확인 필요
        label.textColor = .gray7
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "icn_cart_small")
        button.setImage(icon, for: .normal)
        button.setTitle(" 담기", for: .normal)
        button.setTitleColor(.gray7, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.coolGray2.cgColor
        button.backgroundColor = .white
        button.semanticContentAttribute = .forceLeftToRight
        button.titleLabel?.font = MarketKurlyFont.captionMedium12.font
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(goodsImageView, goodsNameLabel, discountRateLabel, priceLabel, addButton)
    }
    
    private func setLayout() {
        goodsImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(48)
        }
        
        goodsNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalTo(goodsImageView.snp.trailing).offset(12)
        }
        
        discountRateLabel.snp.makeConstraints{
            $0.top.equalTo(goodsNameLabel.snp.bottom).offset(2)
            $0.leading.equalTo(goodsImageView.snp.trailing).offset(12)
        }
        
        priceLabel.snp.makeConstraints{
            $0.top.equalTo(goodsNameLabel.snp.bottom).offset(2)
            $0.leading.equalTo(discountRateLabel.snp.trailing).offset(7)
        }
        
        addButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.equalTo(67)
            $0.height.equalTo(34)
        }
    }
    
    func configure(goods: Goods) {
        goodsImageView.image = goods.goodsImage
        goodsNameLabel.text = goods.goodsName
        discountRateLabel.text = goods.discountRate
        priceLabel.text = goods.price
    }
}

