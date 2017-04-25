protocol SearchView: IndicatorShowable, AlertShowable, Presentable {
  
  var onMoviesSelected: (([Movie]) -> Void)? { get set }
  
  func show(suggestions: [String])
}
