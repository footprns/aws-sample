module "lambda" {
  source = "./modules/lambda"
  function_name = "HelloFuncAuto"
  handler = "main.handler"
  runtime = "nodejs10.x"
  filename = "./www/lambda_function.zip"
}

module "gateway_rest_api" {
  source = "./modules/api-gateway"
  name = "ServerlessExample"
  invoke_arn = module.lambda.invoke_arn
  function_name = module.lambda.function_name
}

output "base_url" {
  value = module.gateway_rest_api.base_url
}

# Archive a single file.

data "archive_file" "python_code" {
  type        = "zip"
  source_file = "python_code/main.py"
  output_path = "python_code/main.zip"
}

module "lambda_python" {
  source = "./modules/lambda"
  function_name = "HelloFuncPython"
  handler = "main.lambda_handler"
  runtime = "python3.8"
  filename = "python_code/main.zip"
}

module "python_rest_api" {
  source = "./modules/api-gateway"
  name = "ServerlessPython"
  invoke_arn = module.lambda_python.invoke_arn
  function_name = module.lambda_python.function_name
}

output "python_base_url" {
  value = module.python_rest_api.base_url
}