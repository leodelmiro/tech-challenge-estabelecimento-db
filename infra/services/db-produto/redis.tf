resource "aws_elasticache_cluster" "redis_produto" {
  cluster_id      = "redis-produto"
  engine          = "redis"
  node_type       = "cache.t3.micro"
  num_cache_nodes = 1
  engine_version  = "7.0"
  port            = 6379
}