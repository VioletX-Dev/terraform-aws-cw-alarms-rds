resource "aws_cloudwatch_metric_alarm" "rds_io_usage" {
  for_each = var.rds_names

  ## metric
  namespace   = "AWS/RDS"
  metric_name = "DiskQueueDepth"
  dimensions = {
    DBInstanceIdentifier = each.value
  }
  period = 300

  ## condictions
  comparison_operator = "GreaterThanOrEqualToThreshold"
  statistic           = "Maximum"
  threshold           = 20
  evaluation_periods  = 2

  ## alarm 
  alarm_name        = "${each.value}-io-usage"
  alarm_description = "Database ${each.value} IO operations are higher than normal. Normal is less than 0.10 or less."
  actions_enabled   = "true"
  alarm_actions     = [var.alarm_notification_channel]
  ok_actions        = [var.alarm_notification_channel]

  tags = {
    developed = "VioletX.com"
    terraform = "true"
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_cpu_usage" {
  for_each = var.rds_names

  ## metric
  namespace   = "AWS/RDS"
  metric_name = "CPUUtilization"
  dimensions = {
    DBInstanceIdentifier = each.value
  }
  period = 300

  ## condictions
  comparison_operator = "GreaterThanOrEqualToThreshold"
  statistic           = "Maximum"
  threshold           = 80
  evaluation_periods  = 2

  ## alarm 
  alarm_name        = "${each.value}-cpu-usage"
  alarm_description = "Database ${each.value} CPU utilization are higher than normal. Normal is less than 80%."
  actions_enabled   = "true"
  alarm_actions     = [var.alarm_notification_channel]
  ok_actions        = [var.alarm_notification_channel]

  tags = {
    developed = "VioletX.com"
    terraform = "true"
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_memory_usage" {
  for_each = var.rds_names

  ## metric
  namespace   = "AWS/RDS"
  metric_name = "FreeableMemory"
  dimensions = {
    DBInstanceIdentifier = each.value
  }
  period = 300

  ## condictions
  comparison_operator = "GreaterThanOrEqualToThreshold"
  statistic           = "Maximum"
  threshold           = 80
  evaluation_periods  = 2

  ## alarm 
  alarm_name        = "${each.value}-memory-usage"
  alarm_description = "Database ${each.value} memory utilization are higher than normal. Normal is less than 80%."
  actions_enabled   = "true"
  alarm_actions     = [var.alarm_notification_channel]
  ok_actions        = [var.alarm_notification_channel]

  tags = {
    developed = "VioletX.com"
    terraform = "true"
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_storage_space_usage" {
  for_each = var.rds_names

  ## metric
  namespace   = "AWS/RDS"
  metric_name = var.storage_space_metric_name
  dimensions = {
    DBInstanceIdentifier = each.value
  }
  period = 300

  ## condictions
  comparison_operator = "GreaterThanOrEqualToThreshold"
  statistic           = "Maximum"
  threshold           = 90
  evaluation_periods  = 2

  ## alarm 
  alarm_name        = "${each.value}-free-storage-space"
  alarm_description = "Database ${each.value} storage space is 90% full. Normal is less than 50%."
  actions_enabled   = "true"
  alarm_actions     = [var.alarm_notification_channel]
  ok_actions        = [var.alarm_notification_channel]

  tags = {
    developed = "VioletX.com"
    terraform = "true"
  }
}
