### 3.3 - Solve the problem
*Action plan - what would you do?*

We make deliveries from a nationally structured logistics partner with distribution centers and delivery partners strategically spread to serve all zip code ranges in the country.

Based on the data already analyzed, what would you do to reduce the average delivery time to 3 days?
- Answer: analyzing the difference of days between the statuses I could see that between "transit_to_local_distribution_at" and "Local Distribution_at" there is practically 3 days on average (looking only at 2023), so this would be the first point that we could attack to further reduce the deadline. In addition to these, there is also an opportunity between the statuses "Local_Distribution_at" and "Delivered" which does not have such a large average, but adding the reduction of this with what I commented earlier, I believe we could reduce it to the desired, approximately.

In addition, some data for some statuses seem to be inconsistent, since between statuses we have from 0 to 400 running days, which affects the time reduction analysis.

If you were to ask the engineering teams to gather more data, what should it be and why?
- Answer: to complete the analysis and help understand the best way to reduce deadlines, it would be good to have the estimated deadline information for each step, so we could measure the estimated with the realized and attack where we need to reduce, remove the fat from the deadlines. In addition, deadlines talk a lot with performance, so this data could also help us on this topic.

What were the problems, how did you find them and what should we do to fix them?
- Answer: the first problem I found was an inconsistency of some data, the dates. Some orders are with very distant dates between statuses, of 100 days for example. I believe it may be a status rise error with changed date, not delay. I found this problem by analyzing the difference in calendar days between statuses, to understand how long the operations / system are working with. I believe that to solve this problem we would need the team able to adjust the data internally and investigate with them the reason for what happened, so that it does not happen again.
