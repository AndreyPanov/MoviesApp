import Alamofire

class SearchRepository {
  
  let storage: Storage
  
  init(storage: Storage = .init()) {
    self.storage = storage
  }
  
  func getLastSearchResults(onSuccess: @escaping ([String]) -> Void) {
    onSuccess(storage.getSuggestions())
  }
  
  func searchMovies(with name: String, onSuccess: @escaping ([Movie]) -> Void, onError: @escaping (String) -> Void) {
    let requestString = "http://api.themoviedb.org/3/search/movie?api_key=2696829a81b1b5827d515ff121700838&query=" + name.trimmed
    Alamofire.request(requestString).responseJSON { [weak self] response in
      if let JSON = response.result.value as? [String: AnyObject],
        let jsonArray = JSON["results"] as? [[String: AnyObject]] {
        
        if let movies: [Movie] = Movie.deserialize(with: jsonArray), !movies.isEmpty {
          self?.storage.add(suggestion: name)
          onSuccess(movies)
          
        } else {
          onError("not_found".localized)
        }
      } else {
        onError("internet_fail".localized)
      }
    }
  }
}
