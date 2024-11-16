resource "aws_elasticache_cluster" "redis" {
  cluster_id      = "redis-estabelecimento"
  engine          = "redis"
  node_type       = "cache.t3.micro"
  num_cache_nodes = 1
  engine_version  = "7.0"
  port            = 6379
}