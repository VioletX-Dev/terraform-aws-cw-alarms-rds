variable "alarm_notification_channel" {
  description = "It's a SNS that might send emails, page your Incident Response tool (Pager Duty, OpsGenie, VitorOps, etc)"
  type        = string
}

variable "rds_names" {
  description = "RDS database names to create the alarms. `e.g. rds_names = [\"dbinstance_1\", \"dbinstance_2\", \"dbinstance_3\"]`"
  type        = set(string)

}

variable "storage_space_metric_name" {
  description = "RDS database storage space metric names. e.g. `FreeStorageSpace` on MySQL and PostgreSQL databases, `FreeLocalStorage` on Aurora MySQL and Aurora PostgreSQL databases, `AuroraVolumeBytesLeftTotal` on Aurora MySQL Databases."
  type        = string

}
