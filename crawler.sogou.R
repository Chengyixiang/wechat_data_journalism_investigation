#### 0919 crawler ####
RSelenium::checkForServer()
RSelenium::startServer()

remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4444,
                      browserName = "chrome")
remDr$open()

### test for DT
dt.data <- data.frame()
remDr$navigate("")
xxx.xpath <- c()

for (i in 1:length(xxx.xpath)) {
  webElem <- remDr$findElement(using = "css selector", xxx.xpath[i])
  webElem$clickElement()
  Sys.sleep(1)
  
  dt.url <- webElem$getCurrentUrl()[[1]]
  url <- read_html(dt.url)
  
  title <- html_nodes(url, "#activity-name") %>% html_text()
  date <- html_nodes(url, "#post-date") %>% html_text()
  author <- html_nodes(url, "#post-date+ .rich_media_meta_text") %>% html_text()
  organization <- html_nodes(url, "#post-user") %>% html_text()

  webElem.1 <- remDr$findElement(using = 'css selector', "#sg_readNum3")
  read <- webElem.1$getElementText()[[1]]
  webElem.2 <- remDr$findElement(using = 'css selector', "#sg_likeNum3") 
  like <- webElem.2$getElementText()[[1]]

  if (identical(author, character(0)) == F){
    dt.data.test <- data.frame(title = title, date = date, author = author, organization = organization, like =like, read = read)
  }else{
    dt.data.test <- data.frame(title = title, date = date, author = NA, organization = organization, like =like, read = read)
  }
  dt.data <- rbind(dt.data, dt.data.test)
  
  remDr$goBack()
  print(i)
  Sys.sleep(1)
}

write.csv(dt.data, "sougou_14.csv")
