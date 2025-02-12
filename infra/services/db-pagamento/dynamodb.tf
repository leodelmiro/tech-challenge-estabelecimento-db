resource "aws_dynamodb_table" "tb_pagamento_table" {
  name           = "tb_pagamento"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}