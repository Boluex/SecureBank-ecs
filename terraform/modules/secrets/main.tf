# Generate random password for database
resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# Generate random secret key for JWT
resource "random_password" "secret_key" {
  length  = 64
  special = false
}

# Store DB password in Secrets Manager
resource "aws_secretsmanager_secret" "db_password" {
  name                    = "${var.project_name}/${var.environment}/db-password"
  description             = "SecureBank database password"
  recovery_window_in_days = 0

  tags = {
    Name = "${var.project_name}-db-password"
  }
}

resource "aws_secretsmanager_secret_version" "db_password" {
  secret_id = aws_secretsmanager_secret.db_password.id
  secret_string = jsonencode({
    password = random_password.db_password.result
  })
}

# Store JWT secret key
resource "aws_secretsmanager_secret" "secret_key" {
  name                    = "${var.project_name}/${var.environment}/secret-key"
  description             = "SecureBank JWT secret key"
  recovery_window_in_days = 0

  tags = {
    Name = "${var.project_name}-secret-key"
  }
}

resource "aws_secretsmanager_secret_version" "secret_key" {
  secret_id     = aws_secretsmanager_secret.secret_key.id
  secret_string = jsonencode({
    secret_key = random_password.secret_key.result
  })
}