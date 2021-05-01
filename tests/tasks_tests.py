from invoke import task, Collection

# TASK DEFINITIONS
ns = Collection('tests')

@task
def unit_tests(c):
  """Run R unit tests"""
  c.run("R -f tests/run_unit_tests.R")
ns.add_task(unit_tests)

@task
def lint(c):
  """Run R linter"""
  c.run("R -f tests/run_lintr.R", hide='out')
ns.add_task(lint)
