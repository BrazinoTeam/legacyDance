//
//  AchivCell.swift


import Foundation
import UIKit
import SnapKit

class AchivCell: UITableViewCell {
    
    static let reuseId = String(describing: AchivCell.self)

    private(set) lazy var leadView: UIView = {
        let view = UIView()
        view.backgroundColor = .cDarkRed
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        return view
    }()
    
    private(set) lazy var achivImage: UIImageView = {
        let iv = UIImageView()
        iv.layer.shadowColor = UIColor(red: 1, green: 0.66, blue: 0, alpha: 0.6).cgColor
        iv.layer.shadowOpacity = 1
        iv.layer.shadowRadius = 16
        iv.layer.shadowOffset = CGSize(width: 0, height: 0)
        return iv
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .cYellow
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .customFont(font: .mac, style: .regular, size: 24)
        return label
    }()
    
    private(set) lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .customFont(font: .ubuntuMono, style: .regular, size: 16)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setUpConstraints()
    }
    
        func setupUI() {
            backgroundColor = .clear
            contentView.addSubview(leadView)
            contentView.backgroundColor = .clear
            selectionStyle = .none
            [achivImage, titleLabel, subTitleLabel] .forEach(leadView.addSubview(_:))

    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        achivImage.image = nil
        titleLabel.text = nil
        subTitleLabel.text =  nil
    }
    
    private func setUpConstraints(){
        
        leadView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(12)
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(104.autoSize)
        }

        achivImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(90)
            make.height.equalTo(88)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalTo(achivImage.snp.right).offset(8)
        }
        
        subTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.equalTo(achivImage.snp.right).offset(8)
            make.right.equalToSuperview().offset(-8)
        }
    }
}
