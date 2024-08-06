//
//  ProfileView.swift

import Foundation
import UIKit
import SnapKit

class ProfileView: UIView, UITextFieldDelegate{
    
    
    private (set) var backgrounds: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    private (set) var btnBack: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .red
        btn.setTitle("B", for: .normal)
        btn.setTitleColor(.white, for: .normal)
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
        view.layer.cornerRadius = 20.autoSize
        return view
    }()
    
    private(set) lazy var profileTextField: UITextField = {
        let textField = UITextField()
        let font = UIFont.boldSystemFont(ofSize: 16)
        let fontSize = CGFloat(16)
        
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
        textField.font = UIFont.boldSystemFont(ofSize: 18)
        textField.textColor = .white
        textField.backgroundColor = .clear
        textField.textAlignment = .center
        textField.delegate = self
        textField.returnKeyType = .done
        return textField
    }()
    
    private(set) lazy var achivTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .blue
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
        
        [backgrounds, btnBack, btnRateUs, btnWriteUS, btnInfo, btnUserPhoto, nameView, achivTableView] .forEach(addSubview(_:))
        nameView.addSubview(profileTextField)
        nameView.addSubview(editBtn)

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
        
        btnRateUs.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(52)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
            make.size.equalTo(52)
        }
        
        btnWriteUS.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-52)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
            make.size.equalTo(52)
        }
        
        btnInfo.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-24)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
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
        
        profileTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(48)
        }
        
        editBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-6)
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
