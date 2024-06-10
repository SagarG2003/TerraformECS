resource "aws_ecs_service" "hello_world_service" {
  name            = var.app_name
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.hello_world.arn
  desired_count   = 1

  network_configuration {
    subnets          = aws_subnet.subnet.*.id
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }
}
