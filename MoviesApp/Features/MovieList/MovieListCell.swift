import UIKit
import TableKit

class MovieListCell: UITableViewCell, ConfigurableCell {
  
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  private weak var viewModel: MovieViewModel?
  
  func configure(with movie: MovieViewModel) {
    titleLabel.text = movie.title
    descriptionLabel.text = movie.overview
    viewModel = movie
    
    viewModel?.loadImage { [weak self] image in
      guard let image = image else { return }
      UIView.animate(withDuration: 0.3) {
        self?.posterImageView.image = image
      }
    }
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    viewModel = nil
  }
}
