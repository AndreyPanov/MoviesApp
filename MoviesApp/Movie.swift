import Unbox

struct Movie: Unboxable {
  let title: String
  let releaseDate: String?
  let overview: String?
  let imagePath: String?
  
  init(unboxer: Unboxer) throws {
    title = try unboxer.unbox(key: "title")
    releaseDate = try? unboxer.unbox(key: "release_date")
    overview = try? unboxer.unbox(key: "overview")
    imagePath = try? unboxer.unbox(key: "backdrop_path")
  }
  
  static func deserialize(with jsonArray: [[String: AnyObject]]) -> [Movie]? {
    return try? unbox(dictionaries: jsonArray, allowInvalidElements: true)
  }
}
