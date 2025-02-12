resource "aws_dynamodb_table" "tb_cliente_table" {
  name           = "tb_cliente"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "cpf"

  attribute {
    name = "cpf"
    type = "S"
  }
}