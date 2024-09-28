build :
	@docker build -t spark-yarn-image .

up :
	@docker compose up -d

down :
	@docker compose down

test :
	@docker exec spark-yarn-master bash -c "./bin/spark-submit \
    --master yarn \
    --deploy-mode cluster \
    --driver-memory 512m \
    --executor-memory 512m \
    --executor-cores 1 \
    --queue default \
    spark-scripts/spark-test.py"