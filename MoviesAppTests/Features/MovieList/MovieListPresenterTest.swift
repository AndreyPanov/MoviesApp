import XCTest
import Mockit
@testable import MoviesApp

class MovieListPresenterTest: XCTestCase {
    
  var presenter: MovieListPresenter!
  var view: MovieListViewMock!
  var repository: MovieListRepositoryMock!
  
  override func setUp() {
    super.setUp()
    
    view = MovieListViewMock(with: self)
    repository = MovieListRepositoryMock(with: self)
    presenter = MovieListPresenter(view: view, movies: MovieBuilder.movies(), repository: repository)
  }
  
  override func tearDown() {
    
    view = nil
    repository = nil
    presenter = nil
    super.tearDown()
  }
  
  func testOnViewDidLoad() {
    let viewModels = MovieBuilder.movies().map { MovieViewModel(with: $0) }
    
    presenter.onViewDidLoad()
    
    verify(view).show(movies: viewModels)
  }
  
  func testOnRefreshWithSuccess() {
    let viewModels = MovieBuilder.movies().map { MovieViewModel(with: $0) }
    repository.state = .success
    
    presenter.onRefresh()
    
    verify(repository).repeatLastSearch(onSuccess: { _ in }, onError: { _ in })
    verify(view).show(movies: viewModels)
    verify(view).endRefreshing()
  }
  
  func testOnRefreshWithFail() {
    repository.state = .failure
    
    presenter.onRefresh()
    
    verify(repository).repeatLastSearch(onSuccess: { _ in }, onError: { _ in })
    verify(view).endRefreshing()
    verify(view).show(message: "error")
  }
}
