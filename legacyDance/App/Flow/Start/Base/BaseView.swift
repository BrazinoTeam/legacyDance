//
//  BaseView.swift


import Foundation
import UIKit
import SnapKit

class BaseView: UIView {
    
    
    private (set) var backgrounds: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private (set) var btnProfile: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .black
        btn.setTitle("P", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    private (set) var userImage: UIImageView = {
        let imv = UIImageView()
        imv.contentMode = .scaleToFill
        imv.backgroundColor = .orange
        imv.image  = .imgUserDef
        return imv
    }()
    
    private (set) var userName: UILabel = {
        let label = UILabel()
        label.text = "\(Memory.shared.userName ?? "Welcome, User name!")"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private (set) var btnStart: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .black
        btn.setTitle("Go to Story", for: .normal)
        btn.setTitleColor(.white, for: .normal)
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
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
            make.right.equalToSuperview().offset(-24)
            make.size.equalTo(48)
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
