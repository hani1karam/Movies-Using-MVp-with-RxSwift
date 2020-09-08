//
//  RequestManager.swift
//  Movies Using MVp with RxSwift
//
//  Created by Hany Karam on 9/8/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import RxSwift

class RequestManager: APIClient {

func showMovies() -> Observable<ShowMoviesModel> {
    return request(AuthAPI.showMovies)
}
}
