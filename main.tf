resource "aws_cloudwatch_metric_alarm" "rds_io_usage" {
  for_each = var.sqs_names

  ## metric
  namespace   = "AWS/RDS"
  metric_name = "ApproximateAgeOfOldestMessage"
  dimensions = {
    # QueueName = each.value
  }
  period = 300

  ## condictions
  comparison_operator = "GreaterThanOrEqualToThreshold"
  statistic           = "Maximum"
  threshold           = 10
  evaluation_periods  = 2

  ## alarm 
  alarm_name        = "${each.value}-io-usage"
  alarm_description = "Database ${each.value} IO operations are higher than normal. Normal is less than XXXX."
  actions_enabled   = "true"
  alarm_actions     = [var.alarm_notification_channel]
  ok_actions        = [var.alarm_notification_channel]

  tags = {
    developed = "VioletX.com"
    terraform = "true"
  }
}
