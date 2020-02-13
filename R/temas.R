#' Title
#'
#' @param base_size
#' @param base_family
#' @param base_line_size
#' @param base_rect_size
#'
#' @return
#' @importClassesFrom ggplot2 %+replace%
#' @export
#'
#' @examples
theme_esquema <- function(base_size = 11,
                          base_family = "",
                          base_line_size = base_size / 170,
                          base_rect_size = base_size / 170) {
  ggplot2::theme_bw(base_size = base_size,
           base_family = base_family,
           base_line_size = base_line_size,
           base_rect_size = base_rect_size) %+replace%
    ggplot2::theme(
      axis.ticks = element_blank(),
      axis.text = element_blank(),
      axis.title = element_blank(),
      panel.grid = element_blank()
    )
}

#' Title
#'
#' @param base_size
#' @param base_family
#' @param base_line_size
#' @param base_rect_size
#'
#' @return
#' @importClassesFrom ggplot2 %+replace%
#' @export
#'
#' @examples
theme_exemplo <- function(base_size = 11,
                          base_family = "",
                          base_line_size = base_size / 170,
                          base_rect_size = base_size / 170) {
  ggplot2::theme_minimal(base_size = base_size,
                base_family = base_family,
                base_line_size = base_line_size,
                base_rect_size = base_rect_size) %+replace%
    ggplot2::theme(
      plot.caption=element_text(size=12, hjust=0, vjust = 3),
      plot.title = element_text(color = "black", size = 18, face = "bold"),
      axis.text.x = element_text(face = "bold", size = 12),
      panel.grid.major.x = element_blank(),
      panel.grid.minor = element_blank()
    )
}
