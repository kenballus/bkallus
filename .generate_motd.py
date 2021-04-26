from random import randint as ri

choice = ri(0, 12)

if choice <= 5:
    motd = 'Welcome BOUSS.'
elif choice <= 7:
    motd = 'HACKER_MODE status:: INITIATED.'
elif choice == 8:
    motd = 'Julia loves you!'
elif choice <= 10:
    motd = 'Enjoy your computing session, INSERT_NAME_HERE.'
elif choice == 11:
    motd = '\%jlaeiafie7&hfealblqwo**)9rf#ERROR89&626)(dwoa^'
elif choice == 12:
    motd = "I think I'm starting to feel..."

print(motd)
