library("NLP")
library("tm")
library("SnowballC")
library("stringr")
library("syuzhet")

#read in reviews for analysis
rev = read.csv(file.choose(), sep = ",", header = F)
form =  as.matrix(rev)
tail(form)

##text cleaning

form = str_remove_all(form,"[[:punct:]]")
form = tolower(form)
form = removeNumbers(form)
stopwords= c( "a", "an", "and", "the", "in", "on", "is", "are", "it", "of", "to", "that", "this", "for", "with", "as", "at", "by", "from", "or", "you", "your", "I", "me", "he", "she", "we", "they", "can", "will", "should", "could", "would", "has", "have", "had", stopwords(("en")))
form = removeWords(form, stopwords)             
form = stripWhitespace(form)
form=  wordStem(form)

cleanedTxt = form
head(cleanedTxt)

syu_score = get_sentiment(cleanedTxt, method = "syuzhet")
head(syu_score)
summary(syu_score)
