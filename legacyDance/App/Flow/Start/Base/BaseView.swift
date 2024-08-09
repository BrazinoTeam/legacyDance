//
//  BaseView.swift


import Foundation
import UIKit
import SnapKit

class BaseView: UIView {
    
    private (set) var backgrounds: UIImageView = {
        let imv = UIImageView()
        imv.image = .bgHome
        imv.contentMode = .scaleToFill
        return imv
    }()
    
    private (set) var btnProfile: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.btnProfile, for: .normal)
        return btn
    }()
    
    private (set) var userImage: UIImageView = {
        let imv = UIImageView()
        imv.contentMode = .scaleToFill
        imv.image  = .imgUserDef
        imv.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        imv.layer.shadowOpacity = 1
        imv.layer.shadowRadius = 8
        imv.layer.shadowOffset = CGSize(width: 0, height: 4)
        return imv
    }()
    
    private (set) var userName: UILabel = {
        let label = UILabel()
        label.text = "\(Memory.shared.userName ?? "Welcome, User name!")"
        label.font = .customFont(font: .mac, style: .regular, size: 32)
        label.textColor = .cYellow
        label.textAlignment = .center
        return label
    }()
    
    private (set) var btnStart: UIButton = {
        let btn = UIButton()
        btn.configureButton(withTitle: "Go to Story", font: .customFont(font: .mac, style: .regular, size: 20), titleColor: .cDarkRed, normalImage: .imgBtnSelect, highlightedImage: nil)
        btn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        [backgrounds, btnProfile, btnStart, userImage, userName] .forEach(addSubview(_:))
        
    }
    
    private func setupConstraints() {
        backgrounds.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        btnProfile.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.right.equalToSuperview().offset(-24)
            make.size.equalTo(52)
        }
        
        btnStart.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-60)
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.height.equalTo(64)
        }
        
        userImage.snp.makeConstraints { make in
            make.top.equalTo(btnProfile.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.size.equalTo(100)
        }
        
        userName.snp.makeConstraints { make in
            make.top.equalTo(userImage.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(24)
        }
        
    }
    
}
