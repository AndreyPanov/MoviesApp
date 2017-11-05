protocol MovieListView: Presentable, Refreshable, AlertShowable {
  func show(movies: [MovieViewModel])
}
