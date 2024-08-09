//
//  TrialOfAngerView.swift


import Foundation
import UIKit
import SnapKit

class TrialOfAngerView: UIView {
    
    
    private (set) var backgrounds: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgStory23
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
        let label = UILabel.createLabel(withText: "   The third trial was to overcome anger. Zheng found himself in an arena surrounded by belligerent spirits trying to provoke him and throw him off course. He needed to remain calm and not give in to provocations.", font: .customFont(font: .ubuntuMono, style: .regular, size: Int(16.autoSize)), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.4, kern: 0.64)
        return label
    }()
    
    private (set) var btnIgnore: UIButton = {
        let btn = UIButton()
        btn.configureButton(withTitle: "Ignore the provocations", font: .customFont(font: .mac, style: .regular, size: 20), titleColor: .cDarkRed, normalImage: .imgBtnSelect, highlightedImage: nil)
        btn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        return btn
    }()
    
    private (set) var btnSpeak: UIButton = {
        let btn = UIButton()
        btn.configureButton(withTitle: "Speak peacefully with the spirits", font: .customFont(font: .mac, style: .regular, size: 20), titleColor: .cDarkRed, normalImage: .imgBtnSelect, highlightedImage: nil)
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
        
        [backgrounds, btnBack, btnSpeak, btnIgnore, labelContainer ] .forEach(addSubview(_:))
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
        
        btnSpeak.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(64)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-12)
        }
        
        btnIgnore.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(64)
            make.bottom.equalTo(btnSpeak.snp.top).offset(-16)
        }
        
        labelContainer.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(btnIgnore.snp.top).offset(-16.autoSize)
            labelContainerHeightConstraint = make.height.equalTo(186.autoSize).constraint
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.right.equalToSuperview().inset(24)
        }
    }
}
