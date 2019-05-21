pig = 'ay'
pig2 = 'yay'

print ('You Have Been Transferred to Our Bi-language Branch, Owhey areyay ouyay?')
while True:
    finn = ''

    bagoosh = input('Enter Word Here: ')
    if bagoosh == 'Stop':
        break
    if len(bagoosh) > 0:
        word = bagoosh.lower()
        word = word.split(' ')
        for i in range(0, len(word)):
            
            first = word[i][0]
            if first == ("a" or "e" or "i" or "o" or "u"):
               word2 = word[i] + pig2
               finn+=word2 + (' ')
            else:
               word2 = word[i][1:] + first + pig
            
               finn+=word2 + (' ')
        print(finn)
        
    else:
        print ('empty')
        

