resource "aws_ecs_cluster" "main" {
  name = var.app_name
}

resource "aws_ecs_task_definition" "hello_world" {
  family                   = var.app_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = <<DEFINITION
[
  {
    "name": "hello_world",
    "image": "amazon/amazon-ecs-sample",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
DEFINITION
}
