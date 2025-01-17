library(shiny)

ui <- fluidPage(
    selectInput('myselection',
                label='데이타세뜨',
                choices=c('iris','mtcars','sleep')),
    verbatimTextOutput('요야크'),
    tableOutput('떼이블')
)

server <- function (input,output) {
    output$요야크 <- renderPrint({
        dataset <- get(input$myselection,'package:datasets')
        summary(dataset)
    })
    output$떼이블 <- renderTable({
        dataset <- get(input$myselection,'package:datasets')
        dataset
    })
}

shinyApp(ui,server)

