protocol SearchView: IndicatorShowable, AlertShowable {
  func show(suggestions: [String])
}
