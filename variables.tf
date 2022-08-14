variable "create" {
  description = "Controls if resources should be created."
  type        = bool
  default     = true
}

variable "alias" {
  description = "The alias of the prometheus workspace."
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}