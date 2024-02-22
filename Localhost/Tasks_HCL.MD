# TF EXERCISES

## HCL LOCAL CONSOLE

(1) [Expressions](https://developer.hashicorp.com/terraform/language/expressions)

  (a)
    - max(1,2,3,4,5,-1)
    - timestamp()
    - upper("hello world")
  
  (b)
    - echo 'split(",", "foo,bar,baz")' | terraform console

  (c) `https://developer.hashicorp.com/terraform/cli/commands/console`
  In the `Localhost` \ `c` folder:
    - terraform init
    - terrform console
    - var.apps.foo

  (d)
  In the `Localhost` \ `d` folder:
    - terraform init
    - terrform console
    - [for s in var.strings : upper(s)]

(2) [Functions](https://developer.hashicorp.com/terraform/language/functions)

  (a) math
    - abs(-12.4)
    - log(50, 10)
    - max(12, 54, 3)

  (b) string
    - format("Hello, %s!", "Ander")
    - lower("HELLO")
    - replace("1 + 2 + 3", "+", "-")
    - trim("?!hello?!", "!?")

  (c) files
    - fileexists(path/to/file.txt)
    - filebase64(path/to/file.txt)
