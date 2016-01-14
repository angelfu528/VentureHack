# Hacking-VC-and-Startups

This is a project that I worked on when I took my Foundation of Data Analysis class. As VCs and startups have 
always been a popular topic in Silicon Valley, I decided to look into some trends in this sector for this project. 
In this project, I mainly used R to perform my analysis. 

In this README file, I will only provide a brief description of the project. If you would like to learn more about it, feel free to check out the wiki page! 

Note: This project was completed in Fall 2014. A lot has changed since then, so some of the information might be outdated now. Nevertheless, the main goals of this project for me are to learn how to use R to analyze data, improve my critical thinking skill and how to conduct data analysis effectively. 

### FILES

#### Data 
* **angelInvestments.R**: Investment trends for Angel Investors
* **industryOverview.R**: Trends on sectors that investors usually invest in and on exits including both IPO and M&A
* **VC Investments.R**: Investment trends for Angel Investors
* **leagueTable.R**: The correlation between high valued/successful startups and participating in incubaros.

#### Images
* I plotted many different graphs to help support my analysis in this project, but I didn't use all of them in my analysis. If you woud like to check out all the images I have produced, please check out the **Images** folder. 


### PACKAGES USED
* ggplot 2
* knitr
* xts
* RCurl
* ggmap
* maps
* reshape
* forecast

### DESCRIPTION 
#### Overview 
Silicon Valley has always been the place that a lot of people admire in the world. In this project, I had the opportunity to take a closer look at some of the topics and get a better understanding of the eco-system.

#### Assumption: Most angel investors only invest in Seed Stage.
#### Fact: A lot of angel investors have started investing in Post Seed Stage companies more frequently since 2007.
In the past, Angel investments usually came in when startups could not raise enough money from family and friends or bootstrap anymore, but they were still not ready to raise a larger amount from venture capitalists (We will refer to VCs here). However, the Angel Investments scene has changed tremendously over the past few years. Let’s take a look at the graphs below:
![alt text][img]
[img]:https://raw.githubusercontent.com/angelfu528/Hacking-VC-and-Startups/master/Images/activeAngelInvestors.png 
![alt text][img1]
[img1]:https://raw.githubusercontent.com/angelfu528/Hacking-VC-and-Startups/master/Images/angelInvStage.png
There has been a steady growth in the number of active angel investors since around 2003, and by the end of 2013, the number has reached almost 300,000. Now startups can raise money from investors through AngelList (a crowdfunding website). AngelList not only provides a platform for these companies to raise capital from prominent investors (as well as receive valuable advice from them), but its Syndicates (on AngelList) feature also gives the angel investors more incentives to help these startups raise money on the platform through their personal network, which overall encourages more and more angel investments in the industry. 

Since there are more and more active angel investors, they are not necessarily limited to pure Seed Stage investments. According to the Center for Venture Reach, there have been more Post Seed angel investments since around 2007, and by the end of 2013, 60% of the angel investments were actually Post Seed, while 40% were Seed investments. 

#### Assumption: Software is the sexiest sector in the startup community right now.
#### Fact: Yes, it is. 
In terms of sectors, the Software industry has been running ahead in the race for more than a decade. In 2013, the total number of venture-backed investments in Software was 11,020, which represented 37% of the total VC investments (29,545) that year. There was also a 29% increase in the number compared with the year before. 
![alt text][img2]
[img2]:https://raw.githubusercontent.com/angelfu528/Hacking-VC-and-Startups/master/Images/vcSector.png
An established platform that generates data allows companies to understand their products/businesses more effectively, and the automated process also significantly improves the user experience for them.

