locals {
  list_of_maps = [
    {
      a = "list0a"
      b = "list0b"
    },
    {
      a = "list0a"
      b = "list0b"
    },
  ]

  nested_maps = {
    "map_one" = {
      "item1" = "value1"
      "item2" = "value2"
    },
    "map_two" = {
      "item3" = "value3"
      "item4" = "value4"
    },
  }

  list_of_nested_maps = [
    {
      a = {
        a1 = "a1"
        a2 = "a2"
      }
    },
    {
      a = "list1a"
      b = "list1b"
    },
  ]
}

output "list_of_maps" {
  value = local.list_of_maps
}

output "list_of_maps_1st_map_a_value" {
  value = lookup(local.list_of_maps[0], "a")
}

output "nested_maps" {
  value = local.nested_maps
}

output "nested_maps_1st_map" {
  value = element(keys(local.nested_maps), 0)
}

output "list_of_nested_maps" {
  value = local.list_of_nested_maps
}

output "list_of_nested_maps_1st_map_a" {
  value = lookup(local.list_of_nested_maps[0], "a")
}

