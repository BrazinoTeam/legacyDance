//
//  FindingTheThreeSymbolsVC.swift

import Foundation
import UIKit
import SnapKit

class FindingTheThreeSymbolsVC: UIViewController {
    
    private var textArray: [String] = ["Zheng continued his journey through the forest until he found the first symbol carved into an old tree. He carefully examined it and moved on.", "The second symbol was hidden in a cave, where strange glowing insects awaited him. Zheng used a torch to drive them away and find the symbol", "   The third symbol was on a cliff, accessible only by solving a riddle: What grows when it drinks, and dies when it eats?"]
    private var imageArray: [UIImage] = [.imgStory09, .imgStory10, .imgStory11]
    
    private var countText : Int = 0
    private var isTrue: Bool = false
    private var selectedButton: UIButton?
    private var fullScreenView: UIView?

    var contentView: FindingTheThreeSymbolsView {
        view as? FindingTheThreeSymbolsView ?? FindingTheThreeSymbolsView()
    }
    
    override func loadView() {
        view = FindingTheThreeSymbolsView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn()
        updateLabelAndText()
        updateButtonsVisibility()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("incorrectAnswer - \(Memory.shared.incorrectAnswer)")
        clearBorderBtn()
    }
    
    private func selectBtn() {
        contentView.btnBack.addTarget(self, action: #selector(backNavigate), for: .touchUpInside)
        contentView.btnRight.addTarget(self, action: #selector(selectRight), for: .touchUpInside)
        contentView.btnLeft.addTarget(self, action: #selector(selectLeft), for: .touchUpInside)
        contentView.btnAnswer.addTarget(self, action: #selector(goNextChapter), for: .touchUpInside)
        
        contentView.btnOne.addTarget(self, action: #selector(selectButton(_:)), for: .touchUpInside)
        contentView.btnTwo.addTarget(self, action: #selector(selectButton(_:)), for: .touchUpInside)
        contentView.btnThree.addTarget(self, action: #selector(selectButton(_:)), for: .touchUpInside)
        contentView.btnFour.addTarget(self, action: #selector(selectButton(_:)), for: .touchUpInside)
    }
    
    
    private func clearBorderBtn() {
        contentView.btnOne.layer.borderWidth = 0
        contentView.btnOne.layer.borderColor = UIColor.clear.cgColor
        contentView.btnOne.layer.cornerRadius = 32
        contentView.btnOne.setBackgroundImage(.imgQuizBtnDef, for: .normal)
        
        contentView.btnTwo.layer.borderWidth = 0
        contentView.btnTwo.layer.borderColor = UIColor.clear.cgColor
        contentView.btnTwo.layer.cornerRadius = 32
        contentView.btnTwo.setBackgroundImage(.imgQuizBtnDef, for: .normal)

        contentView.btnThree.layer.borderWidth = 0
        contentView.btnThree.layer.borderColor = UIColor.clear.cgColor
        contentView.btnThree.layer.cornerRadius = 32
        contentView.btnThree.setBackgroundImage(.imgQuizBtnDef, for: .normal)
        
        contentView.btnFour.layer.borderWidth = 0
        contentView.btnFour.layer.borderColor = UIColor.clear.cgColor
        contentView.btnFour.layer.cornerRadius = 32
        contentView.btnFour.setBackgroundImage(.imgQuizBtnDef, for: .normal)

    }
    
    @objc func goNextChapter() {
           if let selectedButton = selectedButton {
               let correctButton = contentView.btnOne
               if selectedButton == correctButton {
                   selectedButton.setBackgroundImage(.imgBtnQuizRight, for: .normal)
                   selectedButton.setTitleColor(.cDarkRed, for: .normal)
                   DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                       self.goNext()
                   }
               } else {
                   selectedButton.setBackgroundImage(.imgBtnQuizWrong, for: .normal)
                   DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                       Memory.shared.incorrectAnswer += 1
                       self.SorryYouLose()
                       
                   }
               }
           }
       }
    
    private func goNext() {
        print("Правильно")
        let vc = CorrectAnswerVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func SorryYouLose() {
        if Memory.shared.incorrectAnswer >= 2 {
            print("Modal GO home")
            presentModalView()
        } else {
            let vc = IncorrectAnswerVC()
            navigationController?.pushViewController(vc, animated: true)

        }
    }
    
    @objc func selectButton(_ sender: UIButton) {
         // Сбросить бордер для всех кнопок
         [contentView.btnOne, contentView.btnTwo, contentView.btnThree, contentView.btnFour].forEach {
             $0.layer.borderWidth = 0
             $0.layer.borderColor = UIColor.clear.cgColor
             $0.layer.cornerRadius = 32
         }
         
         // Установить бордер для выбранной кнопки
         sender.layer.borderWidth = 2
         sender.layer.borderColor = UIColor.white.cgColor
         sender.layer.cornerRadius = 32
         selectedButton = sender
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
                   contentView.labelContainerHeightConstraint?.update(offset: 166)
                   contentView.labelContainerBottomConstraint?.update(offset: -16)
               case 1:
                   contentView.labelContainerHeightConstraint?.update(offset: 144)
                   contentView.labelContainerBottomConstraint?.update(offset: -16)
               case 2:
                   contentView.labelContainerHeightConstraint?.update(offset: 144)
                   contentView.labelContainerBottomConstraint?.update(offset: -168)
               default:
                   break
               }
    }

    private func updateButtonsVisibility() {
        contentView.btnAnswer.isHidden = !isTrue
        contentView.btnOne.isHidden = !isTrue
        contentView.btnTwo.isHidden = !isTrue
        contentView.btnThree.isHidden = !isTrue
        contentView.btnFour.isHidden = !isTrue
        contentView.labelQuizCont.isHidden = !isTrue
        contentView.labelQuiz.isHidden = !isTrue
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
            if countText == textArray.count - 1 {
                isTrue = true
            }
            updateLabelAndText()
            updateButtonsVisibility()
        }
    }
    
    func presentModalView() {
            if fullScreenView == nil {
                fullScreenView = UIView(frame: self.view.bounds)
                fullScreenView!.backgroundColor = .black.withAlphaComponent(0.85)
                fullScreenView!.alpha = 0
                
            let viewConteiner = UIView()
                viewConteiner.backgroundColor = .clear
                fullScreenView!.addSubview(viewConteiner)
                
            let bgImage = UIImageView(image: .imgCountIncorrent)
                bgImage.contentMode = .scaleToFill
                viewConteiner.addSubview(bgImage)
                
    
            let titleLabel = UILabel()
                titleLabel.text = "Unfortunately,"
                titleLabel.font = .customFont(font: .mac, style: .regular, size: 48)
                titleLabel.textColor = .yellow
                titleLabel.numberOfLines = 0
                titleLabel.textAlignment = .center
                viewConteiner.addSubview(titleLabel)

                let subtitleLabelView = UILabel()
                subtitleLabelView.text = "you didn't answer the question correctly and couldn't move forward. Don't be discouraged, and give it another try."
                subtitleLabelView.font = .customFont(font: .ubuntuMono, style: .regular, size: 14)
                subtitleLabelView.numberOfLines = 0
                subtitleLabelView.textAlignment = .center
                viewConteiner.addSubview(subtitleLabelView)

            
            let backButton = UIButton()
                backButton.configureButton(withTitle: "Ok", font: .customFont(font: .mac, style: .regular, size: 20), titleColor: .cDarkRed, normalImage: .imgBtnSelect, highlightedImage: nil)
                backButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
                backButton.layer.shadowOpacity = 1
                backButton.layer.shadowRadius = 8
                backButton.layer.shadowOffset = CGSize(width: 0, height: 8)
                backButton.addTarget(self, action: #selector(tappedCloseBuy), for: .touchUpInside)
                fullScreenView!.addSubview(backButton)
    
            viewConteiner.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(40.autoSize)
                make.height.equalTo(392)
                make.width.equalTo(496)
            }
    
            bgImage.snp.makeConstraints { make in
                make.edges.equalToSuperview()
                }
                
            titleLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().offset(132)
            }
                
            subtitleLabelView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.width.equalTo(300)
                make.top.equalTo(titleLabel.snp.bottom).offset(8)
            }

            backButton.snp.makeConstraints { make in
                make.top.equalTo(subtitleLabelView.snp.bottom).offset(24)
                make.width.equalTo(240)
                make.height.equalTo(64)
                make.centerX.equalToSuperview()
                }
                
            self.view.addSubview(fullScreenView!)
            }
        UIView.animate(withDuration: 0.5, animations: {
            self.fullScreenView!.alpha = 1
        })
        }

    @objc func tappedCloseBuy() {
        UIView.animate(withDuration: 0.5, animations: {
            self.fullScreenView?.alpha = 0
        }) { _ in
            self.fullScreenView?.removeFromSuperview()
            self.fullScreenView = nil
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
