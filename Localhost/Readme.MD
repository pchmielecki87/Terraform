# TF Local

## Local commands execution

terraform console

(1) [Expressions](https://developer.hashicorp.com/terraform/language/expressions)

  (a)
  max(1,2,3,4,5,-1)
  timestamp()
  upper("hello world")
  
  (b)
  echo 'split(",", "foo,bar,baz")' | terraform console

  (c) `https://developer.hashicorp.com/terraform/cli/commands/console`
  In the `c` folder:
    - terraform init
    - terrform console
    - var.apps.foo

  (d)
  In the `d` folder:
    - terraform init
    - terrform console
    - [for s in var.strings : upper(s)]

(2) [Functions](https://developer.hashicorp.com/terraform/language/functions)

  d

## Testing TF code

terraform fmt -check

terraform validate
