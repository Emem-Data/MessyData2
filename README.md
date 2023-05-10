# MessyData2

Technology is rapidly evolving and changing the way we work with data. One example of this is the emergence of advanced language models like ChatGPT, which can generate data for analytical purposes.
In this analysis, I'll be showcasing my SQL skills by cleaning a dataset of 35 rows and 5 columns, which was generated by ChatGPT. By leveraging cutting-edge technology, we can access larger and more diverse datasets than ever before, and use them to uncover new insights and trends.

It started with me asking chatgpt to provide messy data of 50100 rows. We had to go back and forth but it could only provide as much as 35 rows in a codebox.

Busiest Days                                                                                        |  Busiest Times
-------------------------------------------------------------------------------------------------------------|------------------------- 
![2](https://github.com/Emem-Data/MessyData2/assets/103915142/820fa997-f26f-4a71-9771-bf71ec4e5f69) | ![1](https://github.com/Emem-Data/MessyData2/assets/103915142/2e314da7-8b26-43f6-8ddb-3d2fc508c202)


I settled for the data I got, and headed straight to Microsoft SQL SERVER to begin computation and Cleaning.

## CREATING A TABLE INTO AN EXISTING DATABASE. 
I created a database named Customer_Profile on the server workbench. 
my next step was to create a Table into the database.

![2](https://github.com/Emem-Data/MessyData2/assets/103915142/e86713dc-cacc-4a99-a8de-b44a35656d5a)

I figured I had added an extra column with the same feature (Phone and PhoneNumber) and I have to drop one of them. And it had to be the Phone column.

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/4bf0d8ad-bdfa-45d8-830b-0a5a5136091f)

Now that the Table Customer_Info has been created, my next step was to insert the records into the Table. 

## INSERT DATA INTO THE TABLE CREATED

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/d8e90709-5bf0-4b75-bbd9-7a0f85b425ac)

😅 I felt proud right there, inouting every value wasn't an easy task. I also replaced every empty cell with NULL because i ran into errors trying to update as empty strings.

Moving forward, I checked if my data were intact and yayy.

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/e6adbda4-aec7-4aba-ba8d-1fad0aa5ab05)

My next step was to confirm the number of rows and column in the table created.

## CHECK FOR NUMBER OF ROWS AND COLUMN IN THE TABLE

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/85c6fe81-d408-4e6b-a8b7-5517926ebee6)

So we see that there are 35 Rows and 5 Columns. 

I then proceeded to check for the numbers of missing values across each column.

## NO OF MISSING VALUES IN AGE, EMAIL AND PHONE COLUMNS

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/20a917be-9b82-413c-8450-a5448f949887)

Now we get to an interesting and important point of the data cleaning stage. We have seen that 4 values in the Age column are missing, while we have 1 missing value in Email column and 3 missing values in PhoneNumber column. 
let's start with the Age column. 

My first approach was to check if there were outliers in the column because I wanted to replace every NULL value in the field with the Mean age of the users. From my knowledge of Outliers, I know full well that the Mean is greatly affected by outliers than the Median and Median is a better approach if we have great outliers. 

## CHECK THE AGE COLUMN FOR OUTLIERS.

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/0cd464b9-5591-4273-9746-a810141e205f)

We could see here, that the result for every column was empty. Ny trust issues wouldn't let me settle for this😅, so i went ahead to solve manually and still used an online Calculator to check if an outlier exist. ladies and gentlemen 😹, the above code result were correct as there are no outlier in the age column. 

Now that I know this, I proceeded to replacing the null values in the Age field with the Mean of the field.

## REPLACING NULL VALUES IN AGE COLUMN WITH THE MEAN AGE.

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/0176b38d-86a8-47f2-9a79-7bcd79d3eae3)

The Mean age of the Column is 35, and so each of the NULL values eere replaced with age '35'.

Now let's fix the Email column.

## EMAIL COLUMN CLEANING
We already noted that there is only one null value in the email column, but beyond that,there are a lot of inconsistency in the column. Some email addresses don't contain a domain name. We also see that in-between some emails, we have "firstname.lastname@domain.com" format. there shouldn't be a "." in-between the email address, so we'd handle that.

Starting with the second error, we would replace the dot in-between the firstname and lastname with an empty string.
















