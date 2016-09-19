# The performance of Data Journalism on Wechat Public Accounts

### Project Goal
After having done Data Journalism for 4 months, I began to question "Data Journalism" itself. Nowadays, everyone is talking about data journalism, but no one understands what it means. Everyone is talking to others that he is doing it, so everyone believes others are doing it. (Just imitate "Big Data" pattern)

First of all, it may lack of market. </br>
Then, it may lack of useness. 

### Method
Since wechat never open its API and I can not access to it's data. Then I took advantage of Sougou Wechat searching function to do a crawler. 

The method is quite simple. I firstly picked tens public accounts who are doing data journalism on wechat. Then search them out with sougou. I then crawled the result that sougou privided. 

Because sougou only gave 10 results for each public account, my sample just got 196 passages information. result has also been released in 
<code>sougou_14.csv</code><br>,<code>crawler.sougo.R</code> is the R profile which mainly used Rvest and Rselenium. 

