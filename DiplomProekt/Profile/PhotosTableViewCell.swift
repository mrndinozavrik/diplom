//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Валерий Климченко on 17.06.2023.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    private let whiteContentView: UIView = {
       let view = UIView()
//        view.backgroundColor = .red
        return view
    }()
    
    private let photosLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.font = .systemFont(ofSize: 18, weight: .bold, width: .standard)
        return label
    }()
     
    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    private var photoModel = PhotosModel.makePhotosModel()
    
    //MARK: life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        customiseCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customiseCollection() {
        photoCollectionView.backgroundColor = .cyan
    }
    
//MARK: private metods
    private func layout() {
        let safeArea = contentView
//        let inset: CGFloat = 8
//        let photoLabelInset: CGFloat = 12
//        let photoLabelHeight: CGFloat = 50
//        let photoLabelWidth: CGFloat = 300
        let photoCollectionViewHeight: CGFloat = 120

        [photoCollectionView].forEach { contentView.addSubview($0) }
        NSLayoutConstraint.activate([
            photoCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            photoCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            photoCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            photoCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
//            photoCollectionView.heightAnchor.constraint(equalToConstant: photoCollectionViewHeight)
        ])
        
    }
    
}

//MARK: UICollectionViewDataSource
extension PhotosTableViewCell: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.setupCell(photosModel: PhotosModel(photo: String(indexPath.row + 1)))
        return cell
    }


}

//MARK: UICollectionViewDelegateFlowLayout
extension UITableViewCell: UICollectionViewDelegateFlowLayout {

    private var insetMinimumInterItemSpasing: CGFloat { return 8 }
    private var insetForSection: CGFloat { return 8 }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 3 * insetMinimumInterItemSpasing - 2 * insetForSection) / 4
        return CGSize(width: width, height: width)
    }

    //расстояние между ячейками

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        insetMinimumInterItemSpasing
    }

    //отступы секции со всех сторон
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: insetForSection, left: insetForSection, bottom: insetForSection, right: insetForSection)
    }


    //расстояние между ячейками
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        insetMinimumInterItemSpasing
    }

}
