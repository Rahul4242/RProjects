# require rJava ,NLP and openNLP,XML
#install.packages("openNLPmodels.en", repos = "http://datacube.wu.ac.at/", type = "source") 
library(RCurl)
library(XML)
library(rvest)
library(openNLP)
library(rJava)
library(NLP)

# Read string from website

url<- readline(prompt="Enter the url: ")
#url <- 'https://www.bharatplaza.com/'

#thepage <- readLines(url)


#e<- htmlTreeParse(thepage,useInternalNodes = T)
#c<-getNodeSet(e,"//ul//li")
#c1<-getNodeSet(e,"//address")
#c2<-getNodeSet(e,"//ul")
#s<- sapply(c,xmlValue)

s <- readLines(url)
#Extract email

a3.emails <- unlist(regmatches(s, gregexpr("([_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,4}))", s)))
#if(is.null(attributes(a3.emails)) == TRUE){a3.emails<-"not provided on site"}
cat("The email address' is/are :",a3.emails)

write(s,"ttt.txt")

#Extract rest (addres,phone number and business hours)



# Convert content to string  : requires library rJava, NLP and openNLP

sentence <- Maxent_Sent_Token_Annotator()
word <- Maxent_Word_Token_Annotator()
POS<- Maxent_POS_Tag_Annotator()

# Abstract details
a2 <- annotate(s, list(sentence,word))
a3<- annotate(s,POS,a2)

a3.address <- Maxent_Entity_Annotator(kind = "location")

##############

# Read and parse HTML file
doc.html = htmlTreeParse(thepage,useInternal = TRUE)

# Extract all the paragraphs (HTML tag is p, starting at
# the root of the document). Unlist flattens the list to
# create a character vector.
doc.text = unlist(xpathApply(doc.html, '//p', xmlValue))

# Replace all by spaces
doc.text = gsub('\n', ' ', doc.text)

# Join all the elements of the character vector into a single
# character string, separated by spaces
doc.text = paste(doc.text, collapse = ' ')






