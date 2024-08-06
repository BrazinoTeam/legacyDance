//
//  InfoView.swift

import Foundation
import UIKit
import SnapKit

class InfoView: UIView {
    
    
    private (set) var backgrounds: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private (set) var btnBack: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .red
        btn.setTitle("B", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "\(Settings.appTitle)"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 36)
        return label
    }()
    
    private (set) var contentLabel: UILabel = {
        let label = UILabel()
        label.text = """
Welcome to Legacy Dance!
In modern China, the grand cultural festival in Chengdu attracts the best dancers from across the country. The highlight of the festival is the Tiger Dance, symbolizing the grace and strength of the tiger, an ancient emblem of Chinese culture and wisdom.
You are Zheng, a young dancer fascinated by tigers and their majestic grace. Your dream is to perform the Tiger Dance on the main stage of the festival. To achieve this, you must understand the true spirit of the tiger and perfect your dancing skills. Your journey begins with an ancient manuscript that speaks of a magical tiger spirit.
Game Tips:
Pay close attention to the storyline for clues to solve puzzles and overcome trials.
Collect hidden tiger symbols and magical items to gain strength and wisdom.
Use your attempts wisely; you have two chances to solve each riddle correctly.
Customize your avatar and track your achievements through the Profile page.
Rate and provide feedback to help us improve the game.
Are you ready to guide Zheng on his journey and help him achieve his dream? Let’s start the adventure in Legacy Dance!
"""
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
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
        
        [backgrounds, btnBack, titleLabel, contentLabel] .forEach(addSubview(_:))
        
    }
    
    private func setupConstraints() {
        backgrounds.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        btnBack.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
            make.size.equalTo(48)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(btnBack.snp.bottom).offset(24)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
        }
    }
}
