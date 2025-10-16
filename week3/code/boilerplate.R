my_function <- function(Arg1, Arg2) {
    print(paste("Argument", as.character(Arg1), "is a", class(Arg1)))
    print(paste("Argument", as.character(Arg2), "is a", class(Arg2)))
    return(c(Arg1, Arg2))
}

my_function(1,2)
my_function("Riki", "Tiki")