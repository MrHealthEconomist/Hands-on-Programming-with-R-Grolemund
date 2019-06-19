setwd("/Users/joshuamusson/Desktop/Data_Analytics/Rstudio/Data sets/Intro_to_R")
die <- 1:6
 ls()

 mean(1:6) 
 mean(die) 
round(mean(die)) 


sample(x = 1:4, size = 2)
sample(x = die, size = 1)
args(sample)
args(factorial)
args(sample)
round(3.1416, digits = 2)


sample(die, size = 2, replace = TRUE)


dice <- sample(die, size = 2, replace = TRUE)
dice
sum(dice)
dice
dice
roll()

roll <- function() {
  die <- 1:6
  dice <- sample(x = die, size = 2, replace = TRUE)
  sum(dice)
}

roll.V2 <- function(bones = 1:6) {
  die <- 1:6
  dice <- sample(x = bones, size = 2, replace = TRUE)
  sum(dice)
}

roll.V2()

library("ggplot2")

x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
x

y<-x^3
y

qplot(x, y)


x <- c(1, 2, 2, 2, 3, 3)
qplot(x, binwidth = 1)

x2<-c(1,1,1,1,1,2,2,2,2,3,3,4)
qplot(x2, binwidth = 1)

x3<-c(0,1,1,2,2,2,3,3,4)
qplot(x3, binwidth = 1)

roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE, 
                 prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  sum(dice)
}

rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)

is.vector(die)
is.atomic(die)

int <- 1L
text <- "ace"

int <- c(1L, 5L)
text <- c("ace", "hearts")

die <- c(1, 2, 3, 4, 5, 6)

 typeof(die)
 typeof(int) 
 
 royal_flush <- c("ace", "king", "queen", "jack", "ten")
 royal_flush

 typeof(royal_flush)

 names(die) 

 names(die) <- c("one", "two", "three", "four", "five", "six")

 names(die) 
attributes(die) 
die

names(die) <- NULL
die

dim(die) <- c(2, 3)
die

dim(die) <- c(3, 2)
die

dim(die) <- c(1, 2, 3)
die

#Creating a matrice of values from a stored vector
matrice_test <- matrix(die, nrow = 2)
matrice_test

#Here, I define the numbers of rows and columns
matrice_test <- matrix(die, nrow = 2, ncol = 2)
matrice_test

#If you set your byrow argument set to TRUE, you can fill the matric row by row
#instead of column by column
matrice_test <- matrix(die, nrow = 2, byrow = TRUE)
matrice_test


ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3))
ar

#Create the following matrix, which stores the name and suit of every card in a royal flush.
##      [,1]    [,2]
## [1,] "ace"   "spades"
## [2,] "king"  "spades"
## [3,] "queen" "spades"
## [4,] "jack"  "spades"
## [5,] "ten"   "spades"

hand1 <- c("ace", "king,", "queen", "jack", "ten", "spades", "spades", 
           "spades", "spades", "spades")
#You can now turn the vector into a matrice using any of the following three commands
matrix(hand1, nrow = 5)
matrix(hand1, nrow = 2)
dim(hand1) <- c(5, 2)
dim(hand1)
hand1

#In this case, you will need to ask R to fill the matrix row by row instead of column by column:
hand2 <- c("ace", "king", "queen", "jack", "ten", "spades", 
           "spades", "spades", "spades", "spades")

matrix(hand2, nrow = 5, byrow = TRUE)
matrix(hand2, nrow = 2, byrow = TRUE)


dim(die) <- c(2, 3)
typeof(die)

class(die)
class(royal_flush)
class(matrice_test)
class(roll())
class(roll.V2())

now <- Sys.time()
now
class(now)

#You can see this vector by removing the class attribute of now, or by using the un class function, 
#which does the same thing:
unclass(now)

#Below, we create a factor. Factor's are R's way of creating categorical information, e.g. ethnicity or eye colour.
#To make a factor, pass an atomic vector into the factor() function.  R recodes the the data in the vector as integers.
gender <- factor(c("male", "female", "female", "male"))
typeof(gender)
attributes(gender)

#You can convert a factor to a character string with the as.character() function
as.character(gender)

as.character(1)
as.logical(1)
as.numeric(FALSE)


#Lists are like atomic vectors because they group data into a one-dimensional set. How‐ ever, 
#lists do not group together individual values; lists group together R objects, such as 
#atomic vectors and other lists.


list1 <- list(100:130, "R", list(TRUE, FALSE))
list1
#Lists are a basic type of object in R, on par with atomic vectors. Like atomic vectors, 
#they are used as building blocks to create many more spohisticated types of R objects.

#Let's create a card, using the list() vector
card <- list("ace", "hearts", 1)
card
#We could do this for every card in a deck, by creatin 52 sublists of a card pack.  However,
#this is inefficient and unpractical for dealing with large data sets.  Therefore, we can use a data frame.

#Data frames are the two-dimensional version of a list. They are far and away the most useful
#storage structure for data analysis, and they provide an ideal way to store an entire deck of cards. 
#You can think of a data frame as R’s equivalent to the Excel spreadsheet because it stores data in a similar format.
#Data frames group vectors together into a two-dimensional table. Each vector becomes a column in the table. 
#As a result, each column of a data frame can contain a different type of data; but within a column, 
#every cell must be the same type of data.

df <- data.frame(face = c("ace", "two", "six"), suit = c("clubs", "clubs", "clubs"),
                 value = c(1, 2, 3))
df

typeof(df)
class(df)
str(df)

#Notice that R saved your character strings as factors. I told you that R likes factors! It is not a very big deal 
#here, but you can prevent this behavior by adding the argument stringsAsFactors = FALSE to data.frame:

df <- data.frame(face = c("ace", "two", "six"), suit = c("clubs", "clubs", "clubs"),
                 value = c(1, 2, 3), stringsAsFactors = FALSE)
df
str(df)
#Now, card names and suit are stored as characters rather than factors.


#We could write out a whole data set for a pack of cards using data frame.  This would be tedious.
#Let's turn to loading a data set.

deck <- read.csv("~/Desktop/Data_Analytics/Rstudio/Data sets/Intro_to_R/deck.csv", stringsAsFactors=FALSE)
View(deck)

head(deck)
tail(deck)

#Now let's save this csv. file.
write.csv(deck, file = "cards.csv", row.names = FALSE)
#This will save the data.frame file to your working directory.
#To view your working directory path:
getwd()
#You can also set your working dirctory with:
#setwd()

#To extract a value or set of values from a data frame, write the data frame’s name 
#followed by a pair of hard brackets. R will use the first index to subset the rows
#of the data frame and the second index to subset the columns:
head(deck)
deck[1,1]
#To extract more than one value, use a vector of positive integers.
deck[1, c(1, 2, 3)]
#or
deck[1, 1:3]
#You can then save this new set to an R object with R’s assignment operator:
newdeck <- deck[1, 1:3]
newdeck
#if you select a single column, R will return a vector. If you would prefer 
#a data frame instead, you can add the optional argument drop = FALSE between the brackets:  
deck[1:2, 1, drop = FALSE]
#R will return every element except the elements in a negative index. For example:
deck[-1, 1:3]
#This will return everything BUT the first row.
#Negative integers are a more efficient way to subset than positive integers if you want to 
#include the majority of a data frame’s rows or columns.

#Let's make a deal function:
deal <- function(cards) {
  cards[1, ]
}

deal(deck)
#The function does exactly what you want: it deals the top card from your data set. 
#However, the function becomes less impressive if you run deal over and over again,
#as it returns the same value.  We need to make it deal a new card every time.
#First let's learn how to shuffle the deck.

#First, extract every row in the data frame:
deck2 <- deck[1:52, ]
head(deck2)
#If you want the rows to come in a random order, then you need to sort the integers 
#from 1 to 52 into a random order and use the results as a row index. How could you 
#generate such a random collection of integers? With our friendly neighborhood sample function:
random <- sample(1:52, size = 52)
random

#Therefore, create an object using the random object
deck4 <- deck[random, ]
head(deck4)
#Now the new set is truly shuffled. You’ll be finished once you wrap these steps into a function.
#Use the preceding ideas to write a shuffle function. shuffle should take a data frame and return 
#a shuffled copy of the data frame.

shuffle <- function(cards) {
  random <- sample(1:52, size = 52)
  cards[random, ]
}

#Now you can shuffle your cards between each deal:
deal(deck)
deck2 <- shuffle(deck)
deal(deck2)
deck3 <- shuffle(deck2)
deal(deck3)


#You can extract values from data frames and lists with the $ syntax.
deck$value
# From time to time, you’ll want to run a function like mean or median on the values in a variable. 
mean(deck$value)
median(deck$value)
#You can use the same $ notation with the elements of a list, if they have names. This notation has 
#an advantage with lists, too. If you subset a list in the usual way, R will return a new list that 
#has the elements you requested. This is true even if you only request a single element.
#To see this, first make a list:
lst <- list(numbers = c(1, 2), logical = TRUE, strings = c("a", "b", "c"))
#It would be horrible if once you stored a vector in a list, you could only ever get it back as a list.
#When you use the $ notation, R will return the selected values as they are, with no list structure around 
#them:
lst$numbers
lst$logical  
lst$strings
#You can then immediately feed the results to a function:
sum(lst$numbers)
#If the elements in your list do not have names (or you do not wish to use the names), you can use two 
#brackets, instead of one, to subset the list.
lst[[1]]
#This will do the same operation as the $ operator.

#================================================Chapter 5==================================================
#Start by making a copy of deck that you can manipulate:
deck2 <- deck

#You can use R’s notation system to modify values within an R object.
#For example:
vec <- c(0, 0, 0, 0, 0, 0)
vec
vec[1]
vec[1] <- 1000
vec[1]

#You can replace multiple values at once as long as the number of new values equals 
#the number of selected values:
vec[c(1, 3, 5)] <- c(1, 1, 1)
vec
#You can also create values that do not yet exist in your object. R will expand 
#the object to accommodate the new values:
vec[7] <- 77
vec

#This provides a great way to add new variables to your data set:
deck$new <- 1:52
head(deck)
#You can also remove columns from a data frame (and elements from a list) 
#by assigning them the symbol NULL:
deck$new <- NULL
head(deck, 13)

#To play war, you just need to change the values of your aces from 1 to 14.
deck2$value[c(13, 26, 39, 52)] <- 14
head(deck2, 13)

#However, to be more efficient, why not ask R to find all the aces for you? What if you
#didnt know in which position your points were?

#########################Logical subsetting###############################
#We can use a logical test in order to find our ace value by using logical operators:
1>2
1>=c(1, 2, 0, 3, 1)
c(1, 2, 3) == c(3, 2, 1)


#. If you compare objects of different data types, R will use its coercion rules 
#to coerce the objects to the same type before it makes the comparison.
deck2$face
deck2$face == "ace"
sum(deck2$face == "ace")

#You can use this method to spot and then change the aces in your deck—even 
#if you’ve shuffled your cards. First, build a logical test that identifies 
#the aces in your shuffled deck:
deck3$value[deck2$face == "ace"] <- 14
head(deck3, 26)

#Let’s put logical subsetting to use with a new game: hearts. In hearts, 
#every card has a value of zero, except cards in the suit of hearts and the queen of spades:
#Each card in the suit of hearts has a value of 1 the queen of spades has the most unusual 
#value of all: she’s worth 13 points.
deck4 <- deck
deck4$value <- 0
head(deck4, 13)

deck4$suit == "hearts"
deck4$value[deck4$suit == "hearts"] <- 1
tail(deck4)

#What you really want to find is all of the cards that have both a face value equal to queen 
#and a suit value equal to spades. You can do that with a Boolean operator. Boolean operators 
#combine multiple logical tests together into a single test.
#Boolean operators are things like and (&) and or (|).
#R has six boolean operators:
#&
#|
#xor (written as xor(cond1, cond2), meaning is exactly one of cond1 and cond2 true?)
#! (written as !cond1, meaning: is cond1 false? (e.g. !flips the results of a logical test))
#any (written any(cond1, cond2, cond3,...condk), meaning: are any of the conditions true?)
#all (written all(cond1, cond2, cond3,...condk)), meaning are all of the conditions true?)

#To use a Boolean operator, place it between two complete logical tests.
#When used with vectors, Boolean operators will follow the same element-wise execution as 
#arithmetic and logical operators:
a <- c(1, 2, 3)
b <- c(1, 2, 3)
c <- c(1, 2, 4)

a==b
b==a
c==a
a==c
b==c
a==b & b==c
#Could you use a Boolean operator to locate the queen of spades in your deck? Of course you can. 
#You want to test each card to see if it is both a queen and a spade. You can write this test in R with:
deck4$face == "queen" & deck4$suit == "spades" 
#save the results of this test to its own object. That will make the results easier to work with:
QueenOfSpades <- deck4$face == "queen" & deck4$suit == "spades" 
QueenOfSpades
#Next, you can use the test as an index to select the value of the queen of spades. Make
#sure the test actually selects the correct value:
deck4[QueenOfSpades,]
#Notice: selecting correct dimensions.  Because you selected a column, it wasnt necessary to indicate this
#when you subseted deck4$value[QueenOfSpades]
deck4$value[QueenOfSpades]
#Now that you’ve found the queen of spades, you can update her value:
deck4$value[QueenOfSpades] <- 13
deck4[QueenOfSpades,]

#===========================Logical test exercise==============================
#Note:a!=b; != is a logical operator meaning is A not equal to B.  a %in% c(a, b, c) where %in% means is 
#A in the group c(a, b, c)?

#Is w postive?
w <- c(-1, 0, 1)
w>0
#Is x greater than 10 and less than 20?
x <- c(5, 15)
x>10 & x< 20
#Is object y the word 'February'?
y <- "February"
y=="February"
#Is every value in z a day of the week?
z <- c("Monday", "Tuesday", "Friday")
all(z %in% c("Monday", "Tuesday", "Wednesday", 
             "Thursday", "Friday", "Saturday", "Sunday"))

#===============================================================================
#Let’s consider one last game, blackjack.
deck5 <- deck
head(deck5, 13)
#You can change the value of the face cards in one fell swoop with %in%:
facecard <- deck5$face %in% c("king", "queen", "jack")
deck5[facecard, ]
deck5$value[facecard]
deck5$value[facecard] <- 10
head(deck5, 13)

#Now you just need to fix the ace values—or do you? It is hard to decide what value to give the 
#aces because their exact value will change from hand to hand. At the end of each hand, an ace 
#will equal 11 if the sum of the player’s cards does not exceed 21. Otherwise, the ace will equal 1.

#==============================Missing information==============================
# If even one of the values is NA, your result will be NA:
#na.rm, which stands for NA remove. R will ignore NAs when it evaluates a function 
#if you add the argument na.rm = TRUE:
mean(c(NA, 1:50), na.rm = TRUE)
#R supplies a special function that can test whether a value is an NA. The function 
#is sensibly named is.na:
is.na(NA)
vec <- c(1, 2, 3, 4, 5, 6, NA)
is.na(vec)


#Let’s set all of your ace values to NA. This will accomplish two things. First, it will 
#remind you that you do not know the final value of each ace. Second, it will prevent you 
#from accidentally scoring a hand that has an ace before you determine the ace’s final value.
deck5$value[deck5$face == "ace"] <- NA 
head(deck5, 13)

