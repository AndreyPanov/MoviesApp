@testable import MoviesApp

class MovieBuilder {
  
  static func movie() -> Movie {
    return Movie(title: "test1", releaseDate: "05-03-1987", overview: "testtest", imagePath: "/wgwe.jpg")
  }
  
  static func movies() -> [Movie] {
    return [
      Movie(title: "test1", releaseDate: "05-03-1987", overview: "testtest1", imagePath: "/wgwe.jpg"),
      Movie(title: "test2", releaseDate: "05-03-1988", overview: "testtest2", imagePath: "/wgqwe.jpg"),
      Movie(title: "test3", releaseDate: "05-03-1989", overview: "testtest3", imagePath: "/wwgwe.jpg"),
      Movie(title: "test4", releaseDate: "05-03-1990", overview: "testtest4", imagePath: "/wegwe.jpg")
    ]
  }
}

extension Movie {
  
  init(title: String, releaseDate: String?, overview: String?, imagePath: String?) {
    self.title = title
    self.releaseDate = releaseDate
    self.overview = overview
    self.imagePath = imagePath
  }
}
