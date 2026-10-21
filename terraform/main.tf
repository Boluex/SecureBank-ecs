module "vpc" {
  source = "./modules/vpc"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "ecr" {
  source = "./modules/ecr"

  project_name = var.project_name
}

module "secrets" {
  source = "./modules/secrets"

  project_name = var.project_name
  environment  = var.environment
}

module "iam" {
  source = "./modules/iam"

  project_name     = var.project_name
  frontend_ecr_arn = module.ecr.frontend_repository_arn
  backend_ecr_arn  = module.ecr.backend_repository_arn
}

module "alb" {
  source = "./modules/alb"

  project_name      = var.project_name
  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
}

module "ecs" {
  source = "./modules/ecs"

  project_name              = var.project_name
  environment               = var.environment
  vpc_id                    = module.vpc.vpc_id
  private_subnet_ids        = module.vpc.private_subnet_ids
  public_subnet_ids         = module.vpc.public_subnet_ids
  frontend_image            = var.frontend_image
  backend_image             = var.backend_image
  frontend_cpu              = var.frontend_cpu
  frontend_memory           = var.frontend_memory
  backend_cpu               = var.backend_cpu
  backend_memory            = var.backend_memory
  frontend_desired_count    = var.frontend_desired_count
  backend_desired_count     = var.backend_desired_count
  execution_role_arn        = module.iam.ecs_execution_role_arn
  task_role_arn             = module.iam.ecs_task_role_arn
  frontend_target_group_arn = module.alb.frontend_target_group_arn
  backend_target_group_arn  = module.alb.backend_target_group_arn
  app_config_secret_arn     = var.app_config_secret_arn
  db_secret_arn             = module.secrets.db_password_secret_arn
  secret_key_arn            = module.secrets.secret_key_arn
  db_endpoint               = module.rds.db_address
  db_name                   = var.db_name
  db_username               = var.db_username
  alb_security_group_id     = module.alb.alb_security_group_id
}

module "rds" {
  source = "./modules/rds"

  project_name              = var.project_name
  environment               = var.environment
  vpc_id                    = module.vpc.vpc_id
  private_subnet_ids        = module.vpc.private_subnet_ids
  db_name                   = var.db_name
  db_username               = var.db_username
  db_password               = module.secrets.db_password
  db_instance_class         = var.db_instance_class
  backend_security_group_id = module.ecs.backend_security_group_id
}