#==============================Environments======================================
#Each object is saved inside of an environment, a list-like object that resembles a folder on your 
#computer. Each environment is con‐ nected to a parent environment, a higher-level environment, 
#which creates a hierarchy of environments.
#You can see R’s environment system with the parenvs function in the devtools package.
#parenvs(all = TRUE) will return a list of the environments that your R session is using.
library(devtools)
library(pryr)
parenvs(all = TRUE)
#R comes with some helper functions that you can use to explore your environment tree. First, you can 
#refer to any of the environments in your tree with as.environment.as.environment takes an 
#environment name (as a character string) and returns the corresponding environment:
as.environment("package:stats")
#Three environments in your tree also come with their own accessor functions. These are the global 
#environment (R_GlobalEnv), the base environment (base), and the empty environment (R_EmptyEnv). 
#You can refer to them with:
globalenv()
baseenv()
emptyenv()
#Next, you can look up an environment’s parent with parent.env:
parent.env(globalenv())
#You can view the objects saved in an environment with ls or ls.str. 
#ls will return just the object names, but ls.str will display a little about each object’s structure:
ls(emptyenv())
ls.str(globalenv())
#The empty environment is—not surprisingly—empty; the base environment has too many objects to list here;
#and the global environment has some familiar faces. It is where R has saved all of the objects that you’ve 
#created so far.
#You can use R’s $ syntax to access an object in a specific environment. For example, you can access deck 
#from the global environment:
head(globalenv()$deck, 3)
#And you can use the assign function to save an object into a particular environment. First give assign 
#the name of the new object (as a character string). Then give assign the value of the new object, and 
#finally the environment to save the object in:
assign("new", "Hello Global", envir = globalenv())
globalenv()$new
#Notice that assign works similar to <-. If an object already exists with the given name in the given 
#environment, assign will overwrite it without asking for permission. This makes assign useful for 
#updating objects but creates the potential for heartache.

#=======================================The active Environment=============================================
#If you call an object at the command line, R will look for the object in the global environment and then 
#the parents of the global environment, working its way up the environment tree one environment at a time.
environment()
new
new <- "Hello Active"
new
show_env <- function() {
  list(ran.in = environment(), 
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}
show_env()
#You can look up a function’s origin environment by running environment on the function:
environment(show_env)
#The environment doesn't need to be the global env.  For example:
environment(parenvs)
#The environment will be whichever environment the function was first created in.  R will store 
#any objects created by a function in its runtime environment. Why? Because the runtime environment 
#will be the active environment when those objects are created.  For example:
show_env <- function() {
  a <- 1
  b <- 2
  c <- 3
  list(ran.in = environment(), 
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}
show_env()

#If a function has arguments, R will copy over each argument to the runtime environment.
foo <- "take me to your runtime"

show_env <- function(x = foo) {
  a <- 1
  b <- 2
  c <- 3
  list(ran.in = environment(), 
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}
show_env()


deal <- function() {
  deck[1, ]
}
#Notice that deal no longer takes an argument, and it calls the deck object, 
#which lives in the global environment.
environment(deal)
deal()

#Now let’s fix the deal function to remove the cards it has dealt from deck. 
#Recall that deal returns the top card of deck but does not remove the card from 
#the deck. As a result, deal always returns the same card:
deal()
deal()
#You know enough R syntax to remove the top card of deck. The following code will 
#save a prisitine copy of deck and then remove the top card:
DECK <- deck
deck <- deck[-1, ]
head(deck, 3)

#Now let’s add the code to deal. Here deal saves (and then returns) the top card of deck. 
#In between, it removes the card from deck...or does it?
deal <- function() {
  card <- deck[1, ]
  deck <- deck[-1, ]
  card
}
deal()
#This code won’t work because R will be in a runtime environment when it executes deck <- deck[-1, ]. 
#Instead of overwriting the global copy of deck with deck[-1, ], deal will just create a slightly 
#altered copy of deck in its runtime environment.
#You can assign an object to a specific environment with the assign function:
deal <- function() {
  card <- deck[1, ]
  assign("deck", deck[-1, ], envir = globalenv())
  card
}
#Now deal will finally clean up the global copy of deck, and we can deal cards just as we 
#would in real life:
deal()
deal()
deal()
#Let’s turn our attention to the shuffle function:
shuffle <- function(cards) {
  random <- sample(1:52, size = 52)
  cards[random, ]
}
#shuffle(deck) doesn’t shuffle the deck object; it returns a shuffled copy of the deck object:
head(deck, 3)
a <- shuffle(deck)
head(deck, 3)
head(a, 3)
#It would be better if shuffle returned the dealt cards to the deck and then shuffled.
#Rewrite shuffle so that it replaces the copy of deck that lives in the global environment with a 
#shuffled version of DECK, the intact copy of deck that also lives in the global environment. 
#The new version of shuffle should have no arguments and return no output.
#You can update shuffle in the same way that you updated deck. The following version will do the job:
shuffle <- function(cards) {
  random <- sample(1:52, size = 52)
  assign("deck", DECK[random, ], envir = globalenv())
}


#=============================================Closures============================================
#Our system finally works. For example, you can shuffle the cards and then deal a hand of blackjack:
shuffle()
deal()
deal()
deal()

#But the system requires deck and DECK to exist in the global environment. Lots of things happen in this 
#environment, and it is possible that deck may get modified or erased by accident.
#You could create a function that takes deck as an argument and saves a copy of deck as DECK. 
#The function could also save its own copies of deal and shuffle:
setup <- function(deck) {
  DECK <- deck
  
  DEAL <- function() {
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = globalenv())
    card
  }
  
  SHUFFLE <- function() {
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = globalenv())
  }
}
#Now all of these things are safely out of the way in a child of the global environment. 
#That makes them safe but hard to use. Let’s ask setup to return DEAL and SHUFFLE so we can 
#use them. The best way to do this is to return the functions as a list:
setup <- function(deck) {
  DECK <- deck
  
  DEAL <- function() {
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = globalenv())
    card
  }
  
  SHUFFLE <- function() {
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = globalenv())
  }
  
  list(deal = DEAL, shuffle = SHUFFLE)
}
cards <- setup(deck)
#Then you can save each of the elements of the list to a dedicated object in the global environment:
deal <- cards$deal
shuffle <- cards$shuffle
deal
shuffle
environment(deal)
environment(shuffle)
#now when you run deal or shuffle, R will evaluate the functions in a runtime environment that uses 
#a runtime environement as its parent. DECK and deck will be in this parent environment, which means 
#that deal and shuffle will be able to find them at runtime. DECK and deck will be in the functions’ 
#search path but still out of the way in every other respect.  This arrangement is called a closure. 
#setup’s runtime environment “encloses” the deal and shuffle functions. Both deal and shuffle can work 
#closely with the objects contained in the enclosing environment, but almost nothing else can. 
#The enclosing environment is not on the search path for any other R function or environment.

# Instead of having each function reference the global environment to update deck, you can have them 
#reference their parent environment at runtime.
setup <- function(deck){
  DECK <- deck
  
  DEAL <- function(){
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = parent.env(environment()))
    card
  }
  
  SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = parent.env(environment()))
  }
  
  list(deal = DEAL, shuffle = SHUFFLE)
}

cards <- setup(deck)
deal <- cards$deal
shuffle <- cards$shuffle
#We finally have a self-contained card game. You can delete (or modify) the global copy of deck as 
#much as you want and still play cards. deal and shuffle will use the pristine, protected copy of deck:
#rm(object) removes objects from a specificed environment
rm(deck)
shuffle()
deal()

#the real value of understanding the environment system comes from knowing how R functions do their job. 
#You can use this knowledge to figure out what is going wrong when a function does not perform as expected.

# Some of the things can be done with functions that already exist in R and its packages, but others cannot.
#You will be the most versatile as a data scientist if you can write your own programs for computers to 
#follow.

#============================================Project 3: Slot Machine=======================================
#The play function will need to do two things. First, it will need to randomly generate three symbols; 
#and, second, it will need to calculate a prize based on those symbols.

#The first step is easy to simulate. You can randomly generate three symbols with the sample function—just 
#like you randomly “rolled” two dice in Part I.
get_symbols <- function() {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE, 
         prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}
#You can use get_symbols to generate the symbols used in your slot machine:
get_symbols()

#To create your play function, you will need to write a program that can take the output of get_symbols 
#and calculate the correct prize.
#In R, programs are saved either as R scripts or as functions. We’ll save your program as a function named 
#score. When you are finished, you will be able to use score to calculate a prize.

#Note: The print command prints its output to the console window, which makes print a useful way to display 
#messages from within the body of a function. The print command prints its output to the console window — 
#even if R calls it from within a function.


#Scoring slot-machine results is a complex task that will require a complex algorithm. You can make this, 
#and other coding tasks, easier by using a simple strategy:
#1. Break complex tasks into simple subtasks.
#2. Use concrete examples.
#3. Describe your solutions in English, then convert them to R.

#R programs contain two types of subtasks: sequential steps and parallel cases.

#=============================================Sequential Steps=================================================
#To have R execute steps in sequence, place the steps one after another in an R script or function body.
play <- function() {
  #step 1:generate symbols
  symbols <- get_symbols()
  
  #step 2: display the symbols
  print(symbols())
  
  #step 3: score the symbols
  score(symbols())
}

#==========================================Parallel Cases=====================================================
#Another way to divide a task is to spot groups of similar cases within the task. Some tasks require 
#different algorithms for different groups of input. If you can identify those groups, you can work out 
#their algorithms one at a time.

######If statements

#Linking cases together in parallel requires a bit of structure; your program faces a fork in the road 
#whenever it must choose between cases. You can help the program navigate this fork with an if statement.
#An if statement tells R to do a certain task for a certain case. In English you would say something like, 
#“If this is true, do that.” In R, you would say:
if (this) {
  that
}
#The this object should be a logical test or an R expression that evaluates to a single TRUE or FALSE. 
#If TRUE, R will run the code.  If FALSE, R will skip the code.
#E.g.
#TRUE
num <- -2

if (num < 0) {
  num <- num * -1
}

num

#FALSE
num <- 4

if (num < 0) {
  num <- num * -1
}
num

#The condition of an if statement must evaluate to a single TRUE or FALSE. If the condition creates a 
#vector of TRUEs and FALSEs (which is easier to make than you may think), your if statement will print 
#a warning message and use only the first element of the vector. Remember that you can condense vectors 
#of logical values to a single TRUE or FALSE with the functions any and all.

###########else Statements
#if statements tell R what to do when your condition is true, but you can also tell R what to do when the 
#condition is false. else is a counterpart to if that extends an if statement to include a second case. 
#In English, you would say, “If this is true, do plan A; else do plan B.” In R, you would say:
if (this) {
  PlanA
} else {
  PlanB
}

#For example, you could write some code that rounds a decimal to the nearest integer.
a <- 3.14
#trunc returns the value to the left on an integer.  However you can change this with x - trunc(x)
dec <- a - trunc(a)
dec
#Then use an if else tree to round the number (either up or down):
if (dec >= 0.5) {
  a <- trunc(a) + 1
} else {
  a <- trunc(a)
}
a
#If your situation has more than two mutually exclusive cases, you can string multiple if and else 
#statements together by adding a new if statement immediately after else. For example:
a <- 1
b <- 1

if (a>b) {
  print("A wins!")
} else if (a<b) {
  print("B wins!")
} else {
  print("Tie.")
}

#####################
#we’ve reduced the program to eight simple subtasks:
#1. Test whether the symbols are three of a kind.
#2. Test whether the symbols are all bars.
#3. Look up the prize for three of a kind based on the common symbol. 
#4. Assign a prize of $5.
#5. Count the number of cherries.
#6. Count the number of diamonds.
#7. Calculate a prize based on the number of cherries.
#8. Adjust the prize for diamonds.

##The first subtask asks you to test whether the symbols are three of a kind. 
#How should you begin writing the code for this subtask?
#You can save yourself time and headaches if you focus on one subtask at a time.  This is so that you 
#can check whether each subtask is functioning correctly.


#After you set up a concrete example, try to describe how you will do the subtask in English. The more 
#precisely you can describe your solution, the easier it will be to write your R code.
#Our first subtask asks us to “test whether the symbols are three of a kind.”
#A vector named symbols will contain three of the same symbol if the first element of symbols is equal 
#to the second element of symbols and the second element of symbols is equal to the third element of symbols.

#Here are a couple of ways to test that symbols contains three of the same symbol. The first method 
#parallels the English suggestion above.

symbols <- c("7", "7", "7")
symbols[1] == symbols[2] & symbols[2] == symbols[3]
symbols[1] == symbols[2] & symbols[1] == symbols[3]
#Therefore:
all(symbols == symbols[1])

#As your vocabulary of R functions broadens, you’ll think of more ways to do basic tasks. One method that I 
#like for checking three of a kind is:
length(unique(symbols) == 1)
#The unique function returns every unique term that appears in a vector. If your symbols vector contains 
#three of a kind (i.e., one unique term that appears three times), then unique(symbols) will return a 
#vector of length 1.


same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
same
#&& and || behave like & and | but can sometimes be more efficient. The double operators will not evaluate 
#the second test in a pair of tests if the first test makes the result clear. For example, if symbols[1] 
#does not equal symbols[2] in the next expression, && will not evaluate symbols[2] == symbols[3]; it can 
#immediately return a FALSE for the whole expression.  However, double operators are not appropriate 
#everywhere. && and || are not vectorized, which means they can only handle a single logical test on 
#each side of the operator.

#if (same) {
#  prize <-  #look up the prize
#} else if (#Case 2: all bars) {
# prize <- #assign $5
#} else {
  #count cherries
#  prize <- #calculate a prize
#}


#count diamonds
#double the prize if necessary

#The second prize case occurs when all the symbols are a type of bar, for example, B, BB, and BBB.
symbols <- c("B", "BB", "BBB")
#Use R’s logical and Boolean operators to write a test that will determine whether a vector named symbols 
#contains only symbols that are a type of bar.  you could write a very long test that uses multiple Boolean 
#operators, like this:
symbols[1] == "B" | symbols[1] == "BB" | symbols[1] == "BBB" &
  symbols[2] == "B" | symbols[2] == "BB" | symbols[2] == "BBB" &
  symbols[3] == "B" | symbols[2] == "BB" | symbols[2] == "BBB"
#However, this is not a very efficient solution, because R has to run nine logical tests.
#You can often replace multiple | operators with a single %in%.
#Also, you can check that a test is true for each element in a vector with all.
all(symbols %in% c ("B", "BB", "BBB"))
#Let’s add this code to our script:
#bars <- all(symbols %in% c ("B", "BB", "BBB"))

#if (same) {
#  prize <- #look up the prize
#} else if (all(bars)) {
#  prize <- #assign 5$
#} else {
  #count cherries
#  prize <- #calculate a prize
#}

#count diamonds
#double the prize if necessary

#Our next subtask is to assign a prize for symbols.  This suggests another if tree. You could assign a prize
#with some code like this:
#if (same) {
#  symbol <- symbols[1]
#  if (symbol == "DD") {
#    prize <- 800
# } else if (symbol == "7") {
#    prize <- 80
#  } else if (symbol == "BBB") {
#    prize <- 40
# } else if (symbol == "BB") {
#    prize <- 5
#  } else if (symbol == "B") {
#    prize <- 10
#  } else if (symbol == "C") {
#   prize <- 10
#  } else if (symbol == "0") {
#    prize <- 0
#  }
#}
#Although this works, we can do better with a different method.

#=========================================Lookup Tables=======================================================
#Very often in R, the simplest way to do something will involve subsetting.  Since you know the exact 
#relationship between the symbols and their prizes, you can create a vector that captures this information. 
#This vector can store symbols as names and prize values as elements:
payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, 
             "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
payouts
#Now you can extract the correct prize for any symbol by subsetting the vector with the symbol’s name:
payouts["DD"]
payouts["B"]
#If you want to leave behind the symbol’s name when subsetting, you can run the un name function on 
#the output.  Only the value of the input symbol is returned:
unname(payouts["B"])
#Sadly, our method is not quite automatic; we need to tell R which symbol to look up in payouts. 
#Or do we? What would happen if you subsetted payouts by symbols[1]? Give it a try:
symbols <- c("7", "7", "7")
symbols[1]

payouts[symbols[1]]

symbols <- c("C", "C", "C")
symbols[1]

