//
//  StoryView.swift


import Foundation
import UIKit
import SnapKit

class StoryView: UIView {
    
    
    private (set) var backgrounds: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private (set) var btnBack: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .red
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
        
        [backgrounds, btnBack] .forEach(addSubview(_:))
        
    }
    
    private func setupConstraints() {
        backgrounds.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        btnBack.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
        }
    }
}
