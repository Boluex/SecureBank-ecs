aws_region   = "eu-west-2"
environment  = "production"
project_name = "securebank"

vpc_cidr             = "10.0.0.0/16"
availability_zones   = ["eu-west-2a", "eu-west-2b"]
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

frontend_image = "boluex/securebank-frontend:latest"
backend_image  = "boluex/securebank-backend:latest"

db_name           = "securebank"
db_username       = "securebank"
db_instance_class = "db.t3.micro"

frontend_cpu    = 256
frontend_memory = 512
backend_cpu     = 512
backend_memory  = 1024

frontend_desired_count = 2
backend_desired_count  = 2