payouts[symbols[1]]
#You don’t need to know the exact symbol to look up because you can tell R to look up whichever symbol 
#happens to be in symbols.  Let’s add it to our code and then look at Case 2:
#same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
#bars <- all(symbols %in% c ("B", "BB", "BBB"))

#if (same) {
#  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40,
#               "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
#  prize <- unname(payouts[symbols[1]])
#} else if (all(bars)) {
#  prize <- #assign $5
#} else {
  #count cherries
#  prize <- #calculate prize
#}

#count diamonds
#double the prize if necessary

#Case 2 occurs whenever the symbols are all bars. In that case, the prize will be $5, 
#which is easy to assign:
#same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
#bars <- all(symbols %in% c ("B", "BB", "BBB"))

#if (same) {
#  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40,
#               "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
#  prize <- unname(payouts[symbols[1]])
#} else if (all(bars)) {
#  prize <- 5
#} else {
#  #count cherries
#  prize <- #calculate a prize
#}
#count diamonds
#double the prize if necessary


#==============Exercise============
#How can you tell which elements of a vector named symbols are a C? Devise a test and try it out.
symbols <- c("C", "DD", "C")
#One way to test for cherries would be to check which, if any, of the symbols are a C:
symbols == "C"
#It’d be even more useful to count how many of the symbols are cherries. You can do this with sum, 
#which expects numeric input, not logical.
sum(symbols == "C")
#You can use the same method to count the number of diamonds in symbols:
sum(symbols == "DD")
#==================================
#Let’s add both of these subtasks to the program skeleton:
#if (same) {
#  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40,
#               "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
#  prize <- unname(payouts[symbols[1]])
#} else if (all(bars)) {
#  prize <- 5
#} else {
#  cherries <- sum(symbols == "C")
#  prize <- #calc. prize
#}
#diamonds <- sum(symbols == "DD")
#double the prize if necessary

#In Case 3 will only be applied to players that do not have three of a kind or all bars. 
#According to the slot machine’s payout scheme, these players will win $5 if they have two cherries 
#and $2 if they have one cherry. If the player has no cherries, she gets a prize of $0. 
#We don’t need to worry about three cherries because that outcome is already covered in Case 1.

#As in Case 1, you could write an if tree that handles each combination of cherries, 
#but just like in Case 1, this would be an inefficient solution:
#if (cherries == 2) {
#  prize <- 5
#} else if (cherries == 1) {
#  prize <- 2
#} else {
#  prize <- 0
#}
#Again, I think the best solution will involve subsetting.
#We know that our prize should be $0 if we have no cherries, $2 if we have one cherry, 
#and $5 if we have two cherries. You can create a vector that contains this information. 
#This will be a very simple lookup table:
#c(0, 2, 5)[2] + 1 
#cherries isn’t exactly suited for integer subsetting because it could contain a zero, but that’s easy 
#to fix. We can subset with cherries + 1. Now when cherries equals zero, we have:
#c(0, 2, 5)[cherries + 1] 
## 0
#When cherries equals one, we have: cherries + 1
## 2
#c(0, 2, 5)[cherries + 1] 
## 2

# Then add the code to your script, as follows:
same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
bars <- all(symbols %in% c ("B", "BB", "BBB"))

if (same) {
  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40,
               "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
  prize <- unname(payouts[symbols[1]])
} else if (all(bars)) {
  prize <- 5
} else {
  cherries <- sum(symbols == "C")
  prize <- c(0, 2, 5)[cherries + 1]
}
diamonds <- sum(symbols == "DD")
#double prize if necessary

#============
#if trees are not appropriate everywhere.  if trees have a couple of drawbacks. First, 
#they require R to run multiple tests as it works its way down the if tree, which can create
#unnecessary work. Second, as you’ll see in Chapter 10, it can be difficult to use if trees 
#in vectorized code, a style of code that takes advantage of R’s programming strengths to 
#create fast programs. Lookup tables do not suffer from either of these drawbacks.

#As a general rule, use an if tree if each branch of the tree runs different code. 
#Use a lookup table if each branch of the tree only assigns a different value.
#=============
#The final subtask is to double the prize once for every diamond present. This means that the final prize 
#will be some multiple of the current prize.
#Here is a concise solution inspired by the previous pattern. The adjusted prize will equal:
#prize * 2 ^ diamonds

#=======================================Code Comments===============================================
#omments can make your code easier to understand by explaining why the code does what it does. 
#You can also use comments to break long programs into scannable chunks.

#identify case
same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
bars <- all(symbols %in% c ("B", "BB", "BBB"))

#get prize
if (same) {
  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40,
               "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
  prize <- unname(payouts[symbols[1]])
} else if (all(bars)) {
  prize <- 5
} else {
  cherries <- sum(symbols == "C")
  prize <- c(0, 2, 5)[cherries + 1]
}

#adjust for diamonds
diamonds <- sum(symbols == "DD")
prize * 2^ diamonds


#Now that each part of your code works, you can wrap it into a function:
#Often the concrete examples that you used to test your code, like symbols, 
#will become the arguments of your function.


score <- function(symbols) {
  #identify case
  same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
  bars <- all(symbols %in% c ("B", "BB", "BBB"))
  
  #get prize
  if (same) {
    payouts <- c("DD" = 100, "7" = 80, "BBB" = 40,
                 "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
    prize <- unname(payouts[symbols[1]])
  } else if (all(bars)) {
    prize <- 5
  } else {
    cherries <- sum(symbols == "C")
    prize <- c(0, 2, 5)[cherries + 1]
  }
  
  #adjust for diamonds
  diamonds <- sum(symbols == "DD")
  prize * 2 ^ diamonds 
}
#Once you have defined the score function, the play function will work as well:
play <- function() {
  #step 1:generate symbols
  symbols <- get_symbols()
  #step 2: display the symbols
  print(symbols)
  #step 3: score the symbols
  score(symbols)
}
play()
#==============================================Summary======================================================
# Divide the job before you into simple tasks, and then divide the tasks again. You can visualize 
#the relationship between tasks with a flow chart if it helps. Then work on the subtasks one at a time. 
#Describe solutions in English, then convert them to R code. Test each solution against concrete examples
#as you go. Once each of your subtasks work, combine your code into a function 
#that you can share and reuse.   You can manage cases with if and else statements. 
#You can create a lookup table with objects and subsetting. You can add code comments with #. 
#And you can save your programs as a function with function.  It should be easy to find the source of your 
#errors if you use a stepwise approach to writing functions, writing—and then testing—one bit at a time. 
#However, if the source of an error eludes you, or you find yourself working with large chunks of untested 
#code, consider using R’s built in debug‐ ging tools.

#=========================================R's S3 system====================================================

#The slot machine doesn't display the total winnings in $'s; nor are we able to save the symbols
#of our previous turn due to the use of calling print() within the play () function.  You can fix these
#problems using R's S3 system.

#The S3 system is a class system built within R.  The system governs how R handles objects of different
#classes.  Certain R functions with look up an object's S3 class, and then behave differently in 
#response.  

#For example, the print () function is like this.  When you print a numeric vector, print() will
#display a number:
num <- 1000000000
print(num)
#However, if you give the number an S3 class POSIXct followed by POSIXt, print will display
#a time:
class(num) <- c("POSIXct", "POSIXt")
print(num)
#If you use objects with classes, you will need to understand how to use R's S3 system.
#R's S3 system is built around three core components: attributes(especially the class aatribute),
#generic functions, and methods.

######Attributes########
#Attributes do not affect the values of the object, but stick to the object as a type of metadata that R
#can use to handle the object.  E.g. a data frame stores its row and column names as attributes.

#You can see an objects attribute by using the attribute(object) command.
attributes(DECK)
#We know names(), dim(), and class() functions.  However, has many more:
row.names(DECK)
#You can use these fucntions to retrieve an attribute's value.  Or, you can also use them
#to change an attributes value.
row.names(DECK) <- 101:152
#or to give an object a new attribute all together:
levels(DECK) <- c("level 1", "level 2", "level 3")
attributes(DECK)
#R will let you add any attributes that you like to an object.  The only time that R will complain is
#when a function needs to find an attribute and it is not there.
#You can add any general attribute to an object with attr; you can also use attr to look up the value of
#any attribute of an object. Let’s see how this works with one_play, the result of playing our slot machine 
#one time:
one_play <- play()
one_play
attributes(one_play)
#attr takes two arguments: an R object and the name of an attribute.  
#To give the R object an attribute of the specified name, save a value to the output of attr. 
#Let’s give one_play an attribute named symbols that contains a vector of char‐ acter strings:
attr(one_play, "symbols") <- c("B", "0", "B")
attributes(one_play)
#To look up the value of any attribute, give attr an R object and the name of the attribute you would 
#like to look up:
attr(one_play, "symbols")
#you can use attr to display the score symbols and modeify the use of the lazy print() function
#=========================Exercise=======================
#Modify play to return a prize that contains the symbols associated with it as an attribute named 
#symbols. Remove the redundant call to print(symbols):
#play <- function() {
# symbols <- get_symbols()
# print(symbols)
# score(symbols)
#}

#You can create a new version of play by capturing the output of score(symbols) and assigning 
#an attribute to it. play can then return the enhanced version of the output:
play <- function() {
  symbols <- get_symbols()
  prize <- score(symbols)
  attr(prize, "symbols") <- symbols
  prize
}
#Now play returns both the prize and the symbols associated with the prize. The results may not look pretty, 
#but the symbols stick with the prize when we copy it to a new object. We can work on tidying up the display
#in a minute:
play()
two_play <- play()
two_play
#You can also generate a prize and set its attributes in one step with the structure function.
play <- function() {
  symbols <- get_symbols()
  structure(score(symbols), symbols = symbols)
}
three_play <- play()
three_play

#Now that your play output contains a symbols attribute, what can you do with it? You can write your own 
#functions that lookup and use the attribute. For example, the following function will look up one_play’s
#symbols attribute and use it to display one_play in a pretty manner:
slot_display <- function(prize) {
  #extract symbols
  symbols <- attr(prize, "symbols")
  
  #collapse symbols into a single string
  symbols <- paste(symbols, collapse = " ")
  
  #combine symbols with prize as a regular expression
  #\n is regular expression for a new line (i.e. return or enter)
  string <- paste(symbols, prize, sep = "\n$")
  
  #display regular expression in console without quotation marks
  cat(string)
}
slot_display(one_play)
#The first line of the function will look up the value of the symbols attribute and save it as an object 
#named symbols.  Let's make an example symbols object so we can see what the rest of the function does.
#We can use one_play's symbols attribute to do the job.  symbols will be a vector of 3 character strings.
symbols <- attr(one_play, "symbols")
symbols
#Next, slot_display uses paste() to collapse the three strings in symbols into a single character string.
#pase collapses a vector of character strings into a single string when you give it the collapse argument.
#paste will use the value of collapse to seperate the formerly distinct strings.  Hence, symbols becomes
#B 0 B the three strings seperated by a space:
symbols <- paste(symbols, collapse = " ")
symbols
#HTherefore, you can now use slot_display to manually clean the output of play()
slot_display(play())
slot_display(play())
slot_display(play())
#This method of cleaning the output requires you to manually intervene in your R session 
#(to call slot_display). There is a function that you can use to automatically clean up the output 
#of play each time it is displayed. This function is print, and it is a generic function.

#======================================Generic Functions=====================================================
#print call also explains why the output of print always matches what you see when you display an object 
#at the command line:
print(pi)
pi
print(head(deck2))
head(deck2)
print(play())
play()
# a generic function. This means that print is written in a way that lets it do different things in 
#different cases. You’ve already seen this behavior in action (although you may not have realized it). 
#print did one thing when we looked at the unclassed version of num:
num <- 1000000000
print(num)
#and a different thing when we gave num a class:
class(num) <- c("POSIXct", "POSIXt")
print(num)
#Take a look at the code inside print to see how it does this. 
print
#You may imagine that print looks up the class attribute of its input and then uses an if tree to pick w
#hich output to display. If this occurred to you, great job! print does something very similar, but much 
#more simple.

#=================================================Methods====================================================

#When you call print, print calls a special function, UseMethod:
print
#UseMethod examines the class of the input that you provide for the first argument of print(), and then
#passes all of your arguments to a new function designed to handle that class of input.  For example, 
#when you give print() a POSIXct object, UseMethod will pass all of print's() arguments to print.POSIXct.
#R will then run print.POSIXct and return the results:
print.POSIXct

#If you give print() a factor object, UseMethod will pass all of print's() arguments to print.factor.
#R will then run print.factor and return the results.
print.factor

#print.POSIXct and print.factor are called methods of print.
#By themselves, print.POSIXct and print.factor work like regular R functions.  However, each was written
#specifically so UseMethod could call it to handle a specific class of print() input.  Therefore, UseMethod
#allows for the print() function to call a specialised method that can interpret the class of print's() 
#first argument.
#You can see which methods exist for a generic function by calling methods on the function.
#For example, print has almost 200 methods (which gives you an idea of how many classes exist in R):
methods(print)
#This system of generic functions, methods, and class-based dispatch is known as S3 because it originated 
#in the third version of S, the programming language that would evolve into S-PLUS and R.

#The S3 system allows R functions to behave in different ways for different classes. You can use S3 to 
#format your slot output. First, give your output its own class. Then write a print method for that class. 
#To do this efficiently, you will need to know a little about how UseMethod selects a method function to use.

#=============================================Method Dispatch================================================
#Every S3 method has a two-part name.  The first part of the name will refer to the function that the method
#works with.  The second part will refer to the class. These two parts are seperated by a period, for example
#summary.matrix, and so on.

#When UseMethod needs to call a method, it searches for an R function with the correct S3-style name.  The
#function does not have to be special in any way; it just needs to have the correct name.

#You can participate in this system by writing your own function and giving it a valid S3-style name. 
#For example, let’s give one_play a class of its own. It doesn’t matter what you call the class; 
#R will store any character string in the class attribute:

class(one_play) <- "slots"
#Now let's write an S3 print method for the slots class.

args(print)

print.slots <- function(x, ...) {
  cat("I'm using the print.slots method")
}

print(one_play)
one_play
rm(print.slots)

#Some R objects have multiple classes. For example, the output of Sys.time has two classes.  Which class
#will UseMethod use to find a print method?

now <- Sys.time()
attributes(now)

#UseMethod will first look for a method that matches the first class listed in the object’s class vector. 
#If UseMethod cannot find one, it will then look for the method that matches the second class 
#(and so on if there are more classes in an object’s class vector).  If you give print an object whose 
#class or classes do not have a print method, UseMe thod will call print.default, a special method 
#written to handle general cases.

#Let’s use this system to write a better print method for the slot machine output.

#======Exercise======
#Write a new print method for the slots class. The method should call slot_display to return well-formatted 
#slot-machine output.
#It is surprisingly easy to write a good print.slots method because we’ve already done all of the hard work 
#when we wrote slot_display.
print.slots <- function(x, ...) {
  slot_display(x)
}
#Now R will automatically use slot_display to display objects of class slots 
#(and only objects of class “slots”):
one_play
#Let’s ensure that every piece of slot machine output has the slots class.

#=====Exercise=====
#Modify the play function so it assigns slots to the class attribute of its output:
#play <- function() {
# symbols <- get_symbols() structure(score(symbols), symbols = symbols)
#}

#You can set the class attribute of the output at the same time that you set the sym bols attribute. 
#Just add class = "slots" to the structure call:
play <- function() {
  symbols <- get_symbols()
  structure(score(symbols), symbols = symbols, class = "slots")
}

#Now each of our slot machine plays will have the class slots:
class(play())
#As a result, R will display them in the correct slot-machine format:
play()
play()

#==============================================Classes======================================================
#To make a class:

#1. Choose a name for your class.
#2. Assign each instance of your class a class attribute.
#3. Write class methods for any generic function likely to use objects of your class.
methods(class = "factor")
#When combining objects into a vector, or subsetting an object, R drops the class attribute assigned to the
#object.  You can avoid this behavior by writing a c.slots method and a [.slots method, but then 
#difficulties will quickly accrue. How would you combine the symbols attributes of multiple plays into 
#a vector of symbols attributes? How would you change print.slots to handle vectors of outputs? 
#These challenges are open for you to explore. However, you will usually not have to attempt 
#this type of large-scale programming as a data scientist.

#============================================S3 and Debugging================================================
#UseMethod calls a class-specific method, you can search for and examine the method directly. 
#It will be a function whose name follows the <function.class> syntax, or possibly <function.default>. 
#You can also use the methods function to see what meth‐ ods are associated with a function or a class.


#======Sum
#Values are not the only place to store information in R, and functions are not the only way to create
#uniqiue behaviour.  You can also do both of these things using R's S3 system.  

#The S3 system provides a simple way to create object-specific behaviour in R.  In other words, it is R's
#version of object-orientated programming (OOP).  This system is implemented by generic functions.  These
#functions examine the class attribute of their input and call a class-specific method to generate output.

#R’s S3 system is more helpful for the tasks of computer science than the tasks of data science, 
#but understanding S3 can help you troubleshoot your work in R as a data scientist.

#Chapter 9 will delve into how to automate repition with R's for and while functions.
#You’ll use for to simulate various slot machine plays and to calculate the payout rate of 
#your slot machine.



#======================================Chapter 9: Loops======================================================
#Loops are R's method for repeating a task; this makes them particularly useful for programming
#simulations.

#Your slot machine is modeled after real machines that were accused of fraud. The ma‐ chines appeared to pay 
#out 40 cents on the dollar, but the manufacturer claimed that they paid out 92 cents on the dollar. 
#You can calculate the exact payout rate of your machine with the score program. The payout rate will 
#be the expected value of the slot machine’s prize.

#========Expected values========
#The expected value of a random event is a type of weighted average; it is the sum of each possible outcome
#of the event, weighted by the probability that each outcome occurs.
#You can think of the expected value as the average prize that you would observe if you had to play 
#the slot machine an infinte amount of times

#Let's use the formula to calculate some simple expected values.  Listing combinations of outcomes, for example
#the outcomes of rolling two die, can be tedious; but R has a function that can help.

#======expand.grid
#The expand.grid function in R provides a quick way to write our every combination of the elements in 
#vectors.
#For example, you can list every combination of two dice. To do so, run expand.grid on two copies of die:

rolls <- expand.grid(die, die)
rolls
#You can use expand.grid with more than two vectors if you like. For example, with 3 or even 10 die vectors.
#You can determine the value of each roll once you’ve made your list of outcomes, . 
#This will be the sum of the two dice, which you can calculate using R’s element-wise execution
rolls$value <- rolls$Var1 + rolls$Var2
head(rolls, 3)

#We suggest a three-step process for calculating these probabilities in R. First, 
#we can look up the probabilities of rolling the values in Var1. We’ll do this with the lookup 
#table that follows:
prob <- c("1" = 1/8, "2" = 1/8, "3" = 1/8, "4" = 1/8, "5" = 1/8, "6" = 3/8)
prob
#If you subset this table by rolls$Var1, you will get a vector of probabilities
#perfectly keyed to the values of Var1:
rolls$Var1
prob[rolls$Var1]

rolls$prob1 <- prob[rolls$Var1]
head(rolls, 3)
#Second, we can look up the probabilities of rolling the values in Var2:
rolls$prob2 <- prob[rolls$Var2]
head(rolls, 3)
#Third, we can calculate the probability of rolling each combination by multiplying prob1 by prob2:
rolls$prob <- rolls$prob1*rolls$prob2
head(rolls, 3)

#It is easy to calculate the expected value now that we have each outcome, the value of each outcome, 
#and the probability of each outcome. The expected value will be the summation of the dice values 
#multiplied by the dice probabilities:
sum(rolls$value*rolls$prob)


#Now that you’ve warmed up, let’s use our method to calculate the expected value of the slot machine prize. 
#We will follow the same steps we just took:
# 1. We will list out every possible outcome of playing the machine. 
#   This will be a list of every combination of three slot symbols.
# 2. We will calculate the probability of getting each combination 
#     when you play the machine.
# 3. We will determine the prize that we would win for each combination.
#==========Exercise=========
#Use expand.grid to make a data frame that contains every possible combination of three symbols 
#from the wheel vector:
wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
#Be sure to add the argument stringsAsFactors = FALSE to your expand.grid call; otherwise, 
#expand.grid will save the combinations as factors, an unfortunate choice that will disrupt 
#the score function.
#To create a data frame of each combination of three symbols, you need to run ex pand.grid 
#and give it three copies of wheel.
combos <- expand.grid(wheel, wheel, wheel, stringsAsFactors = FALSE)
head(combos)
#Now, let’s calculate the probability of getting each combination.
#You can use the prob‐ abilities contained in the prob argument of get_symbols to do this. 
#These probabilities determine how frequently each symbol is chosen when your slot machine generates 
#symbols. They were calculated after observing 345 plays of the Manitoba video lottery terminals. 
#Zeroes have the largest chance of being selected (0.52) and cherries the least (0.01):
get_symbols <- function() {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE,
         prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}
#=======Exercise======
#Isolate the previous probabilities in a lookup table. What names will you use in your table?
#Your names should match the input that you want to look up.
prob <- c("DD" = 0.03, "7" = 0.03, "BBB" = 0.06, "BB" = 0.1, 
            "B" = 0.25, "C" = 0.01, "0" = 0.52)
#Now let’s look up our probabilities.
#=====Exercise========
#Look up the probabilities of getting the values in Var1. Then add them to combos as a column named prob1. 
#Then do the same for Var2 (prob2) and Var3 (prob3).

combos$prob1 <- prob[combos$Var1]
combos$prob2 <- prob[combos$Var2]
combos$prob3 <- prob[combos$Var3]

head(combos, 3)

#================Exercise==============
#Calculate the overall probabilities for each combination. Save them as a column named prob in combos, 
#then check your work.

#You can calculate the probabilities of every possible combination in one fell swoop with 
#some element-wise execution:
combos$prob <- combos$prob1 * combos$prob2 * combos$prob3

head(combos, 3)
#The sum of the probabilities is one, which suggests that our math is correct:
sum(combos$prob)
#You only need to do one more thing before you can calculate the expected value: 
#you must determine the prize for each combination in combos. You can calculate the prize with score. 
#For example, we can calculate the prize for the first row of combos like this:
symbols <- c(combos[1, 1], combos[1, 2], combos[1, 3])
symbols
score(symbols)
#However there are 343 rows, which makes for tedious work if you plan to calculate the scores manually. 
#It will be quicker to automate this task and have R do it for you, which you can do with a for loop.

#==========================================for Loops=======================================
#A for loop repeats a chunk of code many times, once for each element in a set of input. 
#for loops provide a way to tell R, “Do this for every value of that.” In R syntax, this looks like:
for (value in that) {
  this
}
#The that object should be a set of objects; i.e. vectors of numbers of character strings.
#The for loop will run the code in that appears between the braces once for each member of that. For example:
for (value in c("My", "first", "for", "loop")) {
  print("one run")
}setwd("/Users/joshuamusson/Desktop/Data_Analytics/Rstudio/Data sets/Intro_to_R")
die <- 1:6
 ls()

 mean(1:6) 
 mean(die) 
round(mean(die)) 


sample(x = 1:4, size = 2)
sample(x = die, size = 1)
args(sample)
args(factorial)
args(sample)
round(3.1416, digits = 2)


sample(die, size = 2, replace = TRUE)


dice <- sample(die, size = 2, replace = TRUE)
dice
sum(dice)
dice
dice
roll()

roll <- function() {
  die <- 1:6
  dice <- sample(x = die, size = 2, replace = TRUE)
  sum(dice)
}

roll.V2 <- function(bones = 1:6) {
  die <- 1:6
  dice <- sample(x = bones, size = 2, replace = TRUE)
  sum(dice)
}

roll.V2()

library("ggplot2")

x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
x

y<-x^3
y

qplot(x, y)


x <- c(1, 2, 2, 2, 3, 3)
qplot(x, binwidth = 1)

x2<-c(1,1,1,1,1,2,2,2,2,3,3,4)
qplot(x2, binwidth = 1)

x3<-c(0,1,1,2,2,2,3,3,4)
qplot(x3, binwidth = 1)

roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE, 
                 prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  sum(dice)
}

rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)

is.vector(die)
is.atomic(die)

int <- 1L
text <- "ace"

int <- c(1L, 5L)
text <- c("ace", "hearts")

die <- c(1, 2, 3, 4, 5, 6)

 typeof(die)
 typeof(int) 
 
 royal_flush <- c("ace", "king", "queen", "jack", "ten")
 royal_flush

 typeof(royal_flush)

 names(die) 

 names(die) <- c("one", "two", "three", "four", "five", "six")

 names(die) 
attributes(die) 
die

names(die) <- NULL
die

dim(die) <- c(2, 3)
die

dim(die) <- c(3, 2)
die

dim(die) <- c(1, 2, 3)
die

#Creating a matrice of values from a stored vector
matrice_test <- matrix(die, nrow = 2)
matrice_test

#Here, I define the numbers of rows and columns
matrice_test <- matrix(die, nrow = 2, ncol = 2)
matrice_test

#If you set your byrow argument set to TRUE, you can fill the matric row by row
#instead of column by column
matrice_test <- matrix(die, nrow = 2, byrow = TRUE)
matrice_test


ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3))
ar

#Create the following matrix, which stores the name and suit of every card in a royal flush.
##      [,1]    [,2]
## [1,] "ace"   "spades"
## [2,] "king"  "spades"
## [3,] "queen" "spades"
## [4,] "jack"  "spades"
## [5,] "ten"   "spades"

hand1 <- c("ace", "king,", "queen", "jack", "ten", "spades", "spades", 
           "spades", "spades", "spades")
#You can now turn the vector into a matrice using any of the following three commands
matrix(hand1, nrow = 5)
matrix(hand1, nrow = 2)
dim(hand1) <- c(5, 2)
dim(hand1)
hand1

#In this case, you will need to ask R to fill the matrix row by row instead of column by column:
hand2 <- c("ace", "king", "queen", "jack", "ten", "spades", 
           "spades", "spades", "spades", "spades")

matrix(hand2, nrow = 5, byrow = TRUE)
matrix(hand2, nrow = 2, byrow = TRUE)


dim(die) <- c(2, 3)
typeof(die)

class(die)
class(royal_flush)
class(matrice_test)
class(roll())
class(roll.V2())

now <- Sys.time()
now
class(now)

#You can see this vector by removing the class attribute of now, or by using the un class function, 
#which does the same thing:
unclass(now)

#Below, we create a factor. Factor's are R's way of creating categorical information, e.g. ethnicity or eye colour.
#To make a factor, pass an atomic vector into the factor() function.  R recodes the the data in the vector as integers.
gender <- factor(c("male", "female", "female", "male"))
typeof(gender)
attributes(gender)

#You can convert a factor to a character string with the as.character() function
as.character(gender)

as.character(1)
as.logical(1)
as.numeric(FALSE)


#Lists are like atomic vectors because they group data into a one-dimensional set. How‐ ever, 
#lists do not group together individual values; lists group together R objects, such as 
#atomic vectors and other lists.


list1 <- list(100:130, "R", list(TRUE, FALSE))
list1
#Lists are a basic type of object in R, on par with atomic vectors. Like atomic vectors, 
#they are used as building blocks to create many more spohisticated types of R objects.

#Let's create a card, using the list() vector
card <- list("ace", "hearts", 1)
card
#We could do this for every card in a deck, by creatin 52 sublists of a card pack.  However,
#this is inefficient and unpractical for dealing with large data sets.  Therefore, we can use a data frame.

#Data frames are the two-dimensional version of a list. They are far and away the most useful
#storage structure for data analysis, and they provide an ideal way to store an entire deck of cards. 
#You can think of a data frame as R’s equivalent to the Excel spreadsheet because it stores data in a similar format.
#Data frames group vectors together into a two-dimensional table. Each vector becomes a column in the table. 
#As a result, each column of a data frame can contain a different type of data; but within a column, 
#every cell must be the same type of data.

df <- data.frame(face = c("ace", "two", "six"), suit = c("clubs", "clubs", "clubs"),
                 value = c(1, 2, 3))
df

typeof(df)
class(df)
str(df)

#Notice that R saved your character strings as factors. I told you that R likes factors! It is not a very big deal 
#here, but you can prevent this behavior by adding the argument stringsAsFactors = FALSE to data.frame:

df <- data.frame(face = c("ace", "two", "six"), suit = c("clubs", "clubs", "clubs"),
                 value = c(1, 2, 3), stringsAsFactors = FALSE)
df
str(df)
#Now, card names and suit are stored as characters rather than factors.


#We could write out a whole data set for a pack of cards using data frame.  This would be tedious.
#Let's turn to loading a data set.

deck <- read.csv("~/Desktop/Data_Analytics/Rstudio/Data sets/Intro_to_R/deck.csv", stringsAsFactors=FALSE)
View(deck)

head(deck)
tail(deck)

#Now let's save this csv. file.
write.csv(deck, file = "cards.csv", row.names = FALSE)
#This will save the data.frame file to your working directory.
#To view your working directory path:
getwd()
#You can also set your working dirctory with:
#setwd()

#To extract a value or set of values from a data frame, write the data frame’s name 
#followed by a pair of hard brackets. R will use the first index to subset the rows
#of the data frame and the second index to subset the columns:
head(deck)
deck[1,1]
#To extract more than one value, use a vector of positive integers.
deck[1, c(1, 2, 3)]
#or
deck[1, 1:3]
#You can then save this new set to an R object with R’s assignment operator:
newdeck <- deck[1, 1:3]
newdeck
#if you select a single column, R will return a vector. If you would prefer 
#a data frame instead, you can add the optional argument drop = FALSE between the brackets:  
deck[1:2, 1, drop = FALSE]
#R will return every element except the elements in a negative index. For example:
deck[-1, 1:3]
#This will return everything BUT the first row.
#Negative integers are a more efficient way to subset than positive integers if you want to 
#include the majority of a data frame’s rows or columns.

#Let's make a deal function:
deal <- function(cards) {
  cards[1, ]
}

deal(deck)
#The function does exactly what you want: it deals the top card from your data set. 
#However, the function becomes less impressive if you run deal over and over again,
#as it returns the same value.  We need to make it deal a new card every time.
#First let's learn how to shuffle the deck.

#First, extract every row in the data frame:
deck2 <- deck[1:52, ]
head(deck2)
#If you want the rows to come in a random order, then you need to sort the integers 
#from 1 to 52 into a random order and use the results as a row index. How could you 
#generate such a random collection of integers? With our friendly neighborhood sample function:
random <- sample(1:52, size = 52)
random

#Therefore, create an object using the random object
deck4 <- deck[random, ]
head(deck4)
#Now the new set is truly shuffled. You’ll be finished once you wrap these steps into a function.
#Use the preceding ideas to write a shuffle function. shuffle should take a data frame and return 
#a shuffled copy of the data frame.

shuffle <- function(cards) {
  random <- sample(1:52, size = 52)
  cards[random, ]
}

#Now you can shuffle your cards between each deal:
deal(deck)
deck2 <- shuffle(deck)
deal(deck2)
deck3 <- shuffle(deck2)
deal(deck3)


#You can extract values from data frames and lists with the $ syntax.
deck$value
# From time to time, you’ll want to run a function like mean or median on the values in a variable. 
mean(deck$value)
median(deck$value)
#You can use the same $ notation with the elements of a list, if they have names. This notation has 
#an advantage with lists, too. If you subset a list in the usual way, R will return a new list that 
#has the elements you requested. This is true even if you only request a single element.
#To see this, first make a list:
lst <- list(numbers = c(1, 2), logical = TRUE, strings = c("a", "b", "c"))
#It would be horrible if once you stored a vector in a list, you could only ever get it back as a list.
#When you use the $ notation, R will return the selected values as they are, with no list structure around 
#them:
lst$numbers
lst$logical  
lst$strings
#You can then immediately feed the results to a function:
sum(lst$numbers)
#If the elements in your list do not have names (or you do not wish to use the names), you can use two 
#brackets, instead of one, to subset the list.
lst[[1]]
#This will do the same operation as the $ operator.

