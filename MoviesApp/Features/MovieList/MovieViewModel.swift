import UIKit
import Alamofire

class MovieViewModel {
  
  var title: String {
    if let date = movie.releaseDate {
      return movie.title + ", " + "(" + date + ")"
    }
    return movie.title
  }
  var overview: String {
    return movie.overview ?? "not set"
  }
  var date: String {
    return movie.releaseDate ?? "unowned"
  }
  var image: UIImage?
  
  private let movie: Movie
  
  init(with movie: Movie) {
    self.movie = movie
  }
  
  func loadImage(onSuccess: @escaping (UIImage?) -> Void) {
    guard image == nil else { onSuccess(image); return }
    guard let path = movie.imagePath else { return }
    
    let request = Alamofire.download("http://image.tmdb.org/t/p/w92" + path)
    request.responseData { [weak self] response in
      switch response.result {
      case .success(let data):
        self?.image = UIImage(data: data)
        onSuccess(self?.image)
      default:()
      }
    }
  }
}
