//
//  ValleyOfShadowsVC.swift


import Foundation
import UIKit
import SnapKit

class ValleyOfShadowsVC: UIViewController {
    
    private var textArray: [String] = ["The Valley of Shadows was a dark and eerie place, where every tree and stone seemed alive. Zheng felt fear gripping him, but he did not retreat.",
                                       "   In the valley, he met a ghostly tiger who offered him a challenge: To pass further, you must defeat your inner demons. Undergo three trials and prove your strength of spirit."]
    private var imageArray: [UIImage] = [.imgStory15, .imgStory16]
    
    private var countText : Int = 0
    private var isTrue: Bool = false
    
    var contentView: ValleyOfShadowsView {
        view as? ValleyOfShadowsView ?? ValleyOfShadowsView()
    }
    
    override func loadView() {
        view = ValleyOfShadowsView()
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
        let vc = TrialOfFearVC()
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
                   contentView.labelContainerHeightConstraint?.update(offset: 166.autoSize)
               case 1:
                   contentView.labelContainerHeightConstraint?.update(offset: 188.autoSize)
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
