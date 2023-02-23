resource "aws_config_config_rule" "r" {
  name = "vpc_flow_log_guardrail"
  source {
    owner             = "AWS"
    source_identifier = "VPC_FLOW_LOGS_ENABLED"
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "TestingSecurityGroup2"
  description = "TestingSecurityGroup3"

  depends_on = [
    aws_default_vpc.default
  ]
}
