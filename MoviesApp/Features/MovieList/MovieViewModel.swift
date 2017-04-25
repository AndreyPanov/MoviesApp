import UIKit
import Alamofire

class MovieViewModel {
  
  var title: String {
    if let date = date {
      return movie.title + ", " + "(" + date + ")"
    }
    return movie.title
  }
  var overview: String {
    return movie.overview ?? "not set"
  }
  var date: String? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    guard let date = formatter.date(from: movie.releaseDate ?? "") else { return nil }
    let components = Calendar.current.dateComponents([.year], from: date)
    if let year = components.year {
      return "\(year)"
    }
    return nil
  }
  var image: UIImage?
  
  private let movie: Movie
  
  init(with movie: Movie) {
    self.movie = movie
  }
  
  func loadImage(onSuccess: @escaping (UIImage?) -> Void) {
    guard image == nil else { onSuccess(image); return }
    guard let path = movie.imagePath else { return }
    print("Start load \(movie.title)")
    let request = Alamofire.download(URL.forImage + path)
    request.responseData { [weak self] response in
      switch response.result {
        case .success(let data):
          print("Finish load \(self!.movie.title)")
          self?.image = UIImage(data: data)
          onSuccess(self?.image)
        default:print("Fail load \(self!.movie.title)")
      }
    }
  }
}
