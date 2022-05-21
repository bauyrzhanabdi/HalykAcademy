import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    static let customCellID = "CustomCell"
    
    // MARK: - Views
    private lazy var customImageView : UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleToFill
        view.image = UIImage(named: "mas")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var customLabel : UILabel = {
        let label = UILabel()
        label.text = "Hallelujah"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Methods
    
    private func setup() {
        [customImageView, customLabel].forEach {
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            customImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customImageView.widthAnchor.constraint(equalToConstant: 50),
            customImageView.heightAnchor.constraint(equalToConstant: 150),
            customImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            customLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 10),
            customLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            customLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
