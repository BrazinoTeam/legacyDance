//
//  MeetingTheGuardianVC.swift

import Foundation
import UIKit
import SnapKit

class MeetingTheGuardianVC: UIViewController {
    
    private var textArray: [String] = ["Zheng reached the mountain's peak, where the guardian of the tiger's spirit awaited him – a majestic elder with eyes full of wisdom. The guardian said, You have proven your determination and strength. Now you are ready to meet the spirit of the tiger.",
                                       "   Zheng learned that the spirit of the tiger resided in an ancient temple hidden deep in the mountains. He had to cross the Valley of Shadows to reach the temple."]
    private var imageArray: [UIImage] = [.imgStory13, .imgStory14]
    
    private var countText : Int = 0
    private var isTrue: Bool = false
    
    var contentView: MeetingTheGuardianView {
        view as? MeetingTheGuardianView ?? MeetingTheGuardianView()
    }
    
    override func loadView() {
        view = MeetingTheGuardianView()
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
        contentView.btnGo.addTarget(self, action: #selector(goNextChapter), for: .touchUpInside)
    }
    
    @objc func goNextChapter() {
        let vc = ValleyOfShadowsVC()
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
                   contentView.labelContainerHeightConstraint?.update(offset: 232.autoSize)
               case 1:
                   contentView.labelContainerHeightConstraint?.update(offset: 166.autoSize)
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
