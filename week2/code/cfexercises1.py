#def foo_1(x):
#   return x ** 0.5
#
#def foo_2(x ,y):
#    if x > y:
#        return x
#    return y
#
#def foo_3(x,y,z):
#    if x > y:
#        x, y = y, z
#        x, z = z, x
#    if x > z:
#    if y > z:
#        y, z = z, y
#    return [x, y, z]
#
#def foo_4(x):
#    result = 1
#    for i in range (1, x + 1):
#        result = result * i
#    return result
#
#def foo_5(x):
#    if x ==1:
#        return 1
#    return x * foo_5(x-1)
#
#def foo_6(x):
#    facto = 1
#    while x >= 1:
#        facto = facto * x
#        x = x - 1
#    return facto

###MODIFIED CODE###

#1 - Square Root
def foo_1(x):
    x = x ** 0.5
    print("The square root of this number is:", x)
    return x

#2 - Two number Cmparison
def foo_2(x, y):
    if x > y:
        print ("Your first number (",x,") is greater than your second number (",y,")")
        return x
    elif y > x:
        print ("Your second number (",y,") is greater than your first number (",x,")")
        return y
    else:
        print("Your numbers are equal!")
        return y

#3 - Three number compare

def foo_3(x, y, z):
    if x > y:
        x, y = y, z
        print("Your first number is bigger than your second number! Your first number is now your second number and your second number is now the third number.")
    if x > z:
        x, z = z, x
        print("Your first number is bigger than your third number! They have been swapped around.")
    if y > z:
        y, z = z, y
        print("Your second number is bigger than your third number! They have been swapped around.")
    return [x, y, z]

#4 - Factoral

def foo_4(x):
    result = 1
    for i in range (1, x + 1):
        result = result * i
    print("The factoral for", x, "is", result)
    return result

#5 - Factoral 2

def foo_5(x):
    if x == 1:
        y = 1
    else:
        y = x * foo_5(x - 1)
    print("The factorial of", x, "is", y)
    return y

#6 - Factoral 3
def foo_6(x):
    y = x
    facto = 1
    while x >= 1:
        facto = facto * x
        x = x - 1
    print("The factorial of", y, "is", facto)
    return facto

# Test Arguments

foo_1(10)
foo_2(10,11)
foo_3(12,11,10)
foo_4(4)
foo_5(4)
foo_6(4)