#### Assumption:Dot.com bubble might happen again soon because more VCs are emerging and companies go public even though they are not ready.
#### Fact: There was not a dramatic growth in the size of VC industry and it actually takes longer for companies to go IPO than we assumed.
![alt text][img3]
[img3]:https://raw.githubusercontent.com/angelfu528/Hacking-VC-and-Startups/master/Images/activeVCs.png
![alt text][img4]
[img4]:https://raw.githubusercontent.com/angelfu528/Hacking-VC-and-Startups/master/Images/vcSize.png
The number of actively investing firms reached its peak in 2000 during the dot.com bubble and there were 1,053 VC firms; however, there has been a decrease in the number of actively investing firms since then. The number of actively investing firms actually went down to 532 in 2013, with a 4% decrease compared with the year before, and the number has been rather stable since the bubble. If we further look at the average firm size and fund size of these VCs, the two numbers remained stable between 2001 and 2007 after the dot.com bubble, and they have been decreasing since then.

Plus, if we study this topic from the Exits’ point of view, I would like to focus on the number of exits (both Merger & Acquisitions and IPOs) and the median age of companies when they go public.
![alt text][img5]
[img5]:https://raw.githubusercontent.com/angelfu528/Hacking-VC-and-Startups/master/Images/numOfIPOs.png
![alt text][img6]
[img6]:https://raw.githubusercontent.com/angelfu528/Hacking-VC-and-Startups/master/Images/numMAExits.png
In terms of the number of IPOs, not surprisingly, it reached its highest number 280 IPOs in 1999, and there were 238 IPOs in the following year. Nevertheless, there was a huge decrease after 2000 ever since then, and there were only 81 IPOs in 2013. This was not even 1/3 of the total in 1999 and roughly the same as the number before dot.com bubble took place. And the number of M&A exits ranges between 323 and 521, and there has not been a huge difference every year either.
![alt text][img7]
[img7]:https://raw.githubusercontent.com/angelfu528/Hacking-VC-and-Startups/master/Images/IPOExitsByMeanAge.png
In the meantime, some people might argue a lot of companies went IPO when they were still too young and not ready, which could trigger a lot of negative responses after they went public. For example, they might not be able to satisfy most shareholders’ needs, the product did not meet the public’s expectation, etc. However, if we take a look at the graph above, we will be surprised to find out the median age of IPO exits has actually been slightly increasing. Between 1998 and 2000, the median ages of companies that went IPO were 2.5, 2.9 and 3.1, which were significantly young. However, the number has been increasing since the dot.com bubble. The median ages of IPO exits were 7.8 and 8.1 in 2012 and 2013, which were more than 3 times than the number during dot.com bubble.

#### Assumption: Startups that have gone through incubators tend to be more successful.
#### Fact: Most of the best-funded startups between 2009 and 2014 did not go through any incubator program.
![alt text][img8]
[img8]:https://github.com/angelfu528/Hacking-VC-and-Startups/blob/master/Images/startups-1.png
![alt text][img9]
[img9]:https://github.com/angelfu528/Hacking-VC-and-Startups/blob/master/Images/startups-2.png
![alt text][img10]
[img10]:https://github.com/angelfu528/Hacking-VC-and-Startups/blob/master/Images/bestFundedStartups.png
In the U.S., a few incubators that stand out in the crowd are Y-Combinator (Ycomb), 500 Startups and TechStars. In 2014, Wall Street Journal and Dow Jones VentureSource come up with a list (the Billion-Dollar Startup Club) of startups that are valued at over $1B and backed by VCs. Out of 47 startups on the list, only Airbnb, Dropbox and Stripe came out of Y-combinator, and Credit Karma came out of 500 Startups. Furthermore, Quandl also generated a list of best-funded startups founded in 2009 or later from Crunchbase. None of these startups on the list actually went through an incubator program. Therefore, going through an incubator program is not a must-do thing for every startup. It could be helpful in terms of getting traction from investors and advice on certain aspects of building your company from the grounds up. However, the most critical thing is to know what works the best for you and your company, instead of just following the crowd.

### Conclusion 
From time to time, we develop generalizations towards different things, but sometimes these generalizations might not necessarily be what actually happen in real life. That is why data has become so valuable in our every day life. The data that we collected in this analysis gives us an opportunity to take a deeper look in the VC and Startups industry and a clear idea for those who are interested in starting their own company. The startups eco-system continues growing everyday, and there is certainly a lot more we can explore as well as how to succeed in this industry with the help of powerful data.



