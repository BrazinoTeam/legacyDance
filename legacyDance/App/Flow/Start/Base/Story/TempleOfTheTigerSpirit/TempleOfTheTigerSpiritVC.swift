//
//  TempleOfTheTigerSpiritVC.swift


import Foundation
import UIKit
import SnapKit

class TempleOfTheTigerSpiritVC: UIViewController {
    
    private var textArray: [String] = ["Having passed through the Valley of Shadows, Zheng finally reached the ancient temple where the spirit of the tiger awaited him. Inside the temple, it was dark and quiet, but Zheng felt the presence of the mighty tiger.",
                                       "   In front of Zheng appeared a wheel of fortune. The tiger spirit said, Spin the wheel to learn your fate and receive a blessing for the Tiger Dance."]
    private var imageArray: [UIImage] = [.imgStory26, .imgStoryCircle]
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
        case 225:
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
            presentPrizeView(image: .imgAgain, title: "You must spin the wheel again.", closeSelector: #selector(closeOne), heightView: 468, widthView: 360, heightLabelCont: 54)
print("1")
        case contentView.segmentValues[1]:
                        presentPrizeView(image: .imgStrength, title: "You receive the strength of the tiger, which will aid you in the dance", closeSelector: #selector(closedModalView), heightView: 530, widthView: 360, heightLabelCont: 100)
            print("strength")

        case contentView.segmentValues[2]:
            presentPrizeView(image: .imgWisdom, title: "You gain the wisdom of the tiger, which will guide your steps.", closeSelector: #selector(closedModalView), heightView: 508, widthView: 360, heightLabelCont: 76)
            print("wisdom")

        case contentView.segmentValues[3]:
                        presentPrizeView(image: .imgAgile, title: "You become as agile as the tiger, and the dance will be perfect.", closeSelector: #selector(closedModalView), heightView: 508, widthView: 360, heightLabelCont: 76)
            print("agile")

        default:
            break
        }
    }
    
    private func presentPrizeView(image: UIImage, title: String, closeSelector: Selector, heightView: Double, widthView: Double, heightLabelCont: Double) {
        if fullScreenView == nil {
            fullScreenView = UIView(frame: self.view.bounds)
            fullScreenView!.backgroundColor = .black.withAlphaComponent(0.9)
            fullScreenView!.alpha = 0
            
            let bgImage = UIImageView()
            bgImage.image = .imgBGContModalCircle
            fullScreenView!.addSubview(bgImage)
            
            let modalView = UIView()
            modalView.backgroundColor = .clear
            fullScreenView!.addSubview(modalView)
            
            let centerImg = UIImageView()
            centerImg.image = image
            centerImg.contentMode = .scaleToFill
            centerImg.layer.shadowColor = UIColor(red: 1, green: 0.66, blue: 0, alpha: 0.9).cgColor
            centerImg.layer.shadowOpacity = 1
            centerImg.layer.shadowRadius = 88
            centerImg.layer.shadowOffset = CGSize(width: 0, height: 0)
            modalView.addSubview(centerImg)
            
            let labelCont = UIImageView()
            labelCont.image = .imgContLabel
            labelCont.contentMode = .scaleToFill
            modalView.addSubview(labelCont)

            let titleLabel = UILabel.createLabel(withText: title, font: .customFont(font: .ubuntuMono, style: .regular, size: Int(16.autoSize)), textColor: .black, paragraphSpacing: 1, lineHeightMultiple: 1.4, kern: 1)
            titleLabel.numberOfLines = 0
            titleLabel.textAlignment = .center
            titleLabel.textColor = .white
            labelCont.addSubview(titleLabel)
            
            let backButton = UIButton()
            backButton.configureButton(withTitle: "Accept the blessing", font: .customFont(font: .mac, style: .regular, size: 20), titleColor: .cDarkRed, normalImage: .imgBtnSelect, highlightedImage: nil)
            backButton.addTarget(self, action: closeSelector, for: .touchUpInside)
            fullScreenView!.addSubview(backButton)
            
            let heightView = heightView
            let widthView = widthView
            let heightLabelCont = heightLabelCont

            bgImage.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().offset(16)
                make.size.equalTo(685)
            }
            
            modalView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(30)
                make.width.equalTo(widthView.autoSize)
                make.height.equalTo(heightView.autoSize)
            }
            
            centerImg.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.centerX.equalToSuperview()
                make.width.equalTo(315.autoSize)
                make.height.equalTo(320.autoSize)
            }
            
            labelCont.snp.makeConstraints { make in
                make.left.right.equalToSuperview()
                make.top.equalTo(centerImg.snp.bottom).offset(24)
                make.height.equalTo(heightLabelCont)
            }
            
            titleLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(24)
            }
            
            backButton.snp.makeConstraints { make in
                make.top.equalTo(labelCont.snp.bottom).offset(24)
                make.centerX.equalToSuperview()
                make.height.equalTo(64)
                make.width.equalTo(360)
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
            contentView.labelContainerHeightConstraint?.update(offset: 214.autoSize)
        case 1:
            contentView.labelContainerHeightConstraint?.update(offset: 170.autoSize)
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
                isTrue = false 
            }
            updateLabelAndText()
            updateButtonsVisibility()
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
