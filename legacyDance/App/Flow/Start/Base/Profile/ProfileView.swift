//
//  ProfileView.swift

import Foundation
import UIKit
import SnapKit

class ProfileView: UIView, UITextFieldDelegate{
    
    private (set) var backgrounds: UIImageView = {
        let imv = UIImageView()
        imv.image = .bgProfile
        imv.contentMode = .scaleToFill
        return imv
    }()
    
    private (set) var btnBack: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.btnBack, for: .normal)
        return btn
    }()
    
    private (set) var btnRateUs: UIButton = {
        let btn = UIButton()
        btn.setImage(.imgRateUs, for: .normal)
        return btn
    }()
    
    private (set) var btnWriteUS: UIButton = {
        let btn = UIButton()
        btn.setImage(.imgWriteUs, for: .normal)
        return btn
    }()
    
    private (set) var btnInfo: UIButton = {
        let btn = UIButton()
        btn.setImage(.imgInfoBtn, for: .normal)
        return btn
    }()
    
    private (set) var btnUserPhoto: UIButton = {
        let btn = UIButton()
        btn.setImage(.imgUserProfile, for: .normal)
        return btn
    }()
    
    private (set) var nameView: UIView = {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.3)
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.cYellow.cgColor
        view.layer.borderWidth = 1
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        return view
    }()
    
    private (set) var bgNameView: UIImageView = {
        let imv = UIImageView()
        imv.image = .imgContNameView
        imv.contentMode = .scaleToFill
        return imv
    }()
    
    private(set) lazy var profileTextField: UITextField = {
        let textField = UITextField()
        let font = UIFont.customFont(font: .mac, style: .regular, size: 32)
        let fontSize = CGFloat(32)
        
        // Атрибуты для placeholder
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.white.withAlphaComponent(0.5),
        ]
        
        let placeholderText = NSAttributedString(string: "User name", attributes: placeholderAttributes)
        textField.attributedPlaceholder = placeholderText

        textField.placeholder = "User Name"
        
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.white,
        ]
        textField.font = UIFont.customFont(font: .mac, style: .regular, size: 32)
        textField.textColor = .white
        textField.backgroundColor = .clear
        textField.textAlignment = .center
        textField.delegate = self
        textField.returnKeyType = .done
        return textField
    }()
    
    private(set) lazy var achivTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        tableView.register(AchivCell.self, forCellReuseIdentifier: AchivCell.reuseId)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private(set) lazy var editBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(.editBtn, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        saveName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        [backgrounds, btnBack, btnRateUs, btnWriteUS, btnInfo, btnUserPhoto, nameView, editBtn, achivTableView] .forEach(addSubview(_:))
        nameView.addSubview(bgNameView)
        nameView.addSubview(profileTextField)
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
        
        btnRateUs.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(52)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.size.equalTo(52)
        }
        
        btnWriteUS.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-52)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.size.equalTo(52)
        }
        
        btnInfo.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-24)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.size.equalTo(52)
        }
        
        btnUserPhoto.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(btnBack.snp.bottom).offset(40)
            make.size.equalTo(100)
        }
        
        nameView.snp.makeConstraints { make in
            make.top.equalTo(btnUserPhoto.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(64)
        }
        
        bgNameView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        profileTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(48)
        }
        
        editBtn.snp.makeConstraints { make in
            make.centerY.equalTo(nameView)
            make.right.equalTo(nameView.snp.right).offset(-6)
        }
        
        achivTableView.snp.makeConstraints { make in
            make.top.equalTo(nameView.snp.bottom).offset(40)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.left.right.equalToSuperview().inset(20)
        }
    }
    
    private func saveName() {
        if let savedUserName = Memory.shared.userName {
            profileTextField.text = savedUserName
        }
    }

    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        Memory.shared.userName = textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
