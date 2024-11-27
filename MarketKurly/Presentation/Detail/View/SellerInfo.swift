//
//  SellerInfo.swift
//  MarketKurly
//
//  Created by 이세민 on 11/22/24.
//

import UIKit

import SnapKit

class SellerInfo: UIView {
    
    private let deliveryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "배송"
        label.font = MarketKurlyFont.bodySemiBold14.font // bodyRegular14 확인 필요
        label.textColor = .gray6
        return label
    }()
    
    private let deliveryInfoLabel: UILabel = {
        let label = UILabel()
        
        let fullText = "샛별배송\n23시 전 주문 시 수도권/충청 내일 아침 7시 전 도착\n(그 외 지역 아침 8시 전 도착)"
        let attributedText = NSMutableAttributedString(string: fullText)
        
        attributedText.addAttribute(.font, value: MarketKurlyFont.bodySemiBold14.font, range: NSRange(location: 0, length: 4)) // bodyRegular14 확인 필요
        attributedText.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 0, length: 4))
        
        attributedText.addAttribute(.font, value: MarketKurlyFont.captionRegular12.font, range: NSRange(location: 5, length: fullText.count - 5))
        attributedText.addAttribute(.foregroundColor, value: UIColor.gray7, range: NSRange(location: 5, length: fullText.count - 5))
        
        label.attributedText = attributedText
        label.numberOfLines = 0
        
        return label
    }()
    
    private let sellerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "판매자"
        label.font = MarketKurlyFont.bodySemiBold14.font // bodyRegular14 확인 필요
        label.textColor = .gray6
        return label
    }()
    
    private let sellerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "컬리"
        label.font = MarketKurlyFont.bodySemiBold14.font // bodyMedium14 확인 필요
        label.textColor = .gray7
        return label
    }()
    
    private let deliveryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 58
        stackView.alignment = .leading
        return stackView
    }()
    
    private let sellerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 46
        stackView.alignment = .leading
        return stackView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        
        stackView.layer.borderColor = UIColor.gray2.cgColor
        stackView.layer.borderWidth = 1.0
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle(){
        self.backgroundColor = .white
    }
    
    private func setUI() {
        deliveryStackView.addArrangedSubview(deliveryTitleLabel)
        deliveryStackView.addArrangedSubview(deliveryInfoLabel)
        
        sellerStackView.addArrangedSubview(sellerTitleLabel)
        sellerStackView.addArrangedSubview(sellerNameLabel)
        
        mainStackView.addArrangedSubview(deliveryStackView)
        mainStackView.addArrangedSubview(sellerStackView)
        
        addSubview(mainStackView)
    }
    
    private func setLayout() {
        deliveryStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(17)
            $0.height.equalTo(50)
        }
        
        sellerStackView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(17)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(119)
        }
    }
}

