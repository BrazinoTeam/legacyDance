//
//  FollowTheLightView.swift

import Foundation
import UIKit
import SnapKit

class FollowTheLightView: UIView {
    
    private (set) var backgrounds: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgStory19
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
    
    private (set) var contentLabel: UILabel = {
        let label = UILabel.createLabel(withText: "   Zheng saw a faint light in the distance and decided to follow it. The light grew brighter, and soon he emerged from the cave, having conquered his fear.", font: .customFont(font: .ubuntuMono, style: .regular, size: 16), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.4, kern: 0.64)
        return label
    }()
    
    private (set) var btnGo: UIButton = {
        let btn = UIButton()
        btn.configureButton(withTitle: "Continue", font: .customFont(font: .mac, style: .regular, size: 20), titleColor: .cDarkRed, normalImage: .imgBtnSelect, highlightedImage: nil)
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
        
        [backgrounds, btnBack, btnGo, labelContainer ] .forEach(addSubview(_:))
        labelContainer.addSubview(contentLabel)

    }
    
    private func setupConstraints() {
        backgrounds.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        btnBack.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
            make.size.equalTo(52)
        }
        
        btnGo.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(64)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-12)
        }
        
        labelContainer.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(btnGo.snp.top).offset(-16)
            labelContainerHeightConstraint = make.height.equalTo(168).constraint
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.right.equalToSuperview().inset(24)
        }
    }
}
