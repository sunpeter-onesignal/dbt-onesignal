# dbt
dbt (data build tool) is a tool that can manage views and transform data for OneSignal's data lakehouse.

## How to test locally

Run `docker-compose up`.
 - Trino will be running on http://localhost:8080

## Adding data connections

Follow instructions in [dbt documentation](https://docs.getdbt.com/dbt-cli/configure-your-profile)
to add profiles to `/profiles.yml`

## Adding new projects
`dbt init [project-name]`
