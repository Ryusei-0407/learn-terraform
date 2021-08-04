variable "list_of_maps1" {
  type    = list(map(string))
  default = []
}

variable "list_of_maps2" {
  type = list(map(string))
  default = [{
    name = "list_of_maps2"
  }]
}

variable "list_of_maps3" {
  type = list(map(string))
  default = [{
    name = "list_of_maps3"
  }]
}

output "list_of_maps" {
  value = concat(var.list_of_maps1, var.list_of_maps2, var.list_of_maps3)
}

output "merged_map" {
  value = merge(tomap({ "a" = "1" }), tomap({ "c" = "3" }))
}
