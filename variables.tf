variable "prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "env_name" {
  description = "Environment name"
  type        = string
}

variable "maintenance_contact" {
  description = "Maintenance contact information"
  type        = string
}

variable "product_component" {
  description = "Product component"
  type        = string
}

variable "product_line" {
  description = "Product line"
  type        = string
}

variable "provisioner" {
  description = "Provisioner"
  type        = string
}

variable "owner_contact" {
  description = "Owner contact"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "cidr_blocks" {
  description = "List of CIDR blocks allowed to access the DB"
  type        = list(string)
}

variable "db_engine" {
  description = "The database engine to use (e.g., postgres, mysql)"
  type        = string
}

variable "db_engine_version" {
  description = "The database engine version"
  type        = string
}

variable "db_instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_username" {
  description = "The username for the database"
  type        = string
}

variable "db_allocated_storage" {
  description = "The amount of allocated storage"
  type        = number
}

variable "db_port" {
  description = "The port on which the DB accepts connections"
  type        = number
  default     = 5432
}

variable "db_multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = false
}

variable "db_backup_window" {
  description = "The daily time range during which automated backups are created"
  type        = string
  default     = "03:00-06:00"
}

variable "db_maintenance_window" {
  description = "The weekly time range during which system maintenance can occur"
  type        = string
  default     = "sun:05:00-sun:06:00"
}

variable "db_backup_retention_period" {
  description = "The number of days to retain backups"
  type        = number
  default     = 7
}

variable "env_type" {
  description = "Environment type (e.g., dev, prod)"
  type        = string
}
