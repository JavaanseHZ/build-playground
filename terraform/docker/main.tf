provider "docker" {
  host    = "unix://localhost/var/run/docker.sock"
  version = "~> 0.1"
}

variable "hostname" {}

data "docker_registry_image" "kafka" {
  name = "landoop/fast-data-dev:2.0.0"
}

resource "docker_image" "kafka" {
  keep_locally  = true
  name          = "${data.docker_registry_image.kafka.name}"
  pull_triggers = ["${data.docker_registry_image.kafka.sha256_digest}"]
}

resource "docker_container" "kafka" {
  image    = "${docker_image.kafka.name}"
  must_run = true
  name     = "kafka_container"

  ports {
    external = 2181
    internal = 2181
  }
  ports {
    external = 3030
    internal = 3030
  }
  ports {
    external = 8081
    internal = 8081
  }
  ports {
    external = 8082
    internal = 8082
  }
  ports {
    external = 8083
    internal = 8083
  }
  ports {
    external = 9092
    internal = 9092
  }

  env = ["ADV_HOST=${var.hostname}", "SAMPLEDATA=0", "RUNTESTS=0"]
}

provider "kafka-connect" {
  url = "http://localhost:8083"
}
/*
variable database_ip {}
variable database_port {}
variable database_name {}
variable database_password {}

resource "kafka-connect_connector" "contracts-source" {
  name = "source-contracts"

  config = {
    "connector.class"= "io.confluent.connect.jdbc.JdbcSourceConnector"
    "mode"= "timestamp"
    "timestamp.column.name"= "ts"
    "topic.prefix"= "Contracts"
    "tasks.max"= "1"
    "connection.url"= "jdbc:postgresql://${var.database_ip}:${var.database_port}/${var.database_name}?user=postgres&password=${var.database_password}"
    "poll.interval.ms"= 1000
    "query" = "SELECT * FROM contracts"
    "key.converter"= "io.confluent.connect.avro.AvroConverter"
    "value.converter"= "io.confluent.connect.avro.AvroConverter"
    "key.converter.schema.registry.url"="http://localhost:8081"
    "value.converter.schema.registry.url"="http://localhost:8081"
    "transforms"="createKey,extractInt,SetSchemaName"
    "transforms.createKey.type"="org.apache.kafka.connect.transforms.ValueToKey"
    "transforms.createKey.fields"="id"
    "transforms.extractInt.type"="org.apache.kafka.connect.transforms.ExtractField$Key"
    "transforms.extractInt.field"="id"
    "transforms.SetSchemaName.type"="org.apache.kafka.connect.transforms.SetSchemaMetadata$Value"
    "transforms.SetSchemaName.schema.name"="kafkaevent.Contracts"
  }
}*/
