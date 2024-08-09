//
//  ValleyOfShadowsView.swift

import Foundation
import UIKit
import SnapKit

class ValleyOfShadowsView: UIView {
    
    
    private (set) var backgrounds: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgStory13
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    private (set) var btnBack: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.btnBack, for: .normal)
        return btn
    }()
    
    private (set) var labelContainer: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgContLabel
        return imageView
    }()
    
    private (set) var btnLeft: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.imgBtnLeft, for: .normal)
        return btn
    }()
    
    private (set) var btnRight: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.imgBtnRight, for: .normal)
        return btn
    }()
    
    private (set) var numberLabel: UILabel = {
        let label = UILabel.createLabel(withText: "1/3", font: .customFont(font: .unifrakturCook, style: .bold, size: 14), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.07, kern: 1)
        return label
    }()
    
    private (set) var contentLabel: UILabel = {
        let label = UILabel.createLabel(withText: "In moder", font: .customFont(font: .ubuntuMono, style: .regular, size: Int(16.autoSize)), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.4, kern: 0.64)
        return label
    }()
    
    private (set) var btnGo: UIButton = {
        let btn = UIButton()
        btn.configureButton(withTitle: "Accept the challenge", font: .customFont(font: .mac, style: .regular, size: 20), titleColor: .cDarkRed, normalImage: .imgBtnSelect, highlightedImage: nil)
        btn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        return btn
    }()
    
    var labelContainerHeightConstraint: Constraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        [backgrounds, btnBack, btnGo,labelContainer, btnLeft, btnRight ] .forEach(addSubview(_:))
        labelContainer.addSubview(numberLabel)
        labelContainer.addSubview(contentLabel)

    }
    
    private func setupConstraints() {
        backgrounds.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        btnBack.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.size.equalTo(52)
        }
        
        btnGo.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(64)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-12)
        }
        
        labelContainer.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(btnGo.snp.top).offset(-16.autoSize)
            labelContainerHeightConstraint = make.height.equalTo(276).constraint
        }
        
        numberLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-12)
        }
        
        btnLeft.snp.makeConstraints { make in
            make.centerY.equalTo(numberLabel)
            make.right.equalTo(numberLabel.snp.left).offset(-8)
        }
        
        btnRight.snp.makeConstraints { make in
            make.centerY.equalTo(numberLabel)
            make.left.equalTo(numberLabel.snp.right).offset(8)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.right.equalToSuperview().inset(24)
        }
    }
}