#================================================Chapter 5==================================================
#Start by making a copy of deck that you can manipulate:
deck2 <- deck

#You can use R’s notation system to modify values within an R object.
#For example:
vec <- c(0, 0, 0, 0, 0, 0)
vec
vec[1]
vec[1] <- 1000
vec[1]

#You can replace multiple values at once as long as the number of new values equals 
#the number of selected values:
vec[c(1, 3, 5)] <- c(1, 1, 1)
vec
#You can also create values that do not yet exist in your object. R will expand 
#the object to accommodate the new values:
vec[7] <- 77
vec

#This provides a great way to add new variables to your data set:
deck$new <- 1:52
head(deck)
#You can also remove columns from a data frame (and elements from a list) 
#by assigning them the symbol NULL:
deck$new <- NULL
head(deck, 13)

#To play war, you just need to change the values of your aces from 1 to 14.
deck2$value[c(13, 26, 39, 52)] <- 14
head(deck2, 13)

#However, to be more efficient, why not ask R to find all the aces for you? What if you
#didnt know in which position your points were?

#########################Logical subsetting###############################
#We can use a logical test in order to find our ace value by using logical operators:
1>2
1>=c(1, 2, 0, 3, 1)
c(1, 2, 3) == c(3, 2, 1)


#. If you compare objects of different data types, R will use its coercion rules 
#to coerce the objects to the same type before it makes the comparison.
deck2$face
deck2$face == "ace"
sum(deck2$face == "ace")

#You can use this method to spot and then change the aces in your deck—even 
#if you’ve shuffled your cards. First, build a logical test that identifies 
#the aces in your shuffled deck:
deck3$value[deck2$face == "ace"] <- 14
head(deck3, 26)

#Let’s put logical subsetting to use with a new game: hearts. In hearts, 
#every card has a value of zero, except cards in the suit of hearts and the queen of spades:
#Each card in the suit of hearts has a value of 1 the queen of spades has the most unusual 
#value of all: she’s worth 13 points.
deck4 <- deck
deck4$value <- 0
head(deck4, 13)

deck4$suit == "hearts"
deck4$value[deck4$suit == "hearts"] <- 1
tail(deck4)

#What you really want to find is all of the cards that have both a face value equal to queen 
#and a suit value equal to spades. You can do that with a Boolean operator. Boolean operators 
#combine multiple logical tests together into a single test.
#Boolean operators are things like and (&) and or (|).
#R has six boolean operators:
#&
#|
#xor (written as xor(cond1, cond2), meaning is exactly one of cond1 and cond2 true?)
#! (written as !cond1, meaning: is cond1 false? (e.g. !flips the results of a logical test))
#any (written any(cond1, cond2, cond3,...condk), meaning: are any of the conditions true?)
#all (written all(cond1, cond2, cond3,...condk)), meaning are all of the conditions true?)

#To use a Boolean operator, place it between two complete logical tests.
#When used with vectors, Boolean operators will follow the same element-wise execution as 
#arithmetic and logical operators:
a <- c(1, 2, 3)
b <- c(1, 2, 3)
c <- c(1, 2, 4)

a==b
b==a
c==a
a==c
b==c
a==b & b==c
#Could you use a Boolean operator to locate the queen of spades in your deck? Of course you can. 
#You want to test each card to see if it is both a queen and a spade. You can write this test in R with:
deck4$face == "queen" & deck4$suit == "spades" 
#save the results of this test to its own object. That will make the results easier to work with:
QueenOfSpades <- deck4$face == "queen" & deck4$suit == "spades" 
QueenOfSpades
#Next, you can use the test as an index to select the value of the queen of spades. Make
#sure the test actually selects the correct value:
deck4[QueenOfSpades,]
#Notice: selecting correct dimensions.  Because you selected a column, it wasnt necessary to indicate this
#when you subseted deck4$value[QueenOfSpades]
deck4$value[QueenOfSpades]
#Now that you’ve found the queen of spades, you can update her value:
deck4$value[QueenOfSpades] <- 13
deck4[QueenOfSpades,]

#===========================Logical test exercise==============================
#Note:a!=b; != is a logical operator meaning is A not equal to B.  a %in% c(a, b, c) where %in% means is 
#A in the group c(a, b, c)?

#Is w postive?
w <- c(-1, 0, 1)
w>0
#Is x greater than 10 and less than 20?
x <- c(5, 15)
x>10 & x< 20
#Is object y the word 'February'?
y <- "February"
y=="February"
#Is every value in z a day of the week?
z <- c("Monday", "Tuesday", "Friday")
all(z %in% c("Monday", "Tuesday", "Wednesday", 
             "Thursday", "Friday", "Saturday", "Sunday"))

#===============================================================================
#Let’s consider one last game, blackjack.
deck5 <- deck
head(deck5, 13)
#You can change the value of the face cards in one fell swoop with %in%:
facecard <- deck5$face %in% c("king", "queen", "jack")
deck5[facecard, ]
deck5$value[facecard]
deck5$value[facecard] <- 10
head(deck5, 13)

#Now you just need to fix the ace values—or do you? It is hard to decide what value to give the 
#aces because their exact value will change from hand to hand. At the end of each hand, an ace 
#will equal 11 if the sum of the player’s cards does not exceed 21. Otherwise, the ace will equal 1.

#==============================Missing information==============================
# If even one of the values is NA, your result will be NA:
#na.rm, which stands for NA remove. R will ignore NAs when it evaluates a function 
#if you add the argument na.rm = TRUE:
mean(c(NA, 1:50), na.rm = TRUE)
#R supplies a special function that can test whether a value is an NA. The function 
#is sensibly named is.na:
is.na(NA)
vec <- c(1, 2, 3, 4, 5, 6, NA)
is.na(vec)


#Let’s set all of your ace values to NA. This will accomplish two things. First, it will 
#remind you that you do not know the final value of each ace. Second, it will prevent you 
#from accidentally scoring a hand that has an ace before you determine the ace’s final value.
deck5$value[deck5$face == "ace"] <- NA 
head(deck5, 13)

#==============================Environments======================================
#Each object is saved inside of an environment, a list-like object that resembles a folder on your 
#computer. Each environment is con‐ nected to a parent environment, a higher-level environment, 
#which creates a hierarchy of environments.
#You can see R’s environment system with the parenvs function in the devtools package.
#parenvs(all = TRUE) will return a list of the environments that your R session is using.
library(devtools)
library(pryr)
parenvs(all = TRUE)
#R comes with some helper functions that you can use to explore your environment tree. First, you can 
#refer to any of the environments in your tree with as.environment.as.environment takes an 
#environment name (as a character string) and returns the corresponding environment:
as.environment("package:stats")
#Three environments in your tree also come with their own accessor functions. These are the global 
#environment (R_GlobalEnv), the base environment (base), and the empty environment (R_EmptyEnv). 
#You can refer to them with:
globalenv()
baseenv()
emptyenv()
#Next, you can look up an environment’s parent with parent.env:
parent.env(globalenv())
#You can view the objects saved in an environment with ls or ls.str. 
#ls will return just the object names, but ls.str will display a little about each object’s structure:
ls(emptyenv())
ls.str(globalenv())
#The empty environment is—not surprisingly—empty; the base environment has too many objects to list here;
#and the global environment has some familiar faces. It is where R has saved all of the objects that you’ve 
#created so far.
#You can use R’s $ syntax to access an object in a specific environment. For example, you can access deck 
#from the global environment:
head(globalenv()$deck, 3)
#And you can use the assign function to save an object into a particular environment. First give assign 
#the name of the new object (as a character string). Then give assign the value of the new object, and 
#finally the environment to save the object in:
assign("new", "Hello Global", envir = globalenv())
globalenv()$new
#Notice that assign works similar to <-. If an object already exists with the given name in the given 
#environment, assign will overwrite it without asking for permission. This makes assign useful for 
#updating objects but creates the potential for heartache.

#=======================================The active Environment=============================================
#If you call an object at the command line, R will look for the object in the global environment and then 
#the parents of the global environment, working its way up the environment tree one environment at a time.
environment()
new
new <- "Hello Active"
new
show_env <- function() {
  list(ran.in = environment(), 
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}
show_env()
#You can look up a function’s origin environment by running environment on the function:
environment(show_env)
#The environment doesn't need to be the global env.  For example:
environment(parenvs)
#The environment will be whichever environment the function was first created in.  R will store 
#any objects created by a function in its runtime environment. Why? Because the runtime environment 
#will be the active environment when those objects are created.  For example:
show_env <- function() {
  a <- 1
  b <- 2
  c <- 3
  list(ran.in = environment(), 
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}
show_env()

#If a function has arguments, R will copy over each argument to the runtime environment.
foo <- "take me to your runtime"

show_env <- function(x = foo) {
  a <- 1
  b <- 2
  c <- 3
  list(ran.in = environment(), 
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}
show_env()


deal <- function() {
  deck[1, ]
}
#Notice that deal no longer takes an argument, and it calls the deck object, 
#which lives in the global environment.
environment(deal)
deal()

#Now let’s fix the deal function to remove the cards it has dealt from deck. 
#Recall that deal returns the top card of deck but does not remove the card from 
#the deck. As a result, deal always returns the same card:
deal()
deal()
#You know enough R syntax to remove the top card of deck. The following code will 
#save a prisitine copy of deck and then remove the top card:
DECK <- deck
deck <- deck[-1, ]
head(deck, 3)

#Now let’s add the code to deal. Here deal saves (and then returns) the top card of deck. 
#In between, it removes the card from deck...or does it?
deal <- function() {
  card <- deck[1, ]
  deck <- deck[-1, ]
  card
}
deal()
#This code won’t work because R will be in a runtime environment when it executes deck <- deck[-1, ]. 
#Instead of overwriting the global copy of deck with deck[-1, ], deal will just create a slightly 
#altered copy of deck in its runtime environment.
#You can assign an object to a specific environment with the assign function:
deal <- function() {
  card <- deck[1, ]
  assign("deck", deck[-1, ], envir = globalenv())
  card
}
#Now deal will finally clean up the global copy of deck, and we can deal cards just as we 
#would in real life:
deal()
deal()
deal()
#Let’s turn our attention to the shuffle function:
shuffle <- function(cards) {
  random <- sample(1:52, size = 52)
  cards[random, ]
}
#shuffle(deck) doesn’t shuffle the deck object; it returns a shuffled copy of the deck object:
head(deck, 3)
a <- shuffle(deck)
head(deck, 3)
head(a, 3)
#It would be better if shuffle returned the dealt cards to the deck and then shuffled.
#Rewrite shuffle so that it replaces the copy of deck that lives in the global environment with a 
#shuffled version of DECK, the intact copy of deck that also lives in the global environment. 
#The new version of shuffle should have no arguments and return no output.
#You can update shuffle in the same way that you updated deck. The following version will do the job:
shuffle <- function(cards) {
  random <- sample(1:52, size = 52)
  assign("deck", DECK[random, ], envir = globalenv())
}


#=============================================Closures============================================
#Our system finally works. For example, you can shuffle the cards and then deal a hand of blackjack:
shuffle()
deal()
deal()
deal()

#But the system requires deck and DECK to exist in the global environment. Lots of things happen in this 
#environment, and it is possible that deck may get modified or erased by accident.
#You could create a function that takes deck as an argument and saves a copy of deck as DECK. 
#The function could also save its own copies of deal and shuffle:
setup <- function(deck) {
  DECK <- deck
  
  DEAL <- function() {
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = globalenv())
    card
  }
  
  SHUFFLE <- function() {
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = globalenv())
  }
}
#Now all of these things are safely out of the way in a child of the global environment. 
#That makes them safe but hard to use. Let’s ask setup to return DEAL and SHUFFLE so we can 
#use them. The best way to do this is to return the functions as a list:
setup <- function(deck) {
  DECK <- deck
  
  DEAL <- function() {
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = globalenv())
    card
  }
  
  SHUFFLE <- function() {
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = globalenv())
  }
  
  list(deal = DEAL, shuffle = SHUFFLE)
}
cards <- setup(deck)
#Then you can save each of the elements of the list to a dedicated object in the global environment:
deal <- cards$deal
shuffle <- cards$shuffle
deal
shuffle
environment(deal)
environment(shuffle)
#now when you run deal or shuffle, R will evaluate the functions in a runtime environment that uses 
#a runtime environement as its parent. DECK and deck will be in this parent environment, which means 
#that deal and shuffle will be able to find them at runtime. DECK and deck will be in the functions’ 
#search path but still out of the way in every other respect.  This arrangement is called a closure. 
#setup’s runtime environment “encloses” the deal and shuffle functions. Both deal and shuffle can work 
#closely with the objects contained in the enclosing environment, but almost nothing else can. 
#The enclosing environment is not on the search path for any other R function or environment.

# Instead of having each function reference the global environment to update deck, you can have them 
#reference their parent environment at runtime.
setup <- function(deck){
  DECK <- deck
  
  DEAL <- function(){
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = parent.env(environment()))
    card
  }
  
  SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = parent.env(environment()))
  }
  
  list(deal = DEAL, shuffle = SHUFFLE)
}

cards <- setup(deck)
deal <- cards$deal
shuffle <- cards$shuffle
#We finally have a self-contained card game. You can delete (or modify) the global copy of deck as 
#much as you want and still play cards. deal and shuffle will use the pristine, protected copy of deck:
#rm(object) removes objects from a specificed environment
rm(deck)
shuffle()
deal()

#the real value of understanding the environment system comes from knowing how R functions do their job. 
#You can use this knowledge to figure out what is going wrong when a function does not perform as expected.

# Some of the things can be done with functions that already exist in R and its packages, but others cannot.
#You will be the most versatile as a data scientist if you can write your own programs for computers to 
#follow.

#============================================Project 3: Slot Machine=======================================
#The play function will need to do two things. First, it will need to randomly generate three symbols; 
#and, second, it will need to calculate a prize based on those symbols.

#The first step is easy to simulate. You can randomly generate three symbols with the sample function—just 
#like you randomly “rolled” two dice in Part I.
get_symbols <- function() {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE, 
         prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}
#You can use get_symbols to generate the symbols used in your slot machine:
get_symbols()

#To create your play function, you will need to write a program that can take the output of get_symbols 
#and calculate the correct prize.
#In R, programs are saved either as R scripts or as functions. We’ll save your program as a function named 
#score. When you are finished, you will be able to use score to calculate a prize.

#Note: The print command prints its output to the console window, which makes print a useful way to display 
#messages from within the body of a function. The print command prints its output to the console window — 
#even if R calls it from within a function.


#Scoring slot-machine results is a complex task that will require a complex algorithm. You can make this, 
#and other coding tasks, easier by using a simple strategy:
#1. Break complex tasks into simple subtasks.
#2. Use concrete examples.
#3. Describe your solutions in English, then convert them to R.

#R programs contain two types of subtasks: sequential steps and parallel cases.

#=============================================Sequential Steps=================================================
#To have R execute steps in sequence, place the steps one after another in an R script or function body.
play <- function() {
  #step 1:generate symbols
  symbols <- get_symbols()
  
  #step 2: display the symbols
  print(symbols())
  
  #step 3: score the symbols
  score(symbols())
}

#==========================================Parallel Cases=====================================================
#Another way to divide a task is to spot groups of similar cases within the task. Some tasks require 
#different algorithms for different groups of input. If you can identify those groups, you can work out 
#their algorithms one at a time.

######If statements

