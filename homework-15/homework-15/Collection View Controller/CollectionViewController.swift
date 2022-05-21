import UIKit

class CollectionViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var collectionView : UICollectionView = {
        let layyout = UICollectionViewFlowLayout()
        layyout.scrollDirection = .horizontal
        
        layyout.minimumLineSpacing = 100
        layyout.minimumInteritemSpacing = 100
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layyout)
        view.contentInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        view.dataSource = self
        view.delegate = self
        view.register(CustomCollectionCell.self, forCellWithReuseIdentifier: CustomCollectionCell.customCellID)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button : UIButton = {
        let button = UIButton()
        button.setTitle("Scroll", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
   
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    // MARK: - Methods
    
    private func setup() {
        [collectionView, button].forEach {
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}



extension CollectionViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionCell.customCellID, for: indexPath)
        return cell
    }
    

}


extension CollectionViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 200, height: 200)
    }
}
