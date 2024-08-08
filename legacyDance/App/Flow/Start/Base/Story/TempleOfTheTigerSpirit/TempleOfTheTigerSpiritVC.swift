//
//  TempleOfTheTigerSpiritVC.swift


import Foundation
import UIKit
import SnapKit

class TempleOfTheTigerSpiritVC: UIViewController {
    
    private var textArray: [String] = ["Having passed through the Valley of Shadows, Zheng finally reached the ancient temple where the spirit of the tiger awaited him. Inside the temple, it was dark and quiet, but Zheng felt the presence of the mighty tiger.",
                                       "   In front of Zheng appeared a wheel of fortune. The tiger spirit said, Spin the wheel to learn your fate and receive a blessing for the Tiger Dance."]
    private var imageArray: [UIImage] = [.imgStory26, .imgStory26]
    private var variable: Int = 0
    private var fullScreenView: UIView?
    
    private var countText : Int = 0
    private var isTrue: Bool = false
    
    var contentView: TempleOfTheTigerSpiritView {
        view as? TempleOfTheTigerSpiritView ?? TempleOfTheTigerSpiritView()
    }
    
    override func loadView() {
        view = TempleOfTheTigerSpiritView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn()
        updateLabelAndText()
        updateButtonsVisibility()
    }
    
    
    private func selectBtn() {
        contentView.btnBack.addTarget(self, action: #selector(backNavigate), for: .touchUpInside)
        contentView.btnRight.addTarget(self, action: #selector(selectRight), for: .touchUpInside)
        contentView.btnLeft.addTarget(self, action: #selector(selectLeft), for: .touchUpInside)
        contentView.btnSpin.addTarget(self, action: #selector(goSpin), for: .touchUpInside)
    }
    
    @objc func goSpin() {
        spinCircle()
    }
    
    private func spinCircle(completion: (() -> Void)? = nil) {
        contentView.btnSpin.isEnabled = false
        let sectorAngles: [CGFloat] = [45, 135, 225, 315]
        
        let randomSectorAngle = sectorAngles.randomElement() ?? 360
        let selectRotation = randomSectorAngle * .pi / 180.0
        
        switch randomSectorAngle {
        case 45:
            variable = contentView.segmentValues[0]
            print("orange")
        case 135:
            variable = contentView.segmentValues[1]
            print("yellow")
        case 215:
            variable = contentView.segmentValues[2]
            print("black")
        case 315:
            variable = contentView.segmentValues[3]
            print("green")
        default:
            break
        }
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.toValue = CGFloat.pi * 8 + selectRotation
        rotationAnimation.duration = 3.0
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        rotationAnimation.fillMode = .forwards
        rotationAnimation.isRemovedOnCompletion = false
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.contentView.btnSpin.isEnabled = true
                self.showModalView()
                completion?()
            }
        }
        contentView.circleContainer.layer.add(rotationAnimation, forKey: "rotationAnimation")
        CATransaction.commit()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            completion?()
        }
    }
    
    private func showModalView() {
        switch variable {
        case contentView.segmentValues[0]:
            presentPrizeView(image: .imgGod1, title: "You receive the strength of the tiger, which will aid you in the dance", closeSelector: #selector(closedModalView))

        case contentView.segmentValues[1]:
            presentPrizeView(image: .imgGod2, title: "You gain the wisdom of the tiger, which will guide your steps.", closeSelector: #selector(closedModalView))

        case contentView.segmentValues[2]:
            presentPrizeView(image: .imgGod3, title: "You become as agile as the tiger, and the dance will be perfect.", closeSelector: #selector(closedModalView))

        case contentView.segmentValues[3]:
            presentPrizeView(image: .imgGod4, title: "You must spin the wheel again.", closeSelector: #selector(closeOne))

        default:
            break
        }
    }
    
    private func presentPrizeView(image: UIImage, title: String, closeSelector: Selector) {
        if fullScreenView == nil {
            fullScreenView = UIView(frame: self.view.bounds)
            fullScreenView!.backgroundColor = .black.withAlphaComponent(0.8)
            fullScreenView!.alpha = 0
            
            let modalView = UIView()
            modalView.backgroundColor = .white
            fullScreenView!.addSubview(modalView)
            
            let centerImg = UIImageView()
            centerImg.image = image
            centerImg.contentMode = .scaleToFill
            modalView.addSubview(centerImg)
            
            let titleLabel = UILabel.createLabel(withText: title, font: .customFont(font: .ubuntuMono, style: .regular, size: 16), textColor: .black, paragraphSpacing: 1, lineHeightMultiple: 1.4, kern: 1)
            titleLabel.numberOfLines = 0
            titleLabel.textAlignment = .center
            modalView.addSubview(titleLabel)
            
            let backButton = UIButton()
            backButton.configureButton(withTitle: "Accept the blessing", font: .customFont(font: .mac, style: .regular, size: 20), titleColor: .cDarkRed, normalImage: .imgBtnSelect, highlightedImage: nil)
            backButton.addTarget(self, action: closeSelector, for: .touchUpInside)
            fullScreenView!.addSubview(backButton)
            
            modalView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
                make.width.equalTo(353.autoSize)
                make.height.equalTo(406.autoSize)
            }
            
            centerImg.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(32)
                make.centerX.equalToSuperview()
                make.size.equalTo(186)
            }
            
            titleLabel.snp.makeConstraints { make in
                make.left.right.equalToSuperview().inset(16)
                make.top.equalTo(centerImg.snp.bottom).offset(8)
            }
            
            backButton.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(40)
                make.centerX.equalToSuperview()
                make.height.equalTo(64)
                make.width.equalTo(240)
            }
        
            self.view.addSubview(fullScreenView!)
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.fullScreenView!.alpha = 1
        })
    }
    
    @objc func closedModalView() {
        UIView.animate(withDuration: 0.5, animations: {
            self.fullScreenView?.alpha = 0
        }) { _ in
            self.fullScreenView?.removeFromSuperview()
            self.fullScreenView = nil
            self.goNextChapter()
        }
    }
    
    @objc func closeOne() {
        UIView.animate(withDuration: 0.5, animations: {
            self.fullScreenView?.alpha = 0
        }) { _ in
            self.fullScreenView?.removeFromSuperview()
            self.fullScreenView = nil
        }
    }
    
    private func goNextChapter() {
        let vc = ReturnToTheFestivalVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backNavigate() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func updateLabelAndText() {
        contentView.numberLabel.text = "\(countText + 1) / \(textArray.count)"
        contentView.numberLabel.textColor = .white
        contentView.contentLabel.text = textArray[countText]
        contentView.backgrounds.image = imageArray[countText]
        switch countText {
        case 0:
            contentView.labelContainerHeightConstraint?.update(offset: 214)
        case 1:
            contentView.labelContainerHeightConstraint?.update(offset: 170)
        default:
            break
        }
    }
    
    private func updateButtonsVisibility() {
        contentView.btnSpin.isHidden = !isTrue
        contentView.imgContSpin.isHidden = !isTrue
        contentView.circleContainer.isHidden = !isTrue
        contentView.imgCenterSpin.isHidden = !isTrue
        contentView.imgTopSpin.isHidden = !isTrue
        contentView.imgPointer.isHidden = !isTrue
        contentView.imgSpin.isHidden = !isTrue
    }
    
    @objc func selectLeft() {
        if countText > 0 {
            countText -= 1
            if countText < textArray.count - 1 {
                isTrue = false // Обновить значение isTrue при движении влево
            }
            updateLabelAndText()
            updateButtonsVisibility() // Обновить видимость кнопок
        }
    }
    
    @objc func selectRight() {
        if countText < textArray.count - 1 {
            countText += 1
            updateLabelAndText()
            if countText == textArray.count - 1 {
                isTrue = true
                updateButtonsVisibility()
            }
        }
    }
}
