//
//  InfoView.swift

import Foundation
import UIKit
import SnapKit

class InfoView: UIView {
    
    private (set) var backgrounds: UIImageView = {
        let imv = UIImageView()
        imv.image = .bgInfo
        imv.contentMode = .scaleToFill
        return imv
    }()
    
    private (set) var btnBack: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.btnBack, for: .normal)
        return btn
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private (set) var labelContainer: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgContInfoLabel
        return imageView
    }()
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to \(Settings.appTitle)!"
        label.font = .customFont(font: .mac, style: .regular, size: 24)
        label.textColor = .cYellow
        label.textAlignment = .center
        return label
    }()
    
    private (set) var labelOne: UILabel = {
        let label = UILabel.createLabel(withText: "In modern China, the grand cultural festival in Chengdu attracts the best dancers from across the country. The highlight of the festival is the Tiger Dance, symbolizing the grace and strength of the tiger, an ancient emblem of Chinese culture and wisdom.\n\n  You are Zheng, a young dancer fascinated by tigers and their majestic grace. Your dream is to perform the Tiger Dance on the main stage of the festival. To achieve this, you must understand the true spirit of the tiger and perfect your dancing skills. Your journey begins with an ancient manuscript that speaks of a magical tiger spirit.", font: .customFont(font: .ubuntuMono, style: .regular, size: 16), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.4, kern: 0.64)
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private (set) var labelTwo: UILabel = {
        let label = UILabel()
        label.text = "Game Tips:"
        label.font = .customFont(font: .mac, style: .regular, size: 20)
        label.textColor = .cYellow
        label.textAlignment = .left
        return label
    }()
    
    private(set) var labelThree: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left

        let fullText = """
        \u{2022} Pay close attention to the storyline for clues to solve puzzles and overcome trials.
        \u{2022} Collect hidden tiger symbols and magical items to gain strength and wisdom.
        \u{2022} Use your attempts wisely; you have two chances to solve each riddle correctly.
        \u{2022} Customize your avatar and track your achievements through the Profile page.
        \u{2022} Rate and provide feedback to help us improve the game.
        """

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.4
        paragraphStyle.paragraphSpacing = 1
        paragraphStyle.headIndent = 18
        paragraphStyle.firstLineHeadIndent = 0

        let attributedString = NSMutableAttributedString(string: fullText, attributes: [
            .font: UIFont.customFont(font: .ubuntuMono, style: .regular, size: 16),
            .foregroundColor: UIColor.white,
            .paragraphStyle: paragraphStyle,
            .kern: 0.64
        ])

        label.attributedText = attributedString
        return label
    }()
    
    private (set) var labelFour: UILabel = {
        let label = UILabel.createLabel(withText: "  Are you ready to guide Zheng on his journey and help him achieve his dream? Let’s start the adventure in Legacy Dance!", font: .customFont(font: .ubuntuMono, style: .regular, size: 16), textColor: .cYellow, paragraphSpacing: 1, lineHeightMultiple: 1.4, kern: 0.64)
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
        
        [backgrounds, btnBack, scrollView] .forEach(addSubview(_:))
        scrollView.addSubview(contentView)
        contentView.addSubview(labelContainer)
        labelContainer.addSubview(titleLabel)
        labelContainer.addSubview(labelOne)
        labelContainer.addSubview(labelTwo)
        labelContainer.addSubview(labelThree)
        labelContainer.addSubview(labelFour)

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
    
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(btnBack.snp.bottom).offset(268)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        labelContainer.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview().inset(8)
            make.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.right.equalToSuperview().inset(32)
        }
        
        labelOne.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(32)
        }
        
        labelTwo.snp.makeConstraints { make in
            make.top.equalTo(labelOne.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(44)
        }
        
        labelThree.snp.makeConstraints { make in
            make.top.equalTo(labelTwo.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(32)
        }
        
        labelFour.snp.makeConstraints { make in
            make.top.equalTo(labelThree.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(32)
            make.bottom.equalToSuperview().offset(-24)
        }
    
    }
}
