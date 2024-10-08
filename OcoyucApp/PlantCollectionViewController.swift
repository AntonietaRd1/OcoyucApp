//
//  PlantCollectionViewController.swift
//  OcoyucApp
//
//  Created by Administrador on 02/10/24.
//

import UIKit

class PlantCollectionViewController: UIViewController {
    
    let plantNames = ["Hortensia", "Rosa", "Gardenia",
                      "Clavel", "Tomate", "Tulipan",
                      "Violeta", "Orquidea", "Girasol", "Nardos"]
    
    @IBOutlet weak var collectionVIew: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionVIew.dataSource = self
    }
}

extension PlantCollectionViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plantNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "plantCell", for: indexPath) as! PlantCollectionViewCell
        //cell.backgroundColor = UIColor.blue
        cell.imageView.image = UIImage(named: "fotoprueba")
        cell.nameLbl.text = plantNames [indexPath.row]
        return cell
    }
    
    
}
