job "${GITHUB_REPOSITORY}" {
  datacenters = ["mad-unicorn"]
  type = "service"

  update {
    max_parallel = 1
    auto_revert = true
  }

  group "${GITHUB_REPOSITORY}" {
    count = 1

    task "{{cookiecutter.project_slug}}" {
      driver = "docker"

      config {
        image = "docker.pkg.github.com/${DOCKER_IMAGE}:${DOCKER_TAG}"

        auth {
          username = "puller"
          password = "${GITHUB_TOKEN}"
        }

        logging {
          type = "loki"
          config {
            loki-url = "https://${LOKI_USERNAME}:${LOKI_PASSWORD}@${LOKI_HOST}/loki/api/v1/push"
            loki-external-labels = "project={{cookiecutter.project_slug}}"
          }
        }
      }

      env {
        ENV_FOR_DYNACONF = "production"
        VAULT_URL_FOR_DYNACONF = "${VAULT_ADDR}"
        VAULT_ENABLED_FOR_DYNACONF = true
        VAULT_ROLE_ID_FOR_DYNACONF = "${VAULT_ROLE_ID}"
        VAULT_SECRET_ID_FOR_DYNACONF = "${VAULT_SECRET_ID}"
        VAULT_PATH_FOR_DYNACONF = "{{cookiecutter.project_slug}}"
      }

      logs {
        max_files = 5
        max_file_size = 5
      }
    }
  }
}