//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import UIKit

 class ___VARIABLE_productName:identifier___Assembly {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func  create() -> ___VARIABLE_productName:identifier___ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(
            identifier: String(describing: ___VARIABLE_productName:identifier___ViewController.self)
        ) as? ___VARIABLE_productName:identifier___ViewController else {
            preconditionFailure("Cannot create ___VARIABLE_productName:identifier___ViewController")
        }

        let router = ___VARIABLE_productName:identifier___Router(navigationController: navigationController)
        let presenter = ___VARIABLE_productName:identifier___Presenter(view: viewController, router: router)
        viewController.presenter = presenter

        return viewController
    }
 }
