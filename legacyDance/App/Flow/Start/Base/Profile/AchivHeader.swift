//
//  AchivHeader.swift

import Foundation
import UIKit
import SnapKit

class AchivHeader: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Achievements"
        label.textColor = .cYellow
        label.font = .customFont(font: .mac, style: .regular, size: 48)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }
}
