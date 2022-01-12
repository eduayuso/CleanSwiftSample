//
//  PostListViewController.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 11/1/22.
//

import UIKit

class PostListViewController:

    UICollectionViewController,
    PresentableView {
    
    let COLLECTION_VIEW_CELL_ID = "PostCollectionViewCell"

    typealias PresenterType = PostListPresenterProtocol
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    private var postList: [PostEntity] = []
    
    lazy var presenter: PostListPresenterProtocol = {
        
        var presenter = DIConfig.container.resolve(PostListPresenterProtocol.self)!
        presenter.listener = self
        return presenter
    }()
    
    /**
     * All subclasess of AppViewController must override this function to inject the presenter dependency
     */
    func injectPresenter() -> PostListPresenterProtocol {
        
        var presenter = DIConfig.container.resolve(PostListPresenterProtocol.self)!
        presenter.listener = self
        return presenter
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let cellId = COLLECTION_VIEW_CELL_ID
        let bundle = Bundle(for: type(of: self))
        let cellNib = UINib(nibName: cellId, bundle: bundle)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: cellId)
    }
    
    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)
        self.presenter.fetchPosts()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return postList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView.dequeueReusableCell(
            withReuseIdentifier: COLLECTION_VIEW_CELL_ID,
            for: indexPath
        ) as! PostCollectionViewCell
        
        let user = self.postList[indexPath.item]
        cell.fill(with: user)
        return cell
    }
}

extension PostListViewController: PostListEvents {
    
    func onPostListFetched(posts: [PostEntity]) {
        
        self.postList = posts
        self.collectionView.reloadData()
    }
    
    func onServerError(message: String) {
        
        let alert = UIAlertController(title: "Server error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
