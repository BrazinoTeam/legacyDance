//
//  FirstStopVC.swift


import Foundation
import UIKit
import SnapKit

class FirstStopVC: UIViewController {
    
    private var textArray: [String] = ["Zheng began his journey by traveling to the Longshan Mountains, where legends said the first guardian of the tiger's spirit lived. Upon reaching the foot of the mountains, he met an old martial arts master who offered him a challenge:", "To ascend the mountain and find the guardian, you must prove your strength of spirit and body. Pass through the forest full of trials and find three hidden tiger symbols."]
    private var imageArray: [UIImage] = [.imgStory04, .imgStory05]
    
    private var countText : Int = 0
    private var isTrue: Bool = false
    
    var contentView: FirstStopView {
        view as? FirstStopView ?? FirstStopView()
    }
    
    override func loadView() {
        view = FirstStopView()
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
        let vc = ForestOfTrialsVC()
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
