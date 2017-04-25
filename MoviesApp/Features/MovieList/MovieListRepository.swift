class MovieListRepository: SearchRepository {
  
  func repeatLastSearch(onSuccess: @escaping ([Movie]) -> Void, onError: @escaping (String) -> Void) {
    guard let lastSearch = storage.getLastSuggestion() else { onError("not_found".localized); return  }
    searchMovies(with: lastSearch, onSuccess: onSuccess, onError: onError)
  }
}
