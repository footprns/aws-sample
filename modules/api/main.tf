resource "aws_api_gateway_rest_api" "MyDemoAPI" {
  name        = "MyDemoAPI"
  description = "This is my API for demonstration purposes"
  endpoint_configuration {
    types = ["EDGE"]
  }
}

resource "aws_api_gateway_resource" "MyDemoResource" {
  rest_api_id = "${aws_api_gateway_rest_api.MyDemoAPI.id}"
  parent_id   = "${aws_api_gateway_rest_api.MyDemoAPI.root_resource_id}"
  path_part   = "my"
}

resource "aws_api_gateway_method" "MyDemoMethod" {
  rest_api_id   = "${aws_api_gateway_rest_api.MyDemoAPI.id}"
  resource_id   = "${aws_api_gateway_resource.MyDemoResource.id}"
  http_method   = "POST"
  authorization = "NONE"
}