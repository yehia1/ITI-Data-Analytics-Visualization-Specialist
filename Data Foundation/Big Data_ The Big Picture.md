# Big Data: The Big Picture

## introduction to big data

### The Rise of big data 
- much cheaper storage
- high power computed
- increase data volumes
- open source tecnology
- cloud
- AI
---
### The 3 V'S
- Volume
- Variety : diversty of data types ,format and structure
- Velocity 
- the fouth is the veracity
---
### advanced analytics timeline
data warehouse started then hadoop was the lead , then apache spark
amazon Redshift is cloud data warehouse
cloud data lake: cloud object storage.

---
### Big change 
|From |To|
|:--|:--|
|transactional|Behavioral|
|Storage bound|Limtless storage|
|data exclusivtiy|data inclusiveness|
|proprietary hardware|Commodity hardware|
|proprietary software|open source software|
|finite appliances|infinte clod rescources|
|highly structured|schema-flexible|

---
---
## Big data defined

### Map reduce 

takes the large dataset and split it up to smaller datasets
transfer them using mapper to output files it will be marked with keys using reducer to reduce the output files numbers to get 1 big output 

---
### Data transformation and pipelines

- Extract transform and load (ETL)
- Data Prep and internet platrform as service (IPAAS)
- Newly ELT extract load and transform

### Map reduce example
hadoop, spark,kafka , hive and presto 

### Big data roles
|Analyst|data engineer|data scientist|
|:-|:-|:-|
|buisness users|code|AI expert|
|work with the data|visual piplines|statics|
|understand the context|blending and enrichment|dsign ,train and tune|
||cleaning and transforming|Ml and deep learning|

---
---
## Technologies
### Apache Spark

hadoop alternative 
similar to hadoop but has some distinguishes:
- lack own clustring and files system
- SQL,streaming ,ML
---
### Importance of SQL 

using `apache hive` , `spark Sql` ,`Presto`
	`Phoenix`,`Data Warehouse`

---
### Apache Parquet
**Data lake file format of choice**
parquet is the new csv
**store data in columnar fashion**
	provide compression ,lower storage and sometimes query bills
**Easily partitioned**
	better performace

---
### Presto

Created by facebook 
for solving the slow of hive and mapreduce
**No storage engine**
**Works like data warehouse engine**

---
### Cluster Computing

collection of servers(nodes) 
one is master and else is workers
workers work in parrallel
fails node are replaced by others
scaling by adding more nodes

---
---
## Vendors
### Represintive Business Intelligence Vendors

cloud:  `Power BI` `Looker` `Tableau`
enterprise : `IBM` `ORACLE`

---
### Warehouse and Lake

|WareHouse|Lake|
|:-|:-|
|enterbrise:`IBM`,`Oracle`,`Sap`|Independants: `dataBricks`, `Cloud Era`|
cloud: `Amazon Redshift`,`azure`,`google BIG query`|cloud: `Amazon athenas`,`Azure syllabus`,`Google cloud database`|
 
 ---
 ### Unified Acess Presto: 
 
- sql enigine for querying lakes,warehouses and other data sources
- as an added option amazon EMR ,Quoble
- as a aservice Amazon athena

---
### Data Managment

multiple coraporators for
- Data cataog
- Data Prep\ETL\ELT
- MDM
- Data protection
- Data visualization
- Data quality
- multi catergory
---
---
## Strategy

### Cloud and containers
need hyprid cloud 
containers and kubernetes
cloud provider specifiec platforms and tools
third party cloud agnostic platforms and tools
we reach the multi cloud approach

---
### analytics tooling approach 

1. Code approach 
2. Visual approach
3. combination of both of them
---
### Data culture, data driven
![4da11a62a26f8a4f414c0bc202140f26.png](../_resources/4da11a62a26f8a4f414c0bc202140f26.png)
----
### Adoption matrix

![a17172b7a07c6f95520543bd94f595c6.png](../_resources/a17172b7a07c6f95520543bd94f595c6.png)