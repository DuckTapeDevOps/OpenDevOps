// Spin up a single ECS Cluster and service with no load balancer
resource "aws_ecs_cluster" "my-cluster" {
  name = "${var.service_name}-cluster"
}

resource "aws_ecs_service" "my-api" {
  name            = "${var.service_name}-service"
  cluster         = aws_ecs_cluster.my-cluster.id
  launch_type     = "FARGATE"
  task_definition = aws_ecs_task_definition.my-api.arn
  desired_count   = 1

  load_balancer {
   target_group_arn = aws_alb_target_group.main.arn
   container_name   = "${var.service_name}-container-definition"
   container_port   = var.container_port
 }

  network_configuration {
    subnets = [aws_subnet.private_a.id, aws_subnet.private_b.id]
    security_groups = [aws_security_group.api_sg.id]
    assign_public_ip = true //TODO: This fixed the Secrets Manager Issue
  }

  depends_on      = [aws_iam_role.my_api_task_execution_role]
}

resource "aws_ecs_task_definition" "my-api" {
  family = "${var.service_name}-task-definition"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn = aws_iam_role.my_api_task_execution_role.arn
  task_role_arn =  aws_iam_role.task_role.arn
  network_mode = "awsvpc"
  cpu = var.api_task_cpu
  memory = var.api_task_memory
  container_definitions = jsonencode([
    {
      name      = "${var.service_name}-container-definition"
      image     = var.api_image_url
      cpu       = var.api_container_cpu
      memory    = var.api_container_memory
      essential = true
      portMappings = [{
        protocol      = "tcp",
        containerPort = var.container_port,
        hostPort      = var.container_port,
      }],
      logConfiguration = {
        logDriver = "awslogs",
        options = {
          awslogs-group = aws_cloudwatch_log_group.my-api.name,
          awslogs-region = var.aws_region,
          awslogs-stream-prefix = var.service_name
      }
    }
    }
  ])
}


// Creates the log group for fargate logs
resource "aws_cloudwatch_log_group" "my-api" {
  name = "/ecs/fargate_log_group/${var.service_name}"
}
