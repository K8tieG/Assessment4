log_file = open("um-server-01.txt")
#This line of code is opening the .txt file and logging it to check that it runs correctly and if there
# are any log messages.


def sales_reports(log_file): #this line is defining the function named sales_reports, and calling the parameters 
    for line in log_file: #here we are inside of the function, this a for loop, it is iterating over each line in the log_file.
        line = line.rstrip() #this line is defining the line variable and invoking a method that removes any trailing charachers at the end of the string.
        day = line[0:3] # this line is defining what the day variable is accessing a values 0 through 3.
        if day == "Tue": # this line is checking to see if the day variable is equal to Tuesday.
            print(line) # this line is saying if the day variable is Tuesday, print line when the loop has ended.

sales_reports(log_file) # this line is logging any changed information in the sales_repoerts


#Change the script to display sales info for Monday instead of Tuesday.
log_file = open("um-server-01.txt")

def sales_reports(log_file): 
    for line in log_file: 
        line = line.rstrip() 
        day = line[0:3] 
        if day == "Mon": 
            print(line) 

sales_reports(log_file) 

#Extra Credit
# write another function that prints out all the melon orders that delivered over 10 melons.
def sales_reports(log_file): 
    for line in log_file: 
        line = line.rstrip() 
        total = line[0:4] 
        if total > 10: 
          print(line) 

sales_reports(log_file)