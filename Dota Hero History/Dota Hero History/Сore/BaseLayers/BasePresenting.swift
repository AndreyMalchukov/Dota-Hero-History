//
//  BasePresenting.swift
//  Dota Hero History
//
//  Created by Andrey on 30/01/2023.
//  Copyright © 2023 AndreyTeam. All rights reserved.
//

protocol BasePresenting: AnyObject {
    func viewDidLoad()
    func viewDidLayoutSubviews()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    func showLoader()
    func hideLoader()
}

extension BasePresenting {
    func viewDidLoad() {}
    func viewDidLayoutSubviews() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
    func showLoader() {}
    func hideLoader() {}
}
