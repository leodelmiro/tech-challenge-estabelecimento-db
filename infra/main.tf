module "db-cliente" {
  source = "./services/db-cliente"
}

module "db-pagamento" {
  source = "./services/db-pagamento"
}

module "db-pedido" {
  source = "./services/db-pedido"
}

module "db-produto" {
  source = "./services/db-produto"
}