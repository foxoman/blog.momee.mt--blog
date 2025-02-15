# Package

version       = "0.1.0"
author        = "Mutsuha Asada"
description   = "The momeemt's blog"
license       = "MIT"
backend       = "c"
srcDir        = "src"
binDir        = "bin"
bin           = @["generator"]

# Dependencies

requires "nim >= 1.6.6"

# Tasks
task generate, "build blog":
  when defined(macosx):
    discard
  else:
    exec "nimble uninstall compiler brack -y; true"
    exec "nimble install -y compiler https://github.com/momeemt/brack"
  exec "cd generator && nimble generate"
  exec "cd frontend && nimble build"

task installUni, "install uni":
  exec "cd uni && nimble install -y"