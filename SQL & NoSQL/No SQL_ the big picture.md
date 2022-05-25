#  NoSQL: the big picture
## What is NoSQL
### Distributed architecture
- Many NoSQL database federate a number of commodity server together
- Provide redundant storage
- Proivide geographic distribution
- avoid having single point of failure
---
### Consistency and comprimise
#### Consistency
- Things like inventory,bank accounts should be consistent
- Things like catalog information don't have to be, at least not immediately 
- But catalog info must come up quickly
- ok then to sacrifice consistency for speed 
#### Comprimises
- Eventually consistency
- Write buffering 
- Only primary keys can be indexed
- Queries must be written as programs 
- Tooling
---
### Queries
- Typically no query language
- instead create procedural program
- sometimes SQL is supported
- usually map reduce code is used
---
---
## NoSQL product categories
### NoSQL categories
- Key-values sotres
- Document stores
- Wide colums stores 
- Graph database
---
### Key-values and wide column 
#### Key-values 
store every value by a key like `ROW_ID: 200`
#### Wide columns
using super columns in the tables and got to define the supercolumns in the design
`ROW_ID = 101,SUPERCOLUMN:NAME, COLUMN:FIRSTNAME:ANREW`
***
### Document store and grahp
#### Document store
![defc7b5c7ee17c36080665ce261aaaf4.png](../_resources/defc7b5c7ee17c36080665ce261aaaf4.png)
#### Graph databases
Using nodes for every attribute with graphs relations between each node like relations but related through the edges it's good for social media
***
## NoSQL do's and don'ts
### Performance 
- for certain types of queries NoSQL is slow
- For line of business application loads,relational database will more reliable and fast 
- if few bits of information and enormous traffic and concurrency NoSQL will be the best
---