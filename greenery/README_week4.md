Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices


Part1: 

2. Which products had their inventory change from week 3 to week 4? (SQL in README_week4_sql.md)
```
    NAME	            INVENTORY
    String of pearls        0
    Pothos                  0
    Philodendron	        15
    Bamboo	                44
    Monstera	            50
    ZZ Plant	            53
```
```
  - Products had the most fluctuations in inventory?(SQL in README_week4_sql.md)
    String of pearls
```
```
  - Products that went out of stock:(SQL in README_week4_sql.md)
    Pothos
    String of pearls
```



```
Part 2. Modeling challenge (Model name is :fact_product_funnel)

How are our users moving through the product funnel?
 'page views' to 'add to cart' conversion is pretty good at an average of 50%
 'add to cart' to 'check out' is lower at an average of 40%

Which steps in the funnel have largest drop off points?
'add to cart' to 'check out' has the largest drop point

```
