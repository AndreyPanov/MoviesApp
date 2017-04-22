import Alamofire

class SearchRepository {
  
  init() {
    
  }
  
  func getLastSearchResults(onSuccess: @escaping ([Movie]) -> Void) {
    
  }
  
  func searchMovies(with name: String, onSuccess: @escaping ([Movie]) -> Void, onError: @escaping (String) -> Void) {
    //
    let lol = "http://api.themoviedb.org/3/search/movie?api_key=2696829a81b1b5827d515ff121700838&query=batman"
    Alamofire.request(lol).responseJSON { response in
      if let JSON = response.result.value as? [String: AnyObject],
        let jsonArray = JSON["results"] as? [[String: AnyObject]] {
        if let movies: [Movie] = Movie.deserialize(with: jsonArray), !movies.isEmpty {
          onSuccess(movies)
        } else {
          onError("not found")
        }
      } else {
        onError("try again")
      }
    }
  }
}
