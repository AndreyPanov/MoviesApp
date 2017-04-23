import UIKit
import TableKit

class MovieListCell: UITableViewCell, ConfigurableCell {
  
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  func configure(with movie: Movie) {
    titleLabel.text = movie.title
    descriptionLabel.text = movie.overview
    dateLabel.text = movie.releaseDate
  }
}
