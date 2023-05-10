# MessyData2

Technology is rapidly evolving and changing the way we work with data. One example of this is the emergence of advanced language models like ChatGPT, which can generate data for analytical purposes.
In this project, I'll be showcasing my SQL skills by cleaning a dataset of 35 rows and 5 columns, which was generated by ChatGPT. 

By leveraging cutting-edge technology, we can access larger and more diverse datasets than ever before, and use them to uncover new insights and trends.

It started with me asking the chatgpt to provide messy data of 50 to 100 rows. We had to go back and forth but it could only provide as many as 35 rows in a codebox.

Busiest Days                                                                                        |  Busiest Times
-------------------------------------------------------------------------------------------------------------|------------------------- 
![2](https://github.com/Emem-Data/MessyData2/assets/103915142/820fa997-f26f-4a71-9771-bf71ec4e5f69) | ![1](https://github.com/Emem-Data/MessyData2/assets/103915142/2e314da7-8b26-43f6-8ddb-3d2fc508c202)


I settled for the data I got, and headed straight to Microsoft SQL SERVER to begin computation and cleaning.

## 1. CREATING A TABLE INTO AN EXISTING DATABASE. 
I created a database named Customer_Profile on the server workbench. 
my next step was to create a Table into the database.

![2](https://github.com/Emem-Data/MessyData2/assets/103915142/e86713dc-cacc-4a99-a8de-b44a35656d5a)

I figured I had added an extra column with the same feature (Phone and PhoneNumber) and I had to drop one of them. And it had to be the Phone column.

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/4bf0d8ad-bdfa-45d8-830b-0a5a5136091f)

Now that the Table Customer_Info has been created, my next step was to insert the records into the Table. 

## 2. INSERT DATA INTO THE TABLE CREATED

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/d8e90709-5bf0-4b75-bbd9-7a0f85b425ac)

😅 I felt proud right there, inputing every value wasn't an easy task. I also replaced every empty cell with NULL because I ran into errors trying to insert empty strings.

Moving forward, I checked if my data was intact, and yayy!

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/e6adbda4-aec7-4aba-ba8d-1fad0aa5ab05)

My next step was to confirm the number of rows and columns in the table created.

## 3. CHECK FOR THE NUMBER OF ROWS AND COLUMNS IN THE TABLE

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/85c6fe81-d408-4e6b-a8b7-5517926ebee6)

So we see that there are 35 Rows and 5 Columns. 

I then proceeded to check for the number of missing values across the Age, Email, and PhoneNumber columns.

## 4. NO OF MISSING VALUES IN AGE, EMAIL, AND PHONE COLUMNS

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/20a917be-9b82-413c-8450-a5448f949887)

Now, we get to an interesting and important aspect of the data cleaning stage. We have seen that 4 values in the Age column are missing, while we have 1 missing value in the Email column and 3 missing values in the PhoneNumber column. 
let's start with the Age column. 

My first approach was to check if there were outliers in the column because I wanted to replace every NULL value in the field with the Mean age of the users. From my knowledge of Outliers, I know full well that the Mean is greatly affected by outliers than the Median and the Median is a better approach for replacement if we have great outliers. 

## 5. CHECK THE AGE COLUMN FOR OUTLIERS.

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/0cd464b9-5591-4273-9746-a810141e205f)

We could see here, that the result for every column was empty. My trust issues wouldn't let me settle for this😅, so I went ahead to solve it manually and still used an online Calculator to check if an outlier exist. ladies and gentlemen 😹, the above code result was correct as there are no outliers in the age column. 

Now that I know this, I proceeded to replace the null values in the Age field with the Mean of the field.

## 6. REPLACING NULL VALUES IN THE AGE COLUMN WITH THE MEAN AGE.

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/0176b38d-86a8-47f2-9a79-7bcd79d3eae3)

The Mean age of the Column is 35, and so each of the NULL values were replaced with the age '35'.

Now let's fix the Email column.

## 7. EMAIL COLUMN CLEANING
We already noted that there is only one null value in the email column, but beyond that, there are a lot of inconsistencies in the column. Some email addresses don't contain domain name. We also see that in between some emails, we have a "firstname.lastname@domain.com" format. There shouldn't be a "." in between the email address, so we'd handle that.

Starting with the second error, we would replace the dot in between the first name and last name with an empty string.

### 8. FIND AFFECTED ROWS
![image](https://github.com/Emem-Data/MessyData2/assets/103915142/98e1b723-c576-46e7-b55f-3e0d5b392441)

### 9. UPDATE AFFECTED ROWS USING THE REPLACE KEYWORD

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/e1010c4f-41db-4b62-8cce-ad396eb54bc7)


Yes!!, I did it 💃.

Next on the Line is to fix the Emails without domains. 

for this cleaning process, I am assuming that the email field is very important and users with no traceable email or No email values will be removed from the table. I noticed that chatgpt provided the same phone numbers for some users, and another unique identity after the ID column should be the email address, hence the restrictions.

## 10. DELETE ROWS WITH NULL VALUE AND NO DOMAIN


![image](https://github.com/Emem-Data/MessyData2/assets/103915142/ea6eb9e1-92b0-4e4e-bd76-747935629774)


Unto the next!!...

My next move was to clean the Phone section. (Not gonna lie, I was getting exhausted at this point, but there's fulfillment in abundance seeing Clean data... so let's move 🚀.)

## 11. PHONE NUMBER COLUMN CLEANING

My first approach here was to check for the length of each row in the column. We ought to have 10 digits.

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/e7fc6936-7013-444f-9803-dd632eebc3dc)

We can see that 26 rows have characters greater than 10. We also see that the extra characters came from (dashes), (Spaces), and (brackets) in between the digits. We would need to remove these special characters.

### 12. UPDATING THE PHONE NUMBER COLUMN BY REMOVING SPECIAL CHARACTERS.

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/37750e32-26db-457c-9309-c256829335fb)

we would not be working on the NULL values in the Phone Number column. There are repeated phone numbers for different users and working on the Null Value won't make the column any better. 

Now! let's check our final dataset after the cleaning process is done 

![image](https://github.com/Emem-Data/MessyData2/assets/103915142/a225edc8-82d4-43ac-8263-2dfd80e56b64)

We can see that originally, we had 35 rows and 5 columns. But at the end of the cleaning process, we have 31 rows and 5 columns.


## CONCLUSION

Data cleaning is a crucial step in the data analysis process, as it ensures that the data used for analysis is accurate, consistent, and reliable. In this analysis, I used SQL to clean a dataset of 35 rows and 5 columns generated from CHATGPT.

Overall, this analysis demonstrates the power of SQL as a tool for data cleaning and preparation. By leveraging SQL's robust features and functions, we can ensure that the data used for analysis is accurate, consistent, and reliable, and make more informed decisions as a result. It also touch upon the potential of language models like ChatGPT to generate data and assist in data analysis.


Thanks for reading through ✨✨🤗




