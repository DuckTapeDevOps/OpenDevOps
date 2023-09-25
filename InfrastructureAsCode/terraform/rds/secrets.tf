resource "random_password" "master_password" {
  length           = 20
  special          = true
  override_special = "_%@"
}

resource "aws_secretsmanager_secret" "master_sql_credentials_secret" {
  name = "mysql-master-credentials"
  description = "Secret for Aurora RDS master credentials"
}

resource "aws_secretsmanager_secret_version" "master_sql_credentials_version" {
  secret_id     = aws_secretsmanager_secret.master_sql_credentials_secret.id
  secret_string = jsonencode({
    "username": "admin",
    "password": random_password.master_password.result
  })
}
