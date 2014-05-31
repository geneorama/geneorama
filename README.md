Geneorama package for R
==============================

The geneorama package for R is a collection of utilities written by Gene Leynes

There is help, there is more information in the DESCRIPTION file, but there are also issues.  I'm not sure how well the help is working, it's not making a proper index just yet.  However, you can query each function individually with the normal help syntax: for example `?lll` will bring up the help for `lll()`, which is an enhanced version of `ls()`.  

One annoying issue with version 1.2 is that it's attaching all the dependent libraries after loading geneorama.  I'll fix that, but for now it's just an annoyance.

You should consider these functions to be beta, and subject to change. 

How to install geneorama
---------------------------------

Curently Geneorama is compiled and uploaded to my website.  You can install it in R with the commands below.  It uses the `loadinstall_geneorama()` to install geneorama.


``` R
# Remove geneorama if it's already installed
if("geneorama" %in% installed.packages()[ , "Package"]){
   remove.packages("geneorama")
}
# Get the loadinstall_geneorama function:
source("http://geneorama.com/code/loadinstall_geneorama_1.2.R") 
# Use the loadinstall_geneorama function:
loadinstall_geneorama()
```


