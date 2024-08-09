//
//  BaseVC.swift



import Foundation
import UIKit
import SnapKit

class BaseVC: UIViewController {
    
    
    var contentView: BaseView {
        view as? BaseView ?? BaseView()
    }
    
    override func loadView() {
        view = BaseView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateName()
        checkFotoLoad()
    }
    
    private func checkFotoLoad() {
        if let savedImage = getImageFromLocal() {
            print("Изображение успешно загружено")
            contentView.userImage.image = savedImage
            contentView.userImage.layer.borderWidth = 2
            contentView.userImage.layer.borderColor = UIColor.cYellow.cgColor
            contentView.userImage.layer.cornerRadius = 8
            contentView.userImage.clipsToBounds = true
        } else {
            print("Изображение не найдено в локальном хранилище")
        }
    }

    
    private func updateName() {
        contentView.userName.text = "Welcome, \(Memory.shared.userName ??  "User name!")"
    }
    
    private func selectBtn() {
        contentView.btnProfile.addTarget(self, action: #selector(goProfile), for: .touchUpInside)
        contentView.btnStart.addTarget(self, action: #selector(goStory), for: .touchUpInside)

    }
    
    @objc func goProfile() {
        let vc = ProfileVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goStory() {
        let vc = StoryBiginningVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func saveImageToLocal(image: UIImage) {
        let data = image.jpegData(compressionQuality: 1.0)
        let id = Memory.shared.userID
        let fileURL = getDocumentsDirectory().appendingPathComponent("\(id).png")
        do {
            try data?.write(to: fileURL)
            print("\(fileURL)")
        } catch {
            print("\(error)")
        }
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func getImageFromLocal() -> UIImage? {
        let id = Memory.shared.userID
        let fileURL = getDocumentsDirectory().appendingPathComponent("\(id).png")
        do {
            let data = try Data(contentsOf: fileURL)
            return UIImage(data: data)
        } catch {
            return nil
        }
    }

}
