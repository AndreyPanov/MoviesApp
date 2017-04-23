protocol SearchView: IndicatorShowable, AlertShowable {
  func show(suggestions: [String])
  func showMovieList(with movies: [Movie])
}
