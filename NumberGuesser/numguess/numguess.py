import random

Right = False

andy = random.randint(1,100)

count = 0


while Right !=True:
    while True:
        try:
            gucci = int(input("I be your manager lil gangsta, guess your cut from the latest album, playa(0-100): "))
            count +=1
            break
        except:
            print("Sorry, homie, but now you're thinking in Spanish")
            continue
                  
    if (gucci==andy):
        print("Good job, muchacho!")
        print("Your record label cut guesses took this many attempts: " + str(count))
        Right = True
    else:
        if(gucci<andy):
            print("Try again busta, yo numba be too small")
        if (gucci>andy):
            print("You gotchyo head in the clouds, balla")
    
    
    