#Linking cases together in parallel requires a bit of structure; your program faces a fork in the road 
#whenever it must choose between cases. You can help the program navigate this fork with an if statement.
#An if statement tells R to do a certain task for a certain case. In English you would say something like, 
#“If this is true, do that.” In R, you would say:
if (this) {
  that
}
#The this object should be a logical test or an R expression that evaluates to a single TRUE or FALSE. 
#If TRUE, R will run the code.  If FALSE, R will skip the code.
#E.g.
#TRUE
num <- -2

if (num < 0) {
  num <- num * -1
}

num

#FALSE
num <- 4

if (num < 0) {
  num <- num * -1
}
num

#The condition of an if statement must evaluate to a single TRUE or FALSE. If the condition creates a 
#vector of TRUEs and FALSEs (which is easier to make than you may think), your if statement will print 
#a warning message and use only the first element of the vector. Remember that you can condense vectors 
#of logical values to a single TRUE or FALSE with the functions any and all.

###########else Statements
#if statements tell R what to do when your condition is true, but you can also tell R what to do when the 
#condition is false. else is a counterpart to if that extends an if statement to include a second case. 
#In English, you would say, “If this is true, do plan A; else do plan B.” In R, you would say:
if (this) {
  PlanA
} else {
  PlanB
}

#For example, you could write some code that rounds a decimal to the nearest integer.
a <- 3.14
#trunc returns the value to the left on an integer.  However you can change this with x - trunc(x)
dec <- a - trunc(a)
dec
#Then use an if else tree to round the number (either up or down):
if (dec >= 0.5) {
  a <- trunc(a) + 1
} else {
  a <- trunc(a)
}
a
#If your situation has more than two mutually exclusive cases, you can string multiple if and else 
#statements together by adding a new if statement immediately after else. For example:
a <- 1
b <- 1

if (a>b) {
  print("A wins!")
} else if (a<b) {
  print("B wins!")
} else {
  print("Tie.")
}

#####################
#we’ve reduced the program to eight simple subtasks:
#1. Test whether the symbols are three of a kind.
#2. Test whether the symbols are all bars.
#3. Look up the prize for three of a kind based on the common symbol. 
#4. Assign a prize of $5.
#5. Count the number of cherries.
#6. Count the number of diamonds.
#7. Calculate a prize based on the number of cherries.
#8. Adjust the prize for diamonds.

##The first subtask asks you to test whether the symbols are three of a kind. 
#How should you begin writing the code for this subtask?
#You can save yourself time and headaches if you focus on one subtask at a time.  This is so that you 
#can check whether each subtask is functioning correctly.


#After you set up a concrete example, try to describe how you will do the subtask in English. The more 
#precisely you can describe your solution, the easier it will be to write your R code.
#Our first subtask asks us to “test whether the symbols are three of a kind.”
#A vector named symbols will contain three of the same symbol if the first element of symbols is equal 
#to the second element of symbols and the second element of symbols is equal to the third element of symbols.

#Here are a couple of ways to test that symbols contains three of the same symbol. The first method 
#parallels the English suggestion above.

symbols <- c("7", "7", "7")
symbols[1] == symbols[2] & symbols[2] == symbols[3]
symbols[1] == symbols[2] & symbols[1] == symbols[3]
#Therefore:
all(symbols == symbols[1])

#As your vocabulary of R functions broadens, you’ll think of more ways to do basic tasks. One method that I 
#like for checking three of a kind is:
length(unique(symbols) == 1)
#The unique function returns every unique term that appears in a vector. If your symbols vector contains 
#three of a kind (i.e., one unique term that appears three times), then unique(symbols) will return a 
#vector of length 1.


same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
same
#&& and || behave like & and | but can sometimes be more efficient. The double operators will not evaluate 
#the second test in a pair of tests if the first test makes the result clear. For example, if symbols[1] 
#does not equal symbols[2] in the next expression, && will not evaluate symbols[2] == symbols[3]; it can 
#immediately return a FALSE for the whole expression.  However, double operators are not appropriate 
#everywhere. && and || are not vectorized, which means they can only handle a single logical test on 
#each side of the operator.

#if (same) {
#  prize <-  #look up the prize
#} else if (#Case 2: all bars) {
# prize <- #assign $5
#} else {
  #count cherries
#  prize <- #calculate a prize
#}


#count diamonds
#double the prize if necessary

#The second prize case occurs when all the symbols are a type of bar, for example, B, BB, and BBB.
symbols <- c("B", "BB", "BBB")
#Use R’s logical and Boolean operators to write a test that will determine whether a vector named symbols 
#contains only symbols that are a type of bar.  you could write a very long test that uses multiple Boolean 
#operators, like this:
symbols[1] == "B" | symbols[1] == "BB" | symbols[1] == "BBB" &
  symbols[2] == "B" | symbols[2] == "BB" | symbols[2] == "BBB" &
  symbols[3] == "B" | symbols[2] == "BB" | symbols[2] == "BBB"
#However, this is not a very efficient solution, because R has to run nine logical tests.
#You can often replace multiple | operators with a single %in%.
#Also, you can check that a test is true for each element in a vector with all.
all(symbols %in% c ("B", "BB", "BBB"))
#Let’s add this code to our script:
#bars <- all(symbols %in% c ("B", "BB", "BBB"))

#if (same) {
#  prize <- #look up the prize
#} else if (all(bars)) {
#  prize <- #assign 5$
#} else {
  #count cherries
#  prize <- #calculate a prize
#}

#count diamonds
#double the prize if necessary

#Our next subtask is to assign a prize for symbols.  This suggests another if tree. You could assign a prize
#with some code like this:
#if (same) {
#  symbol <- symbols[1]
#  if (symbol == "DD") {
#    prize <- 800
# } else if (symbol == "7") {
#    prize <- 80
#  } else if (symbol == "BBB") {
#    prize <- 40
# } else if (symbol == "BB") {
#    prize <- 5
#  } else if (symbol == "B") {
#    prize <- 10
#  } else if (symbol == "C") {
#   prize <- 10
#  } else if (symbol == "0") {
#    prize <- 0
#  }
#}
#Although this works, we can do better with a different method.

#=========================================Lookup Tables=======================================================
#Very often in R, the simplest way to do something will involve subsetting.  Since you know the exact 
#relationship between the symbols and their prizes, you can create a vector that captures this information. 
#This vector can store symbols as names and prize values as elements:
payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, 
             "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
payouts
#Now you can extract the correct prize for any symbol by subsetting the vector with the symbol’s name:
payouts["DD"]
payouts["B"]
#If you want to leave behind the symbol’s name when subsetting, you can run the un name function on 
#the output.  Only the value of the input symbol is returned:
unname(payouts["B"])
#Sadly, our method is not quite automatic; we need to tell R which symbol to look up in payouts. 
#Or do we? What would happen if you subsetted payouts by symbols[1]? Give it a try:
symbols <- c("7", "7", "7")
symbols[1]

payouts[symbols[1]]

symbols <- c("C", "C", "C")
symbols[1]

payouts[symbols[1]]
#You don’t need to know the exact symbol to look up because you can tell R to look up whichever symbol 
#happens to be in symbols.  Let’s add it to our code and then look at Case 2:
#same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
#bars <- all(symbols %in% c ("B", "BB", "BBB"))

#if (same) {
#  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40,
#               "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
#  prize <- unname(payouts[symbols[1]])
#} else if (all(bars)) {
#  prize <- #assign $5
#} else {
  #count cherries
#  prize <- #calculate prize
#}

#count diamonds
#double the prize if necessary

#Case 2 occurs whenever the symbols are all bars. In that case, the prize will be $5, 
#which is easy to assign:
#same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
#bars <- all(symbols %in% c ("B", "BB", "BBB"))

#if (same) {
#  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40,
#               "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
#  prize <- unname(payouts[symbols[1]])
#} else if (all(bars)) {
#  prize <- 5
#} else {
#  #count cherries
#  prize <- #calculate a prize
#}
#count diamonds
#double the prize if necessary


#==============Exercise============
#How can you tell which elements of a vector named symbols are a C? Devise a test and try it out.
symbols <- c("C", "DD", "C")
#One way to test for cherries would be to check which, if any, of the symbols are a C:
symbols == "C"
#It’d be even more useful to count how many of the symbols are cherries. You can do this with sum, 
#which expects numeric input, not logical.
sum(symbols == "C")
#You can use the same method to count the number of diamonds in symbols:
sum(symbols == "DD")
#==================================
#Let’s add both of these subtasks to the program skeleton:
#if (same) {
#  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40,
#               "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
#  prize <- unname(payouts[symbols[1]])
#} else if (all(bars)) {
#  prize <- 5
#} else {
#  cherries <- sum(symbols == "C")
#  prize <- #calc. prize
#}
#diamonds <- sum(symbols == "DD")
#double the prize if necessary

#In Case 3 will only be applied to players that do not have three of a kind or all bars. 
#According to the slot machine’s payout scheme, these players will win $5 if they have two cherries 
#and $2 if they have one cherry. If the player has no cherries, she gets a prize of $0. 
#We don’t need to worry about three cherries because that outcome is already covered in Case 1.

#As in Case 1, you could write an if tree that handles each combination of cherries, 
#but just like in Case 1, this would be an inefficient solution:
#if (cherries == 2) {
#  prize <- 5
#} else if (cherries == 1) {
#  prize <- 2
#} else {
#  prize <- 0
#}
#Again, I think the best solution will involve subsetting.
#We know that our prize should be $0 if we have no cherries, $2 if we have one cherry, 
#and $5 if we have two cherries. You can create a vector that contains this information. 
#This will be a very simple lookup table:
#c(0, 2, 5)[2] + 1 
#cherries isn’t exactly suited for integer subsetting because it could contain a zero, but that’s easy 
#to fix. We can subset with cherries + 1. Now when cherries equals zero, we have:
#c(0, 2, 5)[cherries + 1] 
## 0
#When cherries equals one, we have: cherries + 1
## 2
#c(0, 2, 5)[cherries + 1] 
## 2

# Then add the code to your script, as follows:
same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
bars <- all(symbols %in% c ("B", "BB", "BBB"))

if (same) {
  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40,
               "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
  prize <- unname(payouts[symbols[1]])
} else if (all(bars)) {
  prize <- 5
} else {
  cherries <- sum(symbols == "C")
  prize <- c(0, 2, 5)[cherries + 1]
}
diamonds <- sum(symbols == "DD")
#double prize if necessary

#============
#if trees are not appropriate everywhere.  if trees have a couple of drawbacks. First, 
#they require R to run multiple tests as it works its way down the if tree, which can create
#unnecessary work. Second, as you’ll see in Chapter 10, it can be difficult to use if trees 
#in vectorized code, a style of code that takes advantage of R’s programming strengths to 
#create fast programs. Lookup tables do not suffer from either of these drawbacks.

#As a general rule, use an if tree if each branch of the tree runs different code. 
#Use a lookup table if each branch of the tree only assigns a different value.
#=============
#The final subtask is to double the prize once for every diamond present. This means that the final prize 
#will be some multiple of the current prize.
#Here is a concise solution inspired by the previous pattern. The adjusted prize will equal:
#prize * 2 ^ diamonds

#=======================================Code Comments===============================================
#omments can make your code easier to understand by explaining why the code does what it does. 
#You can also use comments to break long programs into scannable chunks.

#identify case
same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
bars <- all(symbols %in% c ("B", "BB", "BBB"))

#get prize
if (same) {
  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40,
               "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
  prize <- unname(payouts[symbols[1]])
} else if (all(bars)) {
  prize <- 5
} else {
  cherries <- sum(symbols == "C")
  prize <- c(0, 2, 5)[cherries + 1]
}

#adjust for diamonds
diamonds <- sum(symbols == "DD")
prize * 2^ diamonds


#Now that each part of your code works, you can wrap it into a function:
#Often the concrete examples that you used to test your code, like symbols, 
#will become the arguments of your function.


