#' Aplicação para criar gráficos
#'
#' @return Um Shiny App
#' @export
#'
#' @examples
#' app_tema(list(host = "0.0.0.0", port = 1702L))
app_tema <- function(options = list()) {
  ui <- shiny::fluidPage(
    shiny::fluidRow(
      shiny::column(
        4, shiny::wellPanel(
          shiny::fileInput("arquivo", "Faça upload dos dados", buttonLabel = "Buscar..."),
          shiny::radioButtons(
            "tipo", "Escolha o tipo de gráfico", c("Linhas", "Barras"), inline = TRUE
          ),
          shiny::selectInput("x", "Escolha a variável do eixo X", c("")),
          shiny::selectInput("y", "Escolha a variável do eixo Y", c("")),
          shiny::selectInput("col", "Escolha a variável da cor", c("")),
          shiny::hr(),
          shiny::radioButtons(
            "tema", "Escolha um tema", c("Tema1", "Tema2"), inline = TRUE
          ),
          shiny::hr(),
          shiny::textInput("rodape", "Texto do rodapé")
        )
      ),
      shiny::column(
        8,
        shiny::plotOutput("grafico"),
        shiny::verbatimTextOutput("codigo")
      )
    )
  )

  server <- function(input, output, session) {

    shiny::observeEvent(input$arquivo, {
      dados <- readxl::read_excel(input$arquivo$datapath)

      shiny::updateSelectInput(session, "x", choices = names(dados))
      shiny::updateSelectInput(session, "y", choices = names(dados), selected = names(dados)[2])
      shiny::updateSelectInput(session, "col", choices = names(dados), selected = names(dados)[3])
    })

    output$grafico <- renderPlot({
      if (is.null(input$arquivo)) return({
        plot(0, 0, type = "n", frame.plot = FALSE, axes = FALSE, xlab = "", ylab = "")
        text(0, 0, "faça upload de um arquivo para \ngerar o gráfico", cex = 2)
      })

      dados <- readxl::read_excel(input$arquivo$datapath)
      gg <- ggplot2::ggplot(dados,
                            ggplot2::aes_string(input$x, input$y, col = input$col,
                                     fill = input$col))

      if (input$tipo == "Linhas") {
        gg <- gg +
          ggplot2::geom_point(size = 4) +
          ggplot2::geom_line(size = 1)
      } else {
        gg <- gg + ggplot2::geom_col(position = "stack")
      }

      gg <-  gg +
        ggplot2::labs(caption = paste0(input$rodape, "\nElaborado pelo DEE/CADE"))

      if (input$tema == "Tema1") {
        gg <- gg + theme_exemplo()
      } else {
        gg <- gg + theme_esquema()
      }

      gg
    })
  }

  shiny::shinyApp(ui, server, options = options)

}

