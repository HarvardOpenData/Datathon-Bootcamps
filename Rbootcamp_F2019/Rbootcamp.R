# This is a comment! It doesn't affect your code, but it's very important to annotate your 
# code so that you and your peers will understand it later

### BASICS ###

# Let's begin by trying some basic operations. Use Command + Enter to run code line by line,
# or click the run button above. You can also highlight chunks of code and run code all at once. 
1 + 3; 4 - 1; 5 * 3; 2 / 3; 10 %% 2; 2^2

# Note that unlike a language like OCaml, floats (decimals) can be added/subtracted/etc. to integers
1.5 + 3; 4 - 1.3; 5 * 2.5; 3 / 2.5; 10 %% 2.5; 2.4^2

# We can also do computer logic with ! <- not, == <- equals, | <- or, & <- and, T <- True, F <- False
1.5 == 2; !T

# Variable assignment in R is done with <- or =. We usually deal with variables that are vectors or matrices.
x <- 2; x

# x is a vector of length 3 while z is a 3x3 matrix
x <- c(72,34,19); x
z <- cbind(c(1,2,3),c(4,5,6),c(7,8,9)); z

# The c() command combines values into a vector, 
# cbind binds vectors together as columns to form a matrix (array of like type ie. all numbers, bools, etc.)

# Try appending x to z to form a 3x4 matrix
cbind(z,x)

### FUNCTIONS ###

# We can define functions in R that take inputs and provide us with outputs.

# This function 
myfn0 <- function(x) {
  return(x+4)
}
myfn0(3)


# This function can also take in vector values and matrix values
myfn0(x)
myfn0(z)

# We can also plot functions 

fun <- function(x) x^2*cos(x)
plot(fun, xlim=c(-pi,pi), ylim=c(-2,2))

# You can also plot canonical stats distributions you've learned about in classes
# Here's a plot of the standard normal distribution. 

norm <- function(x) dnorm(x, mean=0, sd=1) 
plot(norm, xlim=c(-3,3))

# We can also define functions that act as binary operators. This function acts as addition in mod 2
"%+%" <- function(x,y) (x+y)%%2

# 10 + 3 mod 2 = 1 
10 %+% 3 

# Functions can also return a list of many values. A list is exactly what it sounds like:
myfn1 <- function(x) {
  list <- list("plus4" = x + 4, "minus4" = x - 4);
  return(list)
}
myfn1(3)

# DO: Write your own functions and binary operators. Write a function that finds the roots of a 
# quadratic equation. (the built-in fn sqrt() will be helpful). Use ?sqrt to see its specs
# Create a binary operator that does multiplication in mod 7.



### DATAFRAMES ###

# Another R datatype is called the dataframe. The dataframe is like a matrix, but can have entries of 
# different types 
# For example
p <- c(T,T,F,F);p # booleans/logicals
q <- c(1,2,3,4);q # numericals
r <- c("Seth", "Ryan", "Henry", "John");r # character
mydataframe <-data.frame(p, q, r)

# We can extract columns and entries in the dataframe (or in matrices) using [] or $

# Extract column 3
mydataframe[,3]
mydataframe$r

# Extract the element in the 2nd row and 2nd column
mydataframe[2,2]
mydataframe$q[2]

# We can also delete rows and columns of our dataframe by using the - command
# For example, delete row 1
mydataframe = mydataframe[-1,]; mydataframe

# P.S. to check the type of a variable, use ()
class("Seth")
class(T)

### REAL DATA ###

# We usually see dataframes in the context of data that has been created or compiled for us to use
# in excel spreadsheets or .csv files. We can load .csv files into R using this function 
enrollment <-read.csv("concentration-enrollment.csv"); enrollment

# This .csv file shows the number of people enrolled in each concentration from 2010-11 to 2014-15
# this dataset is courtesy of harvard open data project
concentration <- enrollment$concentration; head(concentration)

# We can look up the index of certain values of concentration by using which() and == (equality)
# Look up the index of the applied math concentration
which(concentration == "Applied Mathematics")

# DO: Extract the number of Math concentrators in 2011-12. 


# Reading documentation is a very important skill when working with any language 
# To access documentation for a function, simply run a line of code with ? in front of that function 
# Try it here with which
?which

# DO: R can also create really cool graphics. Try using reading the ?hist() documentation and 
# using hist to plot the 2011.12 enrollment data. Adjust your breaks parameter to  
# give your histogram a reasonable number of buckets and color your columns. 
# Then use ?abline to plot colored lines at the median and mean enrollment values
?hist()
?abline()



# We can also add columns to our dataframe and write new .csv files ourselves. 
# DO: Create a "rate" column that represents concentration growth from 2010.11 to 2014.15. Then 
# use the dataframe function to add your new column to the enrollment dataframe. Finally, 
# explore the documentation for the write.csv() function and save this new dataframe as 
# a new file called "rate.csv." Your newly created file should be in your Rbootcamp folder.
?write.csv()

 
# DO: Next, you will be using the dataset I used for my final R project on Kiva 
# microfinance loans. You should load the file using read.csv. Clean the data by deleting 
# the erroneous X and "lamount" columns. Then, visualize the data by plotting a histogram  
# of loan values with breaks="fd" and xlim = c(0,10000). Title your graph using main= and label the 
# x and y axes. Calculate the % of grants  above the mean grant amount using the which() and length()
# functions. Explain why mean is not a good measure of center for these data. 




# DO: One of the goals of my project was to see if female-identifying people asking for grants
# received less money than male-identifying people. Assuming that there is no difference between 
# genders and grant amounts, we can use a chisquare test. Read the documentation on the chisq.test(). 
# See if you can convert the amount column into a logical variable that will be True if an amount is 
# above the median, False else. Then, using chisq.test(), compare this column with the gender column.
# This can be done in one line of code.
?chisq.test

# Building off of Stephen's bootcamp on data journalism, you can also do Linear regression using R. 
# We are going to be using the USArrests dataset that's already hardcoded into R. 
str(USArrests)

# Suppose that we want to predict how many assaults there are going to be in the US using the number 
# of murders as our covariate/independent variable. We can first plot the relationship between these 
# two vectors as follows 
plot(Assault ~ Murder, data = USArrests)

# This looks like a good candidate for linear regression. We can use the lm command to create a linear
# model and plot it.
mod = lm(Assault ~ Murder, data = USArrests)
s = summary(mod)
abline(mod, col = "red")

# We can now predict the number of assaults based on 20 and 22 murders. 
predict(mod, data.frame(Murder = c(20,22)))

# DO: try to use rape to predict the number of murders using rape = 2 and 4

