//
//  FinalVC.swift


import Foundation
import UIKit
import SnapKit

class FinalVC: UIViewController {
    
    private var textArray: [String] = ["   Zheng began his dance, and each of his steps was filled with the grace and strength of the tiger. The audience watched in awe, feeling the spirit of the tiger in every move he made. It was a magical sight, and Zheng realized he had achieved his dream.",
                                       "   After his performance, Zheng became a true legend. His dance inspired many people, and he continued to pass on his knowledge and skills to new generations of dancers. Zheng understood that the true power of the dance lay not only in the movements but also in the spirit they carried."]
    private var imageArray: [UIImage] = [.imgStory02, .imgStory03]
    
    private var countText : Int = 0
    private var isTrue: Bool = false
    
    var contentView: FinalView {
        view as? FinalView ?? FinalView()
    }
    
    override func loadView() {
        view = FinalView()
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
        contentView.btnGo.addTarget(self, action: #selector(finalChapter), for: .touchUpInside)
    }
    
    @objc func finalChapter() {
        navigationController?.popToRootViewController(animated: true)
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
            contentView.labelContainerHeightConstraint?.update(offset: 208)
            contentView.labelContainerBottomConstraint?.update(offset: -16)
            
        case 1:
            contentView.labelContainerHeightConstraint?.update(offset: 252)
            contentView.labelContainerBottomConstraint?.update(offset: -212)
            
        default:
            break
        }
    }
    
    private func updateButtonsVisibility() {
        contentView.btnGo.isHidden = !isTrue
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
