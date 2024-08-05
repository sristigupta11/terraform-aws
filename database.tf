resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${local.prefix}-rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${local.prefix}-rds-subnet-group"
  }
}

resource "aws_security_group" "rds" {
  name        = "${local.prefix}-db-security-group"
  description = "RDS security group for ${var.db_name}"
  vpc_id      = var.vpc_id

  ingress {
    protocol   = "tcp"
    from_port  = 1433
    to_port    = 1433
    cidr_blocks = var.cidr_blocks
  }

  tags = {
    Name = "${local.prefix}-db-security-group"
  }
}

resource "aws_db_instance" "main" {
  identifier              = "${local.prefix}-db"
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  instance_class          = var.db_instance_class
  name                    = var.db_name
  username                = var.db_username
  password                = random_password.rds_password.result
  allocated_storage       = var.db_allocated_storage
  storage_type            = "gp3"
  port                    = var.db_port
  multi_az                = var.db_multi_az
  backup_window           = var.db_backup_window
  maintenance_window      = var.db_maintenance_window
  backup_retention_period = var.db_backup_retention_period
  vpc_security_group_ids  = [aws_security_group.rds.id]
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot     = true

  tags = {
    Name = "${local.prefix}-db"
  }
}

resource "random_password" "rds_password" {
  length  = 16
  special = true
}
