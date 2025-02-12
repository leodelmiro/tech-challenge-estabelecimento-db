resource "null_resource" "install_layer_dependencies" {
  provisioner "local-exec" {
    command = "cd ${path.cwd}/services/db-pedido/lambda_function/init-db/app && npm install"
  }

  triggers = {
    requirements_hash = filesha256("${path.cwd}/services/db-pedido/lambda_function/init-db/app/package.json")
    app_hash          = filesha256("${path.cwd}/services/db-pedido/lambda_function/init-db/app/app.mjs")
  }
}

data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "${path.cwd}/services/db-pedido/lambda_function/init-db/app"
  output_path = "lambda_function.zip"
  depends_on = [
    null_resource.install_layer_dependencies
  ]
}

resource "aws_lambda_function" "create_schemas" {
  filename         = "lambda_function.zip"
  function_name    = var.functionName
  role             = data.aws_iam_role.LabRole.arn
  handler          = "app.lambdaHandler"
  memory_size      = 128
  timeout          = 100
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = var.runtime

  depends_on = [
    data.archive_file.lambda
  ]

  environment {
    variables = {
      USER_NAME      = var.username
      PASSWORD       = var.password
      RDS_PROXY_HOST = aws_db_instance.pedido.endpoint
      DB_NAME        = var.dbName
    }
  }
}