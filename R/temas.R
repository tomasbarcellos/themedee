#' Title
#'
#' @param base_size Tamanho base da fonte
#' @param base_family Família base da fonte
#' @param base_line_size Tamanho base para elementos de linha
#' @param base_rect_size Tamanho base para elementos de retângulos
#'
#' @return Um objeto ggplot
#' @importFrom ggplot2 %+replace%
#' @name temas
#' @rdname temas
#' @export
#'
#' @examples
#' library(ggplot2)
#' g <- ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width)) +
#'   geom_point(aes(color = Species))
#' g + theme_esquema()
#' g + theme_exemplo()
theme_esquema <- function(base_size = 11, base_family = "",
                          base_line_size = base_size / 170,
                          base_rect_size = base_size / 170) {
  ggplot2::theme_bw(base_size = base_size,
           base_family = base_family,
           base_line_size = base_line_size,
           base_rect_size = base_rect_size) %+replace%
    ggplot2::theme(
      plot.caption = ggplot2::element_text(size=12, hjust=0, vjust = 3),
      axis.ticks = ggplot2::element_blank(),
      axis.text = ggplot2::element_blank(),
      axis.title = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank()
    )
}

#' @rdname temas
#' @export
theme_exemplo <- function(base_size = 11, base_family = "",
                          base_line_size = base_size / 170,
                          base_rect_size = base_size / 170) {
  ggplot2::theme_minimal(base_size = base_size,
                base_family = base_family,
                base_line_size = base_line_size,
                base_rect_size = base_rect_size) %+replace%
    ggplot2::theme(
      plot.caption = ggplot2::element_text(size=12, hjust=0, vjust = 3),
      plot.title = ggplot2::element_text(color = "black", size = 18, face = "bold"),
      axis.text.x = ggplot2::element_text(face = "bold", size = 12),
      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank()
    )
}
