protocol MovieListView: class, Presentable, Refreshable, AlertShowable {
  func show(movies: [MovieViewModel])
}
