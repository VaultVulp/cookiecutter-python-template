job "${GITHUB_REPOSITORY}" {
  datacenters = ["mad-unicorn"]
  type = "service"

  update {
    max_parallel = 1
    auto_revert = true
  }

  group "${GITHUB_REPOSITORY}" {
    count = 1

    task "${NOMAD_TASK}" {
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
            loki-external-labels = "project=${NOMAD_TASK}"
          }
        }
      }

      env {
        VAULT_ADDR = "${VAULT_ADDR}"
        VAULT_ROLE_ID = "${VAULT_ROLE_ID}"
        VAULT_SECRET_ID = "${VAULT_SECRET_ID}"
        VAULT_PATH = "${VAULT_PATH}"
      }

      logs {
        max_files = 5
        max_file_size = 5
      }
    }
  }
}