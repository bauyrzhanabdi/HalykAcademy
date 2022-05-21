import UIKit


class FavoritesViewCell: UITableViewCell {
    
    static let cellID = "FavoritesCell"
    
    // MARK: - Views
    private var iconType : String = "heart.fill"
    
    private lazy var button : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: iconType), for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setup() {
        [button].forEach {
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    @objc private func buttonDidTap(_ sender : UIButton) {
        switch iconType {
        case "heart.fill":
            iconType = "suit.heart"
        case "suit.heart":
            iconType = "heart.fill"
        default:
            break
        }

        button.setImage(UIImage(systemName: iconType), for: .normal)
        
        
    }
}
