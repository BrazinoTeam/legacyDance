//
//  TempleOfTheTigerSpiritView.swift


import Foundation
import UIKit
import SnapKit

class TempleOfTheTigerSpiritView: UIView {
    
    
    private (set) var backgrounds: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgStory26
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
    
    private (set) var btnLeft: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.imgBtnLeft, for: .normal)
        return btn
    }()
    
    private (set) var btnRight: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.imgBtnRight, for: .normal)
        return btn
    }()
    
    private (set) var numberLabel: UILabel = {
        let label = UILabel.createLabel(withText: "1/3", font: .customFont(font: .unifrakturCook, style: .bold, size: 14), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.07, kern: 1)
        return label
    }()
    
    private (set) var contentLabel: UILabel = {
        let label = UILabel.createLabel(withText: "In moder", font: .customFont(font: .ubuntuMono, style: .regular, size: Int(16.autoSize)), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.4, kern: 0.64)
        return label
    }()
    
    private (set) var btnSpin: UIButton = {
        let btn = UIButton()
        btn.configureButton(withTitle: "Spin the wheel", font: .customFont(font: .mac, style: .regular, size: 20), titleColor: .cDarkRed, normalImage: .imgBtnSelect, highlightedImage: nil)
        btn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        return btn
    }()
    
    var labelContainerHeightConstraint: Constraint?
    let segmentValues = [0, 1, 2, 3]
    private var storage = Memory.shared
    private var corners: [CircleView] = []
    private let count = 4
    private let colors: [UIColor] = [.clear, .clear, .clear, .clear]

    private(set) lazy var circleContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()

    private(set) lazy var imgContSpin: UIImageView = {
        let image = UIImageView()
        image.image = .imgContSpin
        return image
    }()


    private(set) lazy var imgSpin: UIImageView = {
        let image = UIImageView()
        image.image = .imgSpin
        return image
    }()
    
    private(set) lazy var imgCenterSpin: UIImageView = {
        let image = UIImageView()
        image.image = .imgCenterSpin
        return image
    }()
    
    private(set) lazy var imgTopSpin: UIImageView = {
        let image = UIImageView()
        image.image = .imgTopElementCircle
        image.contentMode = .scaleToFill
        return image
    }()
    
    private(set) lazy var imgPointer: UIImageView = {
        let image = UIImageView()
        image.image = .imgSelectCount
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        setupWheel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        [backgrounds, btnBack, btnSpin,labelContainer, btnLeft, btnRight, imgContSpin, circleContainer, imgCenterSpin, imgTopSpin, imgPointer] .forEach(addSubview(_:))
        labelContainer.addSubview(numberLabel)
        labelContainer.addSubview(contentLabel)
        circleContainer.addSubview(imgSpin)
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
        
        btnSpin.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(64)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-12)
        }
        
        labelContainer.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(btnSpin.snp.top).offset(-16.autoSize)
            labelContainerHeightConstraint = make.height.equalTo(276.autoSize).constraint
        }
        
        numberLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-12)
        }
        
        btnLeft.snp.makeConstraints { make in
            make.centerY.equalTo(numberLabel)
            make.right.equalTo(numberLabel.snp.left).offset(-8)
        }
        
        btnRight.snp.makeConstraints { make in
            make.centerY.equalTo(numberLabel)
            make.left.equalTo(numberLabel.snp.right).offset(8)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.right.equalToSuperview().inset(24)
        }
        
        imgContSpin.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-60)
            make.width.equalTo(362.autoSize)
            make.height.equalTo(340.autoSize)
        }
        
        circleContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-60)
            make.size.equalTo(275.autoSize)
        }
        
        imgSpin.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imgCenterSpin.snp.makeConstraints { make in
            make.center.equalTo(imgSpin)
            make.size.equalTo(70.autoSize)
        }
        
        imgTopSpin.snp.makeConstraints { make in
            make.left.right.top.equalTo(imgContSpin)
            make.height.equalTo(107.autoSize)
        }
        
        imgPointer.snp.makeConstraints { make in
            make.centerX.equalTo(imgSpin)
            make.centerY.equalTo(imgSpin.snp.bottom)
            make.size.equalTo(66.autoSize)
        }
    }
    
    private func setupWheel() {
        for index in 0..<count {
            let corner = CircleView(startAngle: CGFloat(Double(index) / Double(count) * 2 * Double.pi),
                                 endAngle: CGFloat(Double(index + 1) / Double(count) * 2 * Double.pi),
                                 color: colors[index % colors.count])
            circleContainer.addSubview(corner)
            corners.append(corner)
        }
        corners.forEach { corner in
            corner.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(10)
            }
        }
    }
}
