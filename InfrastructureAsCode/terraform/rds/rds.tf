resource "aws_rds_cluster" "mysql-cluster" {
  cluster_identifier      = "${var.service_name}-sql-cluster"
  engine                  = "aurora-mysql"
  engine_version          = var.aurora_mysql_version
  availability_zones      = ["us-east-1a", "us-east-1b", "us-east-1c"]
  database_name           = "${var.service_name}_db"
  master_username         = jsondecode(aws_secretsmanager_secret_version.master_sql_credentials_version.secret_string)["username"]
  master_password         = jsondecode(aws_secretsmanager_secret_version.master_sql_credentials_version.secret_string)["password"]
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
}