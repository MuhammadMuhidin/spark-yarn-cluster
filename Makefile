build:
	@docker compose build

build-yarn:
	@docker compose -f docker-compose.yarn.yml build

build-airflow:
	@docker compose -f docker-compose.airflow.yml build

down-all:
	@for file in *.yml; do \
		echo "Stopping Docker Compose services defined in $$file"; \
		docker compose -f $$file down --volumes --remove-orphans; \
	done

run:
	@docker compose -f docker-compose.yml up -d

run-scaled:
	@docker compose -f docker-compose.yml up --scale spark-worker=3

run-yarn:
	@docker compose -f docker-compose.yarn.yml up -d

run-yarn-scaled:
	@docker compose -f docker-compose.yarn.yml up --scale spark-yarn-worker=3

run-airflow:
	@docker compose -f docker-compose.airflow.yml up -d

stop:
	@docker compose -f docker-compose.yml stop

stop-yarn:
	@docker compose -f docker-compose.yarn.yml stop

stop-airflow:
	@docker compose -f docker-compose.airflow.yml stop

submit-test:
	@docker exec spark-master spark-submit --master spark://spark-master:7077 --deploy-mode client ./spark-scripts/spark-test.py

submit-test-yarn:
	@docker exec spark-yarn-master spark-submit --master yarn --deploy-mode cluster ./spark-scripts/spark-test.py

submit-test-airflow:
	@docker exec airflow-webserver spark-submit --master spark://curly-telegram-949rgxj7rvwh775p-7077.app.github.dev:7077 ./spark-scripts/spark-test.py



