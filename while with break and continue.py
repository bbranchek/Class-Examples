count = 0

while True:
    count += 1

    if count == 3:
        print("Skipping 3")
        continue   # jump to next loop iteration

    print("count =", count)

    if count == 6:
        print("Stopping at 6")
        break      # exit the loop
