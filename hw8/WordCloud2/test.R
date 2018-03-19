library(XML)
library(RCurl)
library(tm)
library(wordcloud)
library(readtext)
setwd("C:\\Users\\Yao\\Desktop\\test")

mydata = readtext("test.txt")
mydata

library(tm)

mydata <- Corpus(VectorSource(mydata))
mydata = tm_map(mydata, content_transformer(tolower))
mydata = tm_map(mydata, removePunctuation)
mydata = tm_map(mydata, removeWords, stopwords("english"))
mydata
mydata[[1]]$content
write(mydata[[1]]$content, file = "data.txt")

