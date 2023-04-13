# install.packages('quantmod')
library(quantmod)

symbolBasket <- c('AAPL', 'AMZN', 'BRK-B', 'SPY')
getSymbols(symbolBasket , src='yahoo')
summary(`BRK-B`)
BRKB <- as.xts(`BRK-B`)
names(BRKB)
names(BRKB) <- c("BRKB.Open"   ,  "BRKB.High"   ,  "BRKB.Low"   ,   "BRKB.Close"  ,  "BRKB.Volume",  "BRKB.Adjusted")
names(BRKB)


# plot the data
plot(BRKB$BRKB.Open)
lineChart(BRKB$BRKB.Open, line.type = 'h', theme = 'white', TA = NULL)
lineChart(BRKB, line.type = 'h', theme = 'white')
barChart(BRKB, bar.type = 'hlc', TA = NULL)
candleChart(BRKB, TA=NULL, subset = '2019')
candleChart(BRKB, TA=c(addMACD(),addVo()), subset = '2019')
candleChart(BRKB, TA=c(addMACD(),addADX()), subset = '2018-01::')
candleChart(BRKB , TA=c(addMACD()), subset = '2018-01::2018-05', theme = 'white')
candleChart(BRKB , TA=c(addMACD()), subset = '2019-01::', theme = chartTheme('white', up.col='green',dn.col='darkred'))
chartSeries(BRKB, 
            type = c("auto", "candlesticks"), 
            subset = '2019-01::',
            show.grid = TRUE,
            major.ticks='auto', minor.ticks=TRUE,
            TA=c(addMACD(),addVo()))
chartSeries(BRKB, 
            type = c("auto", "candlesticks"), 
            subset = '2018-01::',
            show.grid = TRUE,
            major.ticks='auto', minor.ticks=TRUE,
            multi.col = TRUE,
            TA=c(addMACD(),addVo()))