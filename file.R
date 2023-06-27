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
##sentiment scores using different sentiment lexicons
#syuzhet score
syu_score = get_sentiment(cleanedTxt, method = "syuzhet")
head(syu_score)
summary(syu_score)
#bing score
bing_score = get_sentiment(cleanedTxt, method = "bing")
head(bing_score)
summary(bing_score)
#afinn score
afinn_score = get_sentiment(cleanedTxt, method = "afinn")
head(afinn_score)
summary(afinn_score)
#nrc score
nrc_score = get_sentiment(cleanedTxt, method = "nrc")
head(nrc_score) 
summary(nrc_score)
##all scores matrix
comb_score = cbind(syu_score, bing_score, afinn_score, nrc_score)
all_methDf = as.data.frame(comb_score)
head(all_methDf)


##analysis


