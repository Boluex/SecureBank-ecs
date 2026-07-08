output "db_password_secret_arn" {
  description = "ARN of the DB password secret"
  value       = aws_secretsmanager_secret.db_password.arn
}

output "db_password" {
  description = "Database password"
  value       = random_password.db_password.result
  sensitive   = true
}

output "secret_key_arn" {
  description = "ARN of the JWT secret key"
  value       = aws_secretsmanager_secret.secret_key.arn
}