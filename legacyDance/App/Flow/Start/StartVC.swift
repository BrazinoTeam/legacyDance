//
//  StartVC.swift

import Combine
import Foundation
import UIKit
import SnapKit
import SwiftUI

class StartVC: UIViewController {
    
    
    private var loadignViewModel: StartViewModel = StartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loadingScreen = StartScreen(loadignViewModel: loadignViewModel)
        let hostingController = UIHostingController(rootView: loadingScreen)
        addChild(hostingController)
        hostingController.view.frame = self.view.frame
        self.view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animateProgressBar()
    }
    
    func animateProgressBar() {
        DispatchQueue.main.async {
            self.loadignViewModel.isAnimating = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.goToBase()
        }
    }
  
    func goToBase() {
         
                    let vc = BaseVC()
                    let navigationController = UINavigationController(rootViewController: vc)
                    navigationController.modalPresentationStyle = .fullScreen
                    present(navigationController, animated: true)
                    navigationController.setNavigationBarHidden(true, animated: false)
            }
}

    
   
