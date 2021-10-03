//
//  ViewController.swift
//  eLegionHack
//
//  Created by Maxim Savchenko on 02.10.2021.
//

import UIKit
import SnapKit
import SwiftConfettiView

protocol PureChatInput: AnyObject {
    func updateModel(_ model: [CommonEntity], isClient: Bool)
    func updateModel(emojiModel: [CommonEntity])
}

final class PureChatVC: UIViewController, UITableViewDataSource, UITableViewDelegate, EnemyMessageDelegatable, UISearchBarDelegate {

    @IBOutlet weak var chatTableView: ChatTableView!
    
    private var currentHeight: CGFloat = 399
    private var initialCenter: CGPoint = .zero
    
    let confettiSwift = SwiftConfettiView()
    
    private lazy var blurView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .light)
        $0.effect = blur
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIVisualEffectView())
    
    private let pannableView: UIView = {
        
        let view = UIView(frame: CGRect(origin: .zero,
                                        size: CGSize(width: 200.0, height: 200.0)))

        view.backgroundColor = .white
        view.layer.cornerRadius = 16

        return view
    }()
    
    private let titleLabel: UILabel = {
        
        $0.text = "Эмодзи"
        $0.font = UIFont(name: "Roboto-Bold", size: 17)

        return $0

    }(UILabel())
    
    private lazy var collectionView: UICollectionView = {
        $0.backgroundColor = .white
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = .zero
        flowLayout.scrollDirection = .vertical
        
        $0.collectionViewLayout = flowLayout
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: .init()))
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var panelView: UIView!
    
    private lazy var emojiDataSource: EmojiDataSource = {
        $0.delegate = self
        return $0
    }(EmojiDataSource(emojiModel: []))
    
    lazy var searchBar: UISearchBar = UISearchBar()
    
    var model: [CommonEntity] = []
    var currentModel: EnemyMessageCellObject?
    var isOpen: Bool = false
    var presenter: PureChatPresenterInput!
    @IBOutlet weak var bottomConstraintHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        draw()
        registerCells()
        
        confettiSwift.frame = self.view.bounds
        confettiSwift.type = .confetti
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        addBackButton()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons-2").withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(tapToRightButton))
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9803921569, alpha: 1)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9803921569, alpha: 1)
        
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
        pannableView.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func tapToRightButton() {}
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            bottomConstraintHeight.constant -= keyboardSize.height - 35
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
        }
    }
    
    @IBAction func tapToResignKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
            bottomConstraintHeight.constant = 0
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = model[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: row.identifier, for: indexPath)
        
        (cell as? Setupable)?.setup(row)
        (cell as? Delegatable)?.delegate = self
        
        return cell
    }
    
    private func registerCells() {
        
        let spaceNib = UINib(nibName: "SpaceTableViewCell", bundle: nil)
        let emojiNib = UINib(nibName: "EmojiCollectionCell", bundle: nil)
        
        chatTableView.register(spaceNib, forCellReuseIdentifier: "SpaceTableViewCell")
        collectionView.register(emojiNib, forCellWithReuseIdentifier: "EmojiCollectionCell")
    }
    
    private func draw() {
        self.view.addSubview(collectionView)
        
        collectionView.delegate = emojiDataSource
        collectionView.dataSource = emojiDataSource
        
        pannableView.center = view.center
        view.addSubview(pannableView)
        view.bringSubviewToFront(pannableView)
        
        pannableView.addSubview(titleLabel)
        pannableView.addSubview(collectionView)
        pannableView.addSubview(searchBar)
        
        pannableView.snp.makeConstraints { maker in
            maker.bottom.leading.trailing.equalToSuperview()
            maker.height.equalTo(0)
        }
        
        searchBar.snp.makeConstraints { maker in
            maker.top.equalTo(pannableView.snp.top).offset(10)
            maker.leading.equalTo(pannableView.snp.leading).offset(15)
            maker.trailing.equalTo(pannableView.snp.trailing).inset(15)
        }
        
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalTo(searchBar.snp.bottom).offset(24)
            maker.leading.equalTo(pannableView.snp.leading).offset(15)
        }
        
        collectionView.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel.snp.bottom).offset(15)
            maker.leading.equalTo(pannableView.snp.leading).offset(10)
            maker.trailing.equalTo(pannableView.snp.trailing).inset(10)
            maker.height.equalTo(500)
        }
        
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "Нажмите для поиска..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
    }
    
    func tapToMessage(model: EnemyMessageCellObject) {
        currentModel = model
        showOrClosePanView()
    }
    
    @objc private func didPan(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
            case .began:
                initialCenter = pannableView.center
            case .changed:
                let translation = sender.translation(in: view)
                
                let positiveHeight = currentHeight + (translation.y * -1)
                
                self.pannableView.snp.updateConstraints { maker in
                    maker.height.equalTo(round(positiveHeight))
                }

            case .ended,
                 .cancelled:
                
                findNearestPoint(pannableView.bounds.height)
                
            default:
                break
            }
    }
    
    private func showOrClosePanView() {
        
        if isOpen == false {
        
        UIView.animate(withDuration: 0.3) {
            self.pannableView.snp.updateConstraints { maker in
                maker.height.equalTo(399)
            }
            self.pannableView.superview?.layoutIfNeeded()
        }
            
        isOpen = true
            
        } else {
            
            UIView.animate(withDuration: 0.3) {
                self.pannableView.snp.updateConstraints { maker in
                    maker.height.equalTo(0)
                }
                self.pannableView.superview?.layoutIfNeeded()
            }
            isOpen = false
        }
        
    }
    
    func findNearestPoint(_ translation: CGFloat) {
        
        let topPoint = UIScreen.main.bounds.height - 60
        let middlePoint: CGFloat = 399
        let startPoint = 0
        
        let differenceTop = topPoint - translation
        let differenceMiddle = translation - middlePoint
        
        print("Top", differenceTop)
        print("Middle", differenceMiddle)
        print("result", differenceTop > differenceMiddle)
        
        if differenceTop < differenceMiddle {
            
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [.curveEaseInOut]) {
                            self.pannableView.snp.updateConstraints { maker in
                                maker.height.equalTo(topPoint)
                            }
                            
                            self.currentHeight = topPoint
                            self.pannableView.superview?.layoutIfNeeded()
                        }
        } else if translation >= middlePoint / 2 {
            
            
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [.curveEaseInOut]) {
                            self.pannableView.snp.updateConstraints { maker in
                                maker.height.equalTo(middlePoint)
                            }
                
                            self.currentHeight = middlePoint
                            self.pannableView.superview?.layoutIfNeeded()
                        }
            
            
        } else if translation < middlePoint / 2 {
            
            UIView.animate(withDuration: 0.2) {
                        } completion: { ended in
                            if ended {
                                UIView.animate(withDuration: 0.3) {
                                    self.pannableView.snp.updateConstraints { maker in
                                        maker.height.equalTo(0)
                                    }
                                    self.currentHeight = middlePoint
                                    self.pannableView.superview?.layoutIfNeeded()
                                }
                                self.isOpen = false
                            }
                        }
            
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
    
    @IBAction func didTapToSend(_ sender: Any) {
        if !(textView.text.isEmpty) {
            presenter.sendMessage(with: textView.text)
            scrollToBottom()
            textView.text = ""
        }
    }
    
    func scrollToBottom() {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.model.count-1, section: 0)
            self.chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    func animateTable(tblVW: UITableView, isClientMessage: Bool) {
        
        tblVW.reloadData()

        var cells = tblVW.visibleCells
        let tableWidth: CGFloat = tblVW.bounds.size.width

        cells.removeFirst()
        
        for i in cells {
            let cell: UITableViewCell = i
            let width = isClientMessage == true ? tableWidth : -tableWidth
            cell.transform = CGAffineTransform(translationX: width, y: 0)
        }

        var index = 0

        for a in cells {
            let cell: UITableViewCell = a
            UIView.animate(withDuration: 0.7, delay: 0.05 * Double(index), options: .allowAnimatedContent, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            index += 1
        }
    }
    
}

extension PureChatVC: EmojiDataSourceDelegatable {
    
    func didTapToEmoji(emoji: String, indexPath: IndexPath) {
        currentModel?.titleOfEmoji = emoji
        
        guard let currentModel = self.currentModel else { return }
        
        model.enumerated()
            .forEach { index, entity in
            if currentModel.title == (entity as? EnemyMessageCellObject)?.title {
                model.remove(at: index)
                model.insert(currentModel, at: index)
            }
        }
        
        showOrClosePanView()
        
        chatTableView.reloadData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) { [weak self] in
            guard let `self` = self else { return }
            self.view.addSubview(self.confettiSwift)
            self.confettiSwift.startConfetti()
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MatchVC") as! MatchVC
            self.modalPresentationStyle = .overCurrentContext
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .crossDissolve
            
            self.present(vc, animated: true, completion: nil)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.confettiSwift.startConfetti()
            }
        }
    }
    
}

extension PureChatVC: PureChatInput {
    
    func updateModel(_ model: [CommonEntity], isClient: Bool) {
        if isClient {
            self.model = model
            chatTableView.insertRows(at: [IndexPath(row: model.count - 1, section: 0)], with: .right)
        } else {
            self.model = model
            animateTable(tblVW: chatTableView, isClientMessage: false)
        }
    }
    
    func updateModel(emojiModel: [CommonEntity]) {
        emojiDataSource.updateModel(model: emojiModel)
        collectionView.reloadData()
    }
    
}

extension UIViewController {

    func addBackButton() {
        let btnLeftMenu: UIButton = UIButton()
        let image = #imageLiteral(resourceName: "icons-1")
        btnLeftMenu.setImage(image, for: .normal)
        btnLeftMenu.sizeToFit()
        btnLeftMenu.addTarget(self, action: #selector (backButtonClick(sender:)), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        self.navigationItem.leftBarButtonItem = barButton
    }

    @objc func backButtonClick(sender : UIButton) {
        self.navigationController?.popViewController(animated: true);
    }
}
