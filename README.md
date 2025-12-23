
# Vehicle-Rental-System---Database-Design-SQL-Queries-b5a3

```
🎤 Question 1
What is a foreign key and why is it important in relational databases?
Answer: Foreign key হলো একটি column, যা অন্য একটি table-এর primary key-এর সাথে সম্পর্ক তৈরি করে।
উদাহরণ হিসেবে,
bookings table-এর user_id হলো একটি foreign key, যা users table-এর user_id কে reference করে।

এটা গুরুত্বপূর্ণ কারণ:

এটা table গুলোর মধ্যে relationship বজায় রাখে

ভুল data insert হওয়া আটকায়
(যেমন: এমন user_id দিয়ে booking করা যাবে না, যেটা users table-এ নেই)

Database-এর data integrity নিশ্চিত করে

সহজ কথায়, foreign key নিশ্চিত করে যে database-এর data consistent এবং reliable থাকে।
```
```
🎤 Question 2
What is the difference between WHERE and HAVING clauses in SQL?

Answer (Bangla):

WHERE এবং HAVING দুটোই filter করার জন্য ব্যবহার হয়, কিন্তু কাজ করার সময় আলাদা।

WHERE ব্যবহার হয় row filter করার জন্য, GROUP BY এর আগে

HAVING ব্যবহার হয় group filter করার জন্য, GROUP BY এর পরে

উদাহরণ:

WHERE → “status = 'available'”

HAVING → “COUNT(bookings) > 2”

আরেকটা গুরুত্বপূর্ণ পার্থক্য:

WHERE এ COUNT(), SUM() ব্যবহার করা যায় না

HAVING এ aggregate function ব্যবহার করা যায়

```
```
🎤 Question 3
What is a primary key and what are its characteristics?

Answer (Bangla):

Primary key হলো একটি column (বা column-এর combination), যা table-এর প্রতিটি row-কে uniquely identify করে।

উদাহরণ:

users table-এ user_id

vehicles table-এ vehicle_id

Primary key-এর বৈশিষ্ট্যগুলো হলো:

প্রতিটি value অবশ্যই unique

কখনো NULL হতে পারবে না

একটি table-এ একটাই primary key থাকে

Data দ্রুত খুঁজে পেতে সাহায্য করে

সহজভাবে বললে, primary key হলো table-এর প্রতিটি row-এর unique identity number।
```
```
🎤 Question 4
What is the difference between INNER JOIN and LEFT JOIN in SQL?

Answer (Bangla):

INNER JOIN শুধু সেই data গুলো দেখায়,
👉 যেগুলো দুইটা table-এই match করে।

অন্যদিকে,
LEFT JOIN বাম পাশের table-এর সব data দেখায়,
👉 এমনকি ডান পাশের table-এ match না থাকলেও।

উদাহরণ:

INNER JOIN → শুধু যেসব user booking করেছে

LEFT JOIN → সব user, এমনকি যারা booking করেনি তারাও

সুতরাং,

INNER JOIN = common data

LEFT JOIN = left table-এর সব data
```

