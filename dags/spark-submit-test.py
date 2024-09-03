from airflow import DAG
from airflow.providers.apache.spark.operators.spark_submit import SparkSubmitOperator

default_args = {
    "owner": "airflow",
    "depends_on_past": False,
    "start_date": "2021-01-01",
    "email_on_failure": False,
    "email_on_retry": False,
    "retries": 1,
    "retry_delay": 5,
}

with DAG(
    "spark-submit-test",
    default_args=default_args,
    schedule_interval=None,
    catchup=False,
) as dag:
    
    spark_submit_test = SparkSubmitOperator(
        task_id="spark-submit-test",
        application="./spark-scripts/spark-test.py",
        conn_id="spark_mumix"
    )

    spark_submit_test