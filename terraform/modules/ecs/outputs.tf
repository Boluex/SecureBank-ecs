output "cluster_name" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.main.name
}

output "cluster_id" {
  description = "ECS cluster ID"
  value       = aws_ecs_cluster.main.id
}

output "frontend_security_group_id" {
  description = "Frontend ECS tasks security group ID"
  value       = aws_security_group.frontend.id
}

output "backend_security_group_id" {
  description = "Backend ECS tasks security group ID"
  value       = aws_security_group.backend.id
}

output "frontend_service_name" {
  description = "Frontend ECS service name"
  value       = aws_ecs_service.frontend.name
}

output "backend_service_name" {
  description = "Backend ECS service name"
  value       = aws_ecs_service.backend.name
}
