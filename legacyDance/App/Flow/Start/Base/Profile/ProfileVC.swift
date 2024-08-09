//
//  ProfileVC.swift

import Foundation
import UIKit
import SnapKit
import MessageUI
import StoreKit

class ProfileVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    private let appID = "123456789"
    private let emailDev = "developer@example.com"
    private let imagePicker = UIImagePickerController()
    private let ud = Memory.shared
    private var isTextFieldTapped = false

    private let images: [UIImage] = [.imgAchiTiger1, .imgAchiTiger2, .imgAchiTiger3, .imgAchiTiger4, .imgAchiTiger5, .imgAchiTiger6, .imgAchiTiger7, .imgAchiTiger8, .imgAchiTiger9, .imgAchiTiger10]
    private let titles: [String] = ["First Step", "Mountain Climber", "Raft Builder", "Symbol Finder", "Riddle Master", "Guardian's Challenge", "Fear Conqueror", "Doubt Destroyer", "Anger Manager", "Temple Visitor"]
    private let subtitles: [String] = ["Complete the first story chapter", "Reach the peak of Longshan Mountains", "Successfully build a raft to cross the river", "Find all three hidden tiger symbols", "Solve the riddle on the cliff", "Meet the guardian of the tiger's spirit", "Overcome the Trial of Fear", "Overcome the Trial of Doubt", "Overcome the Trial of Anger", "Reach the Temple of the Tiger Spirit"]

    
    var contentView: ProfileView {
        view as? ProfileView ?? ProfileView()
    }
    
    override func loadView() {
        view = ProfileView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerDelegate()
        selectBtn()
        setupTableView()
        checkFotoLoad()
    }
    
    private func pickerDelegate() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
    }
    
    private func selectBtn() {
        contentView.btnBack.addTarget(self, action: #selector(backNavigate), for: .touchUpInside)
        contentView.btnRateUs.addTarget(self, action: #selector(tappedRateUs), for: .touchUpInside)
        contentView.btnWriteUS.addTarget(self, action: #selector(tappedWriteUs), for: .touchUpInside)
        contentView.btnUserPhoto.addTarget(self, action: #selector(takePhotoUser), for: .touchUpInside)
        contentView.btnInfo.addTarget(self, action: #selector(goInfo), for: .touchUpInside)
        contentView.editBtn.addTarget(self, action: #selector(tappeUpdateName), for: .touchUpInside)

    }
    
    private func checkFotoLoad() {
        if let savedImage = getImageFromLocal() {
            print("Изображение успешно загружено")
            contentView.btnUserPhoto.setImage(savedImage, for: .normal)
            contentView.btnUserPhoto.layer.borderWidth = 2
            contentView.btnUserPhoto.layer.borderColor = UIColor.cYellow.cgColor
            contentView.btnUserPhoto.layer.cornerRadius = 8
            contentView.btnUserPhoto.clipsToBounds = true
        } else {
            print("Изображение не найдено в локальном хранилище")
        }
    }
    
    @objc func tappeUpdateName() {
        if contentView.editBtn.backgroundImage(for: .normal) == UIImage(named: "doneBtn") {
            view.endEditing(true)
            isTextFieldTapped = false
            contentView.editBtn.setBackgroundImage(UIImage(named: "editBtn"), for: .normal)
        } else {
            contentView.profileTextField.becomeFirstResponder()
            contentView.editBtn.setBackgroundImage(UIImage(named: "doneBtn"), for: .normal)
            isTextFieldTapped = true
        }
    }
    
    @objc func takePhotoUser() {
        let alert = UIAlertController(title: "Select source", message: nil, preferredStyle: .actionSheet)
        
        let actionLibrary = UIAlertAction(title: "Gallery", style: .default) { _ in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { _ in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            } else {
                print("Camera Faild")
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(actionCamera)
        alert.addAction(actionLibrary)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    @objc func goInfo() {
        let vc = InfoVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backNavigate() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupTableView() {
         contentView.achivTableView.dataSource = self
         contentView.achivTableView.delegate = self
     }
    
    @objc func tappedRateUs() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: windowScene)
        } else {
            if let url = URL(string: "itms-apps://itunes.apple.com/app/id\(appID)?action=write-review") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }


    
    @objc func tappedWriteUs() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([emailDev])
            mail.setSubject("Feedback on Legacy Dance")
            mail.setMessageBody("<p>Dear Developer,</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Mail services are not available", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
    
    // MARK: - MFMailComposeViewControllerDelegate
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

extension ProfileVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AchivCell.reuseId, for: indexPath) as? AchivCell else {
            return UITableViewCell()
        }
        
        cell.achivImage.image = images[indexPath.row]
        cell.titleLabel.text = titles[indexPath.row]
        cell.subTitleLabel.text = subtitles[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return AchivHeader()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 58
    }
}

extension ProfileVC: UIImagePickerControllerDelegate {
    
    func saveImageToLocal(image: UIImage) {
        let data = image.jpegData(compressionQuality: 1.0)
        let id = ud.userID
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
        let id = ud.userID
        let fileURL = getDocumentsDirectory().appendingPathComponent("\(id).png")
        do {
            let data = try Data(contentsOf: fileURL)
            return UIImage(data: data)
        } catch {
            return nil
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            contentView.btnUserPhoto.setImage(image, for: .normal)
            saveImageToLocal(image: image)
            checkFotoLoad()
        }
        dismiss(animated: true, completion: nil)
    }
  
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        checkFotoLoad()
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileVC: UINavigationControllerDelegate {}
