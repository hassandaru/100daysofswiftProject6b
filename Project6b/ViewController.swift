//
//  ViewController.swift
//  Project6b
//
//  Created by Hassan Sohail Dar on 18/8/2022.
//

import UIKit

class ViewController: UIViewController {

    
    //practice for visual formatting language (VFL)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.backgroundColor = UIColor.red
        label1.text = "THESE"
        label1.sizeToFit()

        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = UIColor.cyan
        label2.text = "ARE"
        label2.sizeToFit()

        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.backgroundColor = UIColor.yellow
        label3.text = "SOME"
        label3.sizeToFit()

        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.backgroundColor = UIColor.green
        label4.text = "AWESOME"
        label4.sizeToFit()

        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.backgroundColor = UIColor.orange
        label5.text = "LABELS"
        label5.sizeToFit()

        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
        
        //////////////TECHNIQUE 1//////////////////
        
//        let viewsDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
//
//        for label in viewsDictionary.keys {
//            view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary))
//        }
        //technique with metrics passed Technique 1 still
//        let metrics = ["labelheight" : 88]
//        view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "V:|-(==40)-[label1(==labelheight)]-[label2(==labelheight)]-[label3(==labelheight)]-[label4(==labelheight)]-[label5(==labelheight)]-(>=10)-|", options: [], metrics: metrics, views: viewsDictionary))
        
        // technique 1 which is primitive
        
        //adding now priority from 1000 absolutely necessary to 999
        //also resizing label 2,3,4,5 to be like label1
//        let metrics = ["labelheight" : 88]
//        view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "V:|-(==40)-[label1(labelheight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-(>=10)-|", options: [], metrics: metrics, views: viewsDictionary))
        
        //////////////END OF TECHNIQUE 1//////////////////

        // now using anchors instead of to do the same more efficiently
        //Technique 2 is more widely used as its more efficient.
        ///////////////////TECNIQUE 2/////////////////////////
        var previous: UILabel?

        for label in [label1, label2, label3, label4, label5] {
            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            ///////my extra code added///////////////
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
            ///////my extra code added///////////////
            
            label.heightAnchor.constraint(equalToConstant: 88).isActive = true

            if let previous = previous {
                // we have a previous label – create a height constraint
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
            }else {
                // this is the first label
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }
            // set the previous label to be the current one, for the next loop iteration
            previous = label
        }
        ///////////////////TECNIQUE 2/////////////////////////

        //width anchor , height anchor, top anchor, bottom anchor
        //leading anchor, trailing anchor , centre edge anchor, left anchot
        //right anchor
        
        //completing challenges on end of Day

    }


}

