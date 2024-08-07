//
//  StoryVC.swift


import Foundation
import UIKit
import SnapKit

class StoryBiginningVC: UIViewController {
    
    private var textArray: [String] = ["In modern China, in the city of Chengdu, a grand cultural festival was held every summer, attracting the best dancers from across the country to showcase their skills. The main event of the festival was the Tiger Dance, inspired by the grace and strength of the tiger, symbolizing ancient Chinese culture and wisdom.", "The protagonist of this story is a young dancer named Zheng. Since childhood, he has been fascinated by tigers and their majestic grace. Zheng dreamed of performing the Tiger Dance on the main stage of the festival one day. However, to achieve his dream, he knew he had to understand the true spirit of the tiger and perfect his dancing skills.", "One evening, while browsing through ancient books in the city library, Zheng came across an old manuscript that spoke of a magical tiger whose spirit could be summoned to gain strength and wisdom. He decided to embark on a journey to find this tiger and immerse himself in its spirit."]
    private var imageArray: [UIImage] = [.imgStory01, .imgStory02, .imgStory03]
    
    private var countText : Int = 0
    private var isTrue: Bool = false
    
    var contentView: StoryBiginningView {
        view as? StoryBiginningView ?? StoryBiginningView()
    }
    
    override func loadView() {
        view = StoryBiginningView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn()
        updateLabelAndText()
        updateButtonsVisibility()
        Memory.shared.incorrectAnswer = 0
    }
    
    
    private func selectBtn() {
        contentView.btnBack.addTarget(self, action: #selector(backNavigate), for: .touchUpInside)
        contentView.btnRight.addTarget(self, action: #selector(selectRight), for: .touchUpInside)
        contentView.btnLeft.addTarget(self, action: #selector(selectLeft), for: .touchUpInside)
        contentView.btnGo.addTarget(self, action: #selector(goNextChapter), for: .touchUpInside)
    }
    
    @objc func goNextChapter() {
        let vc = FirstStopVC()
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
                   contentView.labelContainerHeightConstraint?.update(offset: 276)
               case 1:
                   contentView.labelContainerHeightConstraint?.update(offset: 298)
               case 2:
                   contentView.labelContainerHeightConstraint?.update(offset: 254)
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
              updateLabelAndText()
              if countText < textArray.count - 1 {
                  updateButtonsVisibility()
              }
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
