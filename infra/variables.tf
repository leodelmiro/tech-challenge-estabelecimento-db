variable "regionDefault" {
  default = "us-east-1"
}

variable "projectName" {
  default = "tech-fiap-db"
}

variable "vpcCidr" {
  default = "172.31.0.0/16"
}

variable "dbName" {
  default = "estabelecimento"
}

variable "instanceClass" {
  default = "db.t3.micro"
}

variable "engineVersion" {
  default = "17.1"
}

variable "backupRetentionPeriod" {
  default = 1
}

variable "publicly_accessible" {
  default = true # True para fins de teste
}

variable "skipFinalSnapshot" {
  default = true # True para fins de teste
}

variable "username" {
  default = "postgres" # Variavel aberta para fins de teste
}

variable "password" {
  default = "12345678" # Variavel aberta para fins de teste
}

variable "functionName" {
  default = "create-schemas"
}

variable "runtime" {
  default = "nodejs20.x"
}