score <- function(symbols) {
  #identify case
  same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
  bars <- all(symbols %in% c ("B", "BB", "BBB"))
  
  #get prize
  if (same) {
    payouts <- c("DD" = 100, "7" = 80, "BBB" = 40,
                 "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
    prize <- unname(payouts[symbols[1]])
  } else if (all(bars)) {
    prize <- 5
  } else {
    cherries <- sum(symbols == "C")
    prize <- c(0, 2, 5)[cherries + 1]
  }
  
  #adjust for diamonds
  diamonds <- sum(symbols == "DD")
  prize * 2 ^ diamonds 
}
#Once you have defined the score function, the play function will work as well:
play <- function() {
  #step 1:generate symbols
  symbols <- get_symbols()
  #step 2: display the symbols
  print(symbols)
  #step 3: score the symbols
  score(symbols)
}
play()
#==============================================Summary======================================================
# Divide the job before you into simple tasks, and then divide the tasks again. You can visualize 
#the relationship between tasks with a flow chart if it helps. Then work on the subtasks one at a time. 
#Describe solutions in English, then convert them to R code. Test each solution against concrete examples
#as you go. Once each of your subtasks work, combine your code into a function 
#that you can share and reuse.   You can manage cases with if and else statements. 
#You can create a lookup table with objects and subsetting. You can add code comments with #. 
#And you can save your programs as a function with function.  It should be easy to find the source of your 
#errors if you use a stepwise approach to writing functions, writing—and then testing—one bit at a time. 
#However, if the source of an error eludes you, or you find yourself working with large chunks of untested 
#code, consider using R’s built in debug‐ ging tools.

#=========================================R's S3 system====================================================

#The slot machine doesn't display the total winnings in $'s; nor are we able to save the symbols
#of our previous turn due to the use of calling print() within the play () function.  You can fix these
#problems using R's S3 system.

#The S3 system is a class system built within R.  The system governs how R handles objects of different
#classes.  Certain R functions with look up an object's S3 class, and then behave differently in 
#response.  

#For example, the print () function is like this.  When you print a numeric vector, print() will
#display a number:
num <- 1000000000
print(num)
#However, if you give the number an S3 class POSIXct followed by POSIXt, print will display
#a time:
class(num) <- c("POSIXct", "POSIXt")
print(num)
#If you use objects with classes, you will need to understand how to use R's S3 system.
#R's S3 system is built around three core components: attributes(especially the class aatribute),
#generic functions, and methods.

######Attributes########
#Attributes do not affect the values of the object, but stick to the object as a type of metadata that R
#can use to handle the object.  E.g. a data frame stores its row and column names as attributes.

#You can see an objects attribute by using the attribute(object) command.
attributes(DECK)
#We know names(), dim(), and class() functions.  However, has many more:
row.names(DECK)
#You can use these fucntions to retrieve an attribute's value.  Or, you can also use them
#to change an attributes value.
row.names(DECK) <- 101:152
#or to give an object a new attribute all together:
levels(DECK) <- c("level 1", "level 2", "level 3")
attributes(DECK)
#R will let you add any attributes that you like to an object.  The only time that R will complain is
#when a function needs to find an attribute and it is not there.
#You can add any general attribute to an object with attr; you can also use attr to look up the value of
#any attribute of an object. Let’s see how this works with one_play, the result of playing our slot machine 
#one time:
one_play <- play()
one_play
attributes(one_play)
#attr takes two arguments: an R object and the name of an attribute.  
#To give the R object an attribute of the specified name, save a value to the output of attr. 
#Let’s give one_play an attribute named symbols that contains a vector of char‐ acter strings:
attr(one_play, "symbols") <- c("B", "0", "B")
attributes(one_play)
#To look up the value of any attribute, give attr an R object and the name of the attribute you would 
#like to look up:
attr(one_play, "symbols")
#you can use attr to display the score symbols and modeify the use of the lazy print() function
#=========================Exercise=======================
#Modify play to return a prize that contains the symbols associated with it as an attribute named 
#symbols. Remove the redundant call to print(symbols):
#play <- function() {
# symbols <- get_symbols()
# print(symbols)
# score(symbols)
#}

#You can create a new version of play by capturing the output of score(symbols) and assigning 
#an attribute to it. play can then return the enhanced version of the output:
play <- function() {
  symbols <- get_symbols()
  prize <- score(symbols)
  attr(prize, "symbols") <- symbols
  prize
}
#Now play returns both the prize and the symbols associated with the prize. The results may not look pretty, 
#but the symbols stick with the prize when we copy it to a new object. We can work on tidying up the display
#in a minute:
play()
two_play <- play()
two_play
#You can also generate a prize and set its attributes in one step with the structure function.
play <- function() {
  symbols <- get_symbols()
  structure(score(symbols), symbols = symbols)
}
three_play <- play()
three_play

#Now that your play output contains a symbols attribute, what can you do with it? You can write your own 
#functions that lookup and use the attribute. For example, the following function will look up one_play’s
#symbols attribute and use it to display one_play in a pretty manner:
slot_display <- function(prize) {
  #extract symbols
  symbols <- attr(prize, "symbols")
  
  #collapse symbols into a single string
  symbols <- paste(symbols, collapse = " ")
  
  #combine symbols with prize as a regular expression
  #\n is regular expression for a new line (i.e. return or enter)
  string <- paste(symbols, prize, sep = "\n$")
  
  #display regular expression in console without quotation marks
  cat(string)
}
slot_display(one_play)
#The first line of the function will look up the value of the symbols attribute and save it as an object 
#named symbols.  Let's make an example symbols object so we can see what the rest of the function does.
#We can use one_play's symbols attribute to do the job.  symbols will be a vector of 3 character strings.
symbols <- attr(one_play, "symbols")
symbols
#Next, slot_display uses paste() to collapse the three strings in symbols into a single character string.
#pase collapses a vector of character strings into a single string when you give it the collapse argument.
#paste will use the value of collapse to seperate the formerly distinct strings.  Hence, symbols becomes
#B 0 B the three strings seperated by a space:
symbols <- paste(symbols, collapse = " ")
symbols
#HTherefore, you can now use slot_display to manually clean the output of play()
slot_display(play())
slot_display(play())
slot_display(play())
#This method of cleaning the output requires you to manually intervene in your R session 
#(to call slot_display). There is a function that you can use to automatically clean up the output 
#of play each time it is displayed. This function is print, and it is a generic function.

#======================================Generic Functions=====================================================
#print call also explains why the output of print always matches what you see when you display an object 
#at the command line:
print(pi)
pi
print(head(deck2))
head(deck2)
print(play())
play()
# a generic function. This means that print is written in a way that lets it do different things in 
#different cases. You’ve already seen this behavior in action (although you may not have realized it). 
#print did one thing when we looked at the unclassed version of num:
num <- 1000000000
print(num)
#and a different thing when we gave num a class:
class(num) <- c("POSIXct", "POSIXt")
print(num)
#Take a look at the code inside print to see how it does this. 
print
#You may imagine that print looks up the class attribute of its input and then uses an if tree to pick w
#hich output to display. If this occurred to you, great job! print does something very similar, but much 
#more simple.

#=================================================Methods====================================================

#When you call print, print calls a special function, UseMethod:
print
#UseMethod examines the class of the input that you provide for the first argument of print(), and then
#passes all of your arguments to a new function designed to handle that class of input.  For example, 
#when you give print() a POSIXct object, UseMethod will pass all of print's() arguments to print.POSIXct.
#R will then run print.POSIXct and return the results:
print.POSIXct

#If you give print() a factor object, UseMethod will pass all of print's() arguments to print.factor.
#R will then run print.factor and return the results.
print.factor

#print.POSIXct and print.factor are called methods of print.
#By themselves, print.POSIXct and print.factor work like regular R functions.  However, each was written
#specifically so UseMethod could call it to handle a specific class of print() input.  Therefore, UseMethod
#allows for the print() function to call a specialised method that can interpret the class of print's() 
#first argument.
#You can see which methods exist for a generic function by calling methods on the function.
#For example, print has almost 200 methods (which gives you an idea of how many classes exist in R):
methods(print)
#This system of generic functions, methods, and class-based dispatch is known as S3 because it originated 
#in the third version of S, the programming language that would evolve into S-PLUS and R.

#The S3 system allows R functions to behave in different ways for different classes. You can use S3 to 
#format your slot output. First, give your output its own class. Then write a print method for that class. 
#To do this efficiently, you will need to know a little about how UseMethod selects a method function to use.

#=============================================Method Dispatch================================================
#Every S3 method has a two-part name.  The first part of the name will refer to the function that the method
#works with.  The second part will refer to the class. These two parts are seperated by a period, for example
#summary.matrix, and so on.

#When UseMethod needs to call a method, it searches for an R function with the correct S3-style name.  The
#function does not have to be special in any way; it just needs to have the correct name.

#You can participate in this system by writing your own function and giving it a valid S3-style name. 
#For example, let’s give one_play a class of its own. It doesn’t matter what you call the class; 
#R will store any character string in the class attribute:

class(one_play) <- "slots"
#Now let's write an S3 print method for the slots class.

args(print)

print.slots <- function(x, ...) {
  cat("I'm using the print.slots method")
}

print(one_play)
one_play
rm(print.slots)

#Some R objects have multiple classes. For example, the output of Sys.time has two classes.  Which class
#will UseMethod use to find a print method?

now <- Sys.time()
attributes(now)

#UseMethod will first look for a method that matches the first class listed in the object’s class vector. 
#If UseMethod cannot find one, it will then look for the method that matches the second class 
#(and so on if there are more classes in an object’s class vector).  If you give print an object whose 
#class or classes do not have a print method, UseMe thod will call print.default, a special method 
#written to handle general cases.

#Let’s use this system to write a better print method for the slot machine output.

#======Exercise======
#Write a new print method for the slots class. The method should call slot_display to return well-formatted 
#slot-machine output.
#It is surprisingly easy to write a good print.slots method because we’ve already done all of the hard work 
#when we wrote slot_display.
print.slots <- function(x, ...) {
  slot_display(x)
}
#Now R will automatically use slot_display to display objects of class slots 
#(and only objects of class “slots”):
one_play
#Let’s ensure that every piece of slot machine output has the slots class.

#=====Exercise=====
#Modify the play function so it assigns slots to the class attribute of its output:
#play <- function() {
# symbols <- get_symbols() structure(score(symbols), symbols = symbols)
#}

#You can set the class attribute of the output at the same time that you set the sym bols attribute. 
#Just add class = "slots" to the structure call:
play <- function() {
  symbols <- get_symbols()
  structure(score(symbols), symbols = symbols, class = "slots")
}

#Now each of our slot machine plays will have the class slots:
class(play())
#As a result, R will display them in the correct slot-machine format:
play()
play()

#==============================================Classes======================================================
#To make a class:

#1. Choose a name for your class.
#2. Assign each instance of your class a class attribute.
#3. Write class methods for any generic function likely to use objects of your class.
methods(class = "factor")
#When combining objects into a vector, or subsetting an object, R drops the class attribute assigned to the
#object.  You can avoid this behavior by writing a c.slots method and a [.slots method, but then 
#difficulties will quickly accrue. How would you combine the symbols attributes of multiple plays into 
#a vector of symbols attributes? How would you change print.slots to handle vectors of outputs? 
#These challenges are open for you to explore. However, you will usually not have to attempt 
#this type of large-scale programming as a data scientist.

#============================================S3 and Debugging================================================
#UseMethod calls a class-specific method, you can search for and examine the method directly. 
#It will be a function whose name follows the <function.class> syntax, or possibly <function.default>. 
#You can also use the methods function to see what meth‐ ods are associated with a function or a class.


#======Sum
#Values are not the only place to store information in R, and functions are not the only way to create
#uniqiue behaviour.  You can also do both of these things using R's S3 system.  

#The S3 system provides a simple way to create object-specific behaviour in R.  In other words, it is R's
#version of object-orientated programming (OOP).  This system is implemented by generic functions.  These
#functions examine the class attribute of their input and call a class-specific method to generate output.

#R’s S3 system is more helpful for the tasks of computer science than the tasks of data science, 
#but understanding S3 can help you troubleshoot your work in R as a data scientist.

#Chapter 9 will delve into how to automate repition with R's for and while functions.
#You’ll use for to simulate various slot machine plays and to calculate the payout rate of 
#your slot machine.



#======================================Chapter 9: Loops======================================================
#Loops are R's method for repeating a task; this makes them particularly useful for programming
#simulations.

#Your slot machine is modeled after real machines that were accused of fraud. The ma‐ chines appeared to pay 
#out 40 cents on the dollar, but the manufacturer claimed that they paid out 92 cents on the dollar. 
#You can calculate the exact payout rate of your machine with the score program. The payout rate will 
#be the expected value of the slot machine’s prize.

#========Expected values========
#The expected value of a random event is a type of weighted average; it is the sum of each possible outcome
#of the event, weighted by the probability that each outcome occurs.
#You can think of the expected value as the average prize that you would observe if you had to play 
#the slot machine an infinte amount of times

#Let's use the formula to calculate some simple expected values.  Listing combinations of outcomes, for example
#the outcomes of rolling two die, can be tedious; but R has a function that can help.

#======expand.grid
#The expand.grid function in R provides a quick way to write our every combination of the elements in 
#vectors.
#For example, you can list every combination of two dice. To do so, run expand.grid on two copies of die:

rolls <- expand.grid(die, die)
rolls
#You can use expand.grid with more than two vectors if you like. For example, with 3 or even 10 die vectors.
#You can determine the value of each roll once you’ve made your list of outcomes, . 
#This will be the sum of the two dice, which you can calculate using R’s element-wise execution
rolls$value <- rolls$Var1 + rolls$Var2
head(rolls, 3)

#We suggest a three-step process for calculating these probabilities in R. First, 
#we can look up the probabilities of rolling the values in Var1. We’ll do this with the lookup 
#table that follows:
prob <- c("1" = 1/8, "2" = 1/8, "3" = 1/8, "4" = 1/8, "5" = 1/8, "6" = 3/8)
prob
#If you subset this table by rolls$Var1, you will get a vector of probabilities
#perfectly keyed to the values of Var1:
rolls$Var1
prob[rolls$Var1]

rolls$prob1 <- prob[rolls$Var1]
head(rolls, 3)
#Second, we can look up the probabilities of rolling the values in Var2:
rolls$prob2 <- prob[rolls$Var2]
head(rolls, 3)
#Third, we can calculate the probability of rolling each combination by multiplying prob1 by prob2:
rolls$prob <- rolls$prob1*rolls$prob2
head(rolls, 3)

#It is easy to calculate the expected value now that we have each outcome, the value of each outcome, 
#and the probability of each outcome. The expected value will be the summation of the dice values 
#multiplied by the dice probabilities:
sum(rolls$value*rolls$prob)


#Now that you’ve warmed up, let’s use our method to calculate the expected value of the slot machine prize. 
#We will follow the same steps we just took:
# 1. We will list out every possible outcome of playing the machine. 
#   This will be a list of every combination of three slot symbols.
# 2. We will calculate the probability of getting each combination 
#     when you play the machine.
# 3. We will determine the prize that we would win for each combination.
#==========Exercise=========
#Use expand.grid to make a data frame that contains every possible combination of three symbols 
#from the wheel vector:
wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
#Be sure to add the argument stringsAsFactors = FALSE to your expand.grid call; otherwise, 
#expand.grid will save the combinations as factors, an unfortunate choice that will disrupt 
#the score function.
#To create a data frame of each combination of three symbols, you need to run expand.grid 
#and give it three copies of wheel.
combos <- expand.grid(wheel, wheel, wheel, stringsAsFactors = FALSE)
head(combos)
#Now, let’s calculate the probability of getting each combination.
#You can use the prob‐ abilities contained in the prob argument of get_symbols to do this. 
#These probabilities determine how frequently each symbol is chosen when your slot machine generates 
#symbols. They were calculated after observing 345 plays of the Manitoba video lottery terminals. 
#Zeroes have the largest chance of being selected (0.52) and cherries the least (0.01):
get_symbols <- function() {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE,
         prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}
#=======Exercise======
#Isolate the previous probabilities in a lookup table. What names will you use in your table?
#Your names should match the input that you want to look up.
prob <- c("DD" = 0.03, "7" = 0.03, "BBB" = 0.06, "BB" = 0.1, 
            "B" = 0.25, "C" = 0.01, "0" = 0.52)
#Now let’s look up our probabilities.
#=====Exercise========
#Look up the probabilities of getting the values in Var1. Then add them to combos as a column named prob1. 
#Then do the same for Var2 (prob2) and Var3 (prob3).

combos$prob1 <- prob[combos$Var1]
combos$prob2 <- prob[combos$Var2]
combos$prob3 <- prob[combos$Var3]

head(combos, 3)

#================Exercise==============
#Calculate the overall probabilities for each combination. Save them as a column named prob in combos, 
#then check your work.

#You can calculate the probabilities of every possible combination in one fell swoop with 
#some element-wise execution:
combos$prob <- combos$prob1 * combos$prob2 * combos$prob3

head(combos, 3)
#The sum of the probabilities is one, which suggests that our math is correct:
sum(combos$prob)
#You only need to do one more thing before you can calculate the expected value: 
#you must determine the prize for each combination in combos. You can calculate the prize with score. 
#For example, we can calculate the prize for the first row of combos like this:
symbols <- c(combos[1, 1], combos[1, 2], combos[1, 3])
symbols
score(symbols)
#However there are 343 rows, which makes for tedious work if you plan to calculate the scores manually. 
#It will be quicker to automate this task and have R do it for you, which you can do with a for loop.

#==========================================for Loops=======================================
#A for loop repeats a chunk of code many times, once for each element in a set of input. 
#for loops provide a way to tell R, “Do this for every value of that.” In R syntax, this looks like:
for (value in that) {
  this
}
#The that object should be a set of objects; i.e. vectors of numbers of character strings.
#The for loop will run the code in that appears between the braces once for each member of that. For example:
for (value in c("My", "first", "for", "loop")) {
  print("one run")
}
#The value symbol in a for loop acts like an argument in a function. The for loop will create an object 
#named value and assign it a new value on each run of the loop. The code in your loop can access this value
#by calling the value object.

#What values will the for loop assign to value?
for (value in c("My", "second", "for", "loop")) {
  print(value)
}
#If you look at value after the loop runs, you will see that it still contains the value of the last 
#element in the set:
value
#I’ve been using the symbol value in my for loops, but there is nothing special about it. 
#You can use any symbol you like in your loop to do the same thing as long as the symbol 
#appears before in in the parentheses that follow for. For example, you could rewrite the 
#previous loop with any of the following:
for (word in c("My", "second", "for", "loop")) {
  print(word)
}
for (string in c("My", "second", "for", "loop")) {
  print(string)
}
for (i in c("My", "second", "for", "loop")) {
  print(i)
}
#R will run your loop in whichever environment you call it from. This is bad news if your loop 
#uses object names that already exist in the environment. Your loop will overwrite the existing 
#objects with the objects that it creates. This applies to the value symbol as well. In many 
#programming languages, for loops are designed to work with integers, not sets. You give the loop a 
#starting value and an ending value, as well as an increment to advance the value by between loops. 
#The for loop then runs until the loop value exceeds the ending value.

#You can recreate this effect in R by having a for loop execute on a set of integers, but don’t lose 
#track of the fact that R’s for loops execute on members of a set, not sequences of integers.
#for loops are very useful in programming because they help you connect a piece of code with each element in a set.
#For example, we could use a for loop to run score once for each row in combos. However, 
#R’s for loops have a shortcoming that you’ll want to know about before you start using them: for loops 
#do not return output.

#Therefore, what happens in a for loop stays in a for loop.  If you want to use the products of a for loop, 
#you must write the for loop so that it saves its own output as it goes.
#Our for loops won’t return anything if you remove the print call:
for (value in c("My", "third", "for", "loop")) {
  value
}

#To save output from a for loop, you must write the loop so that it saves its own output as it runs. 
#You can do this by creating an empty vector or list before you run the for loop. Then use the for 
#loop to fill up the vector or list. When the for loop is finished, you’ll be able to access the 
#vector or list, which will now have all of your results.
chars <- vector(length = 4)
#The next loop will fill it with strings:
words <- c("My", "fourth", "for", "loop")

for (i in 1:4) {
  chars[i] <- words[i]
}
chars
#This approach will usually require you to change the sets that you execute your for loop on. 
#Instead of executing on a set of objects, execute on a set of integers that you can use to index 
#both your object and your storage vector. This approach is very common in R. You’ll find in practice 
#that you use for loops not so much to run code, but to fill up vectors and lists with the results of code.

#Let’s use a for loop to calculate the prize for each row in combos. To begin, create a new column in 
#combos to store the results of the for loop:
combos$prize <- NA
head(combos, 3)
#The code creates a new column named prize and fills it with NAs. R uses its recycling rules to populate every 
#value of the column with NA.

#=======Exercise=======
#Construct a for loop that will run score on all 343 rows of combos. The loop should run score on the 
#first three entries of the ith row of combos and should store the results in the ith entry of combos$prize.
for (i in 1:nrow(combos)) {
  symbols <- c(combos[i, 1], combos[i, 2], combos[i, 3])
  combos$prize[i] <- score(symbols)
}
#After you run the for loop, combos$prize will contain the correct prize for each row. 
#This exercise also tests the score function; score appears to work correctly for every possible 
#slot combination:
head(combos, 3)
#We’re now ready to calculate the expected value of the prize. The expected value is the sum of 
#combos$prize weighted by combos$prob. This is also the payout rate of the slot machine:
sum(combos$prize * combos$prob)
#Uh oh. The expected prize is about 0.54, which means our slot machine only pays 54 cents on the 
#dollar over the long run. Does this mean that the manufacturer of the Manitoba slot machines was lying?
#No, because we ignored an important feature of the slot machine when we wrote score: a diamond is wild. 
#You can treat a DD as any other symbol if it increases your prize, with one exception. You cannot make a 
#DD a C unless you already have another C in your symbols (it’d be too easy if every DD automatically earned you $2).
#The best thing about DDs is that their effects are cumulative. For example, consider the combination B, DD, B. 
#Not only does the DD count as a B, which would earn a prize of $10; the DD also doubles the prize to $20.

#Here is a version of score that handles wild diamonds:
score <- function(symbols) {
  
  diamonds <- sum(symbols == "DD")
  cherries <- sum(symbols == "C")
  
  #Identify case
  #since diamonds are a wild card, only nondiamonds
  #matter for three of a kind and all bars
  slots <- symbols[symbols != "DD"]
  same <- length(unique(slots)) == 1
  bars <- slots %in% c("B", "BB", "BBB")
  
  #assign prize
  if (diamonds == 3) {
    prize <- 100
  } else if (same) {
    payouts <- c("7" = 80, "BBB" = 40, "BB" = 25,
                 "B" = 10, "C" = 10, "0" = 0)
    prize <- unname(payouts[slots[1]])
  } else if (all(bars)) {
    prize <- 5
  } else if (cherries > 0) {
    #diamonds counr as cherries
    #so long as there is one real cherry
    prize <- c(0, 2, 5)[cherries + diamonds + 1]
  } else {
    prize <- 0
  }
  
  #double for each diamond
  prize*2^diamonds
}

#To update the expected value, just update combos$prize:
for (i in 1:nrow(combos)) {
  symbols <- c(combos[i, 1], combos[i, 2], combos[i, 3])
  combos$prize[i] <- score(symbols)
}
#Then recompute the expected value:
sum(combos$prize*combos$prob)

#===================================================while loops=====================================================
#R has two companions to the for loop: the while loop and the repeat loop. 
#A while loop reruns a chunk while a certain condition remains TRUE. To create a while loop, 
#follow while by a condition and a chunk of code, like this:
while (condition) {
  this
}
#while will rerun condition, which should be a logical test, at the start of each loop. 
#If condition evaluates to TRUE, while will run the code between its braces. 
#If condition evaluates to FALSE, while will finish the loop.
#If the code has no relationship to the condition, a while loop will run until you stop it. So be careful. 
#You can stop a while loop by hitting Escape or by clicking on the stop-sign icon at the top of the RStudio 
#console pane. The icon will appear once the loop begins to run.

#Like for loops, while loops do not return a result, so you must think about what you want the loop to 
#return and save it to an object during the loop.
#You can use while loops to do things that take a varying number of iterations, 
#like calculating how long it takes to go broke playing slots (as follows). However, 
#in practice, while loops are much less common than for loops in R:
plays_till_broke <- function(start_with) {
  cash <- start_with
  n <- 0
  while (cash > 0) {
    cash <- cash - 1 + play()
    n <- n + 1
  }
  n
}
plays_till_broke(100)

#=============================================repeat loops======================================================
#repeat loops will They will repeat a chunk of code until you tell them to stop (by hitting Escape) 
#or until they encounter the command break, which will stop the loop.

#You can use a repeat loop to recreate plays_till_broke
plays_till_broke <- function(start_with) {
  cash <- start_with
  n <- 0
  while (cash > 0) {
    cash <- cash - 1 + play()
    n <- n + 1
    if (cash <= 0)
    break
  }
  n
}

plays_till_broke(100)


#===============================================Vectorised code=====================================================
#the fastest R code will usually take advantage of three things: logical tests, subsetting, and element-wise 
#execution. These are the things that R does best. Code that uses these things usually has a certain quality: 
#it is vectorized; the code can take a vector of values as input and manipulate each value in the vector at 
#the same time.

#To see what vectorized code looks like, compare these two examples of an absolute value function. 
#Each takes a vector of numbers and transforms it into a vector of absolute values (e.g., positive numbers). 
#The first example is not vectorized; abs_loop uses a for loop to manipulate each element of the vector one 
#at a time:
abs_loop <- function(vec) {
  for (i in 1:length(vec)) {
    if (vec[i] < 0) {
      vec[i] <- -vec[i]
    }
  }
  vec
}

#The second example, abs_set, is a vectorized version of abs_loop. It uses logical sub‐setting to 
#manipulate every negative number in the vector at the same time:
abs_set <- function(vec) {
  negs <- vec < 0
  vec[negs] <- vec[negs] * -1
  vec
}
#abs_setis much faster thanabs_loopbecause it relies on operations that R does quickly: logical tests, 
#subsetting, and element-wise execution. You can use the system.time function to see just how fast abs_set is. 
#system.time takes an R expression, runs it, and then displays how much time elapsed while the expression ran.

#To compare abs_loop and abs_set, first make a long vector of positive and negative numbers. long will contain 
#10 million values:
long <- rep(c(-1, 1), 5000000)
#You can then use system.time to measure how much time it takes each function to evaluate long:
system.time(abs_loop(long))

system.time(abs_set(long))
#Note: Don’t confuse system.time with Sys.time, which returns the current time.
#You can expect similar speed-ups whenever you write vectorized code.

#R comes with a built-in absolute value function, abs.
system.time(abs(long))

#=========================================How to write vectorised code========================================
#1. Use vectorized functions to complete the sequential steps in your program.
#2. Use logical subsetting to handle parallel cases. Try to manipulate every element in a case at once.

#You can identify all of the elements of a vector that fall into a case with a logical test. 
#R will execute the test in element-wise fashion and return a TRUE for every element that
#belongs in the case. For example, vec < 0 identifies every value of vec that belongs to the negative case. 
#You can use the same logical test to extract the set of negative values with logical subsetting:
vec <- c(1, -2, 3, -4, 5, -6, 7, -8, 9, -10)
vec < 0
#The above returns logical test values
vec[vec < 0]
#The above returns the values that are TRUE logicals
vec[vec < 0] * -1

#=================================Exercise==============================
#The following function converts a vector of slot symbols to a vector of new slot symbols. 
#Can you vectorize it? How much faster does the vectorized version work?
change_symbols <- function(vec) { 
  for (i in 1:length(vec)) {
  if (vec[i] == "DD") { 
    vec[i] <- "joker"
  } else if (vec[i] == "C") {
    vec[i] <- "ace"
  } else if (vec[i] == "7") 
    { vec[i] <- "king"
  } else if (vec[i] == "B") { 
    vec[i] <- "queen"
  } else if (vec[i] == "BB") { 
    vec[i] <- "jack"
  } else if (vec[i] == "BBB") { 
    vec[i] <- "ten"
  } else {
    vec[i] <- "nine"
    } 
  }
  vec
}

vec <- c("DD", "C", "7", "B", "BB", "BBB", "0")

change_symbols(vec)

many <- rep(vec, 1000000)
system.time(change_symbols(many))
#To vectorize change_symbols, create a logical test that can identify each case:
vec[vec == "DD"]
vec[vec == "C"]
vec[vec == "7"]
vec[vec == "B"]
vec[vec == "BB"]
vec[vec == "BBB"]
vec[vec == "0"]
#Then write code that can change the symbols for each case:
vec[vec == "DD"] <- "joker"
vec[vec == "C"] <- "ace"
vec[vec == "7"] <- "king"
vec[vec == "B"] <- "queen"
vec[vec == "BB"] <- "jack"
vec[vec == "BBB"] <- "ten"
vec[vec == "0"] <- "nine"
#When you combine this into a function, you have a vectorized version of change_sym bols 
#that runs about 14 times faster:
change_vec <- function (vec) {
  vec[vec == "DD"] <- "joker"
  vec[vec == "C"] <- "ace"
  vec[vec == "7"] <- "king"
  vec[vec == "B"] <- "queen"
  vec[vec == "BB"] <- "jack"
  vec[vec == "BBB"] <- "ten"
  vec[vec == "0"] <- "nine"
  
  vec
}
system.time(change_vec(many))
#Or, even better, use a lookup table. Lookup tables are a vectorized method because they rely on
#R’s vectorized selection operations:
change_vec2 <- function(vec) {
  tb <- c("DD" = "joker", "C" = "ace", "7" = "king", "B" = "queen",
          "BB" = "jack", "BBB" = "ten", "0" = "nine")
  unname(tb[vec])
}
system.time(change_vec2(many))

#This doesn’t mean that you should never use for loops in R. There are still many places in R where for 
#loops make sense. for loops perform a basic task that you cannot always recreate with vectorized code. 
#for loops are also easy to understand and run reasonably fast in R, so long as you take a few precautions.

#=============================================How to write fast for loops==========================================
#First, do as much as you can outside of the for loop. Every line of code that you place inside of the for loop 
#will be run many, many times. If a line of code only needs to be run once, place it outside of the loop to avoid 
#repetition.

#Second, make sure that any storage objects that you use with the loop are large enough to contain all of the 
#results of the loop.

#The current score function is not vectorized. It takes a single slot combination and uses an if tree to assign 
#a prize to it. This combination of an if tree with a for loop suggests that you could write a piece of vectorized 
#code that takes many slot combinations and then uses logical subsetting to operate on them all at once.
#For example, you could rewrite get_symbols to generate n slot combinations and return them as an n × 3 matrix, 
#like the one that follows. Each row of the matrix will contain one slot combination to be scored:

score

# could rewrite get_symbols to generate n slot combinations and return them as an n × 3 matrix, 
#like the one that follows. Each row of the matrix will contain one slot combination to be scored:
get_many_symbols <- function(n) {
  wheel <- c("DD", "7", "C", "B", "BB", "BBB", "0")
  vec <- sample(wheel, size = 3 * n, replace = TRUE,
                prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
  matrix(vec, ncol = 3)
}
get_many_symbols(5)  
#You could also rewrite play to take a parameter, n, and return n prizes, in a data frame:
play
play_many <- function(n) {
  symb_mat <- get_many_symbols(n = n)
  data.frame(w1 = symb_mat[, 1], w2 = symb_mat[, 2],
             w3 = symb_mat[, 3], prize = score_many(symb_mat))
}
#This new function would make it easy to simulate a million, or even 10 million plays of the slot machine, 
#which will be our goal. When we’re finished, you will be able to estimate the payout rate with:
# plays <- play_many(10000000))
# mean(plays$prize)

#Now you just need to write score_many, a vectorized (matix-ized?) version of score that takes 
#an n × 3 matrix and returns n prizes. 
symbols <- matrix(
  c("DD", "DD", "DD", 
    "C", "DD", "0", 
    "B", "B", "B", 
    "B", "BB", "BBB",
    "C", "C", "0",
    "7", "DD", "DD"), nrow = 6, byrow = TRUE)
symbols
#score_many is a vectorized version of score. You can use it to run the simulation at the start of this 
#section in a little over 20 seconds. This is 17 times faster than using a for loop:

#symbols should be a matrix with a coloumn for each slot machine window
score_many <- function(symbols) {
  
  #Step 1: assign base prize based on cherries and diamonds...
  ##Count the number of cherries and diamonds in each combination
  cherries <- rowSums(symbols == "C")
  diamonds <- rowSums(symbols == "DD")
  
  #Wild diamonds count as cherries
  prize <- c(0, 2, 5)[cherries + diamonds + 1]
  
  #...but not if there are zero real cherries
  ##(cherries is coerced to FALSE where cherries == 0)
  prize[!cherries] <- 0
  
  #Step 2: change prize for combinations that contain 3 of a kind
  same <- symbols[, 1] == symbols[, 2] & 
    symbols[, 2] == symbols[, 3]
  payoffs <- c("DD" = 100, "7" = 80, "BBB" = 40,
               "BB" = 25, "B" = 10, "C" = 10, "C" = 0)
  prize[same] <- payoffs[symbols[same, 1]]
  
  #Step 3:change prize for combinations that contail all bars...
  bars <- symbols == "B" | symbols == "BB" | symbols == "BBB"
  all_bars <- bars[, 1] & bars[, 2] & bars[, 3] & !same
  prize[all_bars] <- 5
  
  #Step 4: handle wild cards...
  ##combos with two diamonds
  two_wilds <- diamonds == 2
  
  ##Identify the nonwild symbol
  one <- two_wilds & symbols[, 1] != symbols[, 2] &
    symbols[, 2] == symbols[, 3]
  two <- two_wilds & symbols[, 1] != symbols[, 2] &
    symbols[, 1] == symbols[, 3]
  three <- two_wilds & symbols[, 1] == symbols[, 2] &
    symbols[, 2] != symbols[, 3]
  
  ##Treat as three of a kind
  prize[one] <- payoffs[symbols[one, 1]]
  prize[two] <- payoffs[symbols[two, 2]]
  prize[three] <- payoffs[symbols[three, 3]]
  
  #combos with one wild card
  one_wild <- diamonds == 1
  
  #Treat as all bars (if appropriate)
  wild_bars <- one_wild & (rowSums(bars) == 2)
  prize[wild_bars] <- 5
  
  ##Treat as three of a kind (if appropriate)
  one <- one_wild & symbols[, 1] == symbols[, 2]
  two <- one_wild & symbols[, 2] == symbols[, 3]
  three <- one_wild & symbols[, 3] == symbols[, 1]
  prize[one] <- payoffs[symbols[one, 1]]
  prize[two] <- payoffs[symbols[two, 2]]
  
  #Step 5: double prize for every diamond in combo...
  unname(prize * 2^diamonds)
}
system.time(play_many(10000000))
#This doesn’t mean that for loops have no place in R. for loops are a very useful feature; 
#they can do many things that vectorized code cannot do. You also should not become a slave to vectorized 
#code. Sometimes it would take more time to rewrite code in vec‐ torized format than to let a for loop run. 
#For example, would it be faster to let the slot simulation run for 5.7 minutes or to rewrite score?


#A logistical problem
#   How can you store and manipulate data without making errors?
#A tactical problem
#   How can you discover the information contained in your data?
#A strategic problem
#   How can you use the data to draw conclusions about the world at large?
#==================================================End file========================================================