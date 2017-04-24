enum RepositoryMockState<T> {
  case success, successWith(T), failure, empty, failWith(Error)
}
