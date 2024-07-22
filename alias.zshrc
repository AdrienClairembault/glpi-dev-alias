SCRIPT_PATH=${0:A:h};
source $SCRIPT_PATH/config

# Build dependencies + locales
alias gbuild="php bin/console dependencies install && php bin/console locales:compile"

# Install database
alias ginstall="php bin/console glpi:database:install --no-telemetry -p$DB_USER -u$DB_PASSWORD"
alias ginstall-force="php bin/console glpi:database:install --no-telemetry --force -n"

# Install test database
alias ginstall-test="ginstall --config-dir=./tests/config"
alias ginstall-test-force="ginstall-force --config-dir=./tests/config"

# Update database
alias gupdate="php bin/console glpi:database:update --allow-unstable --no-telemetry --force -n"

# Update test database
alias gupdate-test="gupdate --config-dir=./tests/config"

# E2e tests
alias open-e2e="export CYPRESS_BASE_URL="$GLPI_URL" && npm run test:e2e"
alias run-e2e-local="export CYPRESS_BASE_URL="$GLPI_URL" && npx cypress run --project tests"
alias run-e2e-docker="export CYPRESS_BASE_URL="$GLPI_URL" && ./tests/run_tests.sh e2e"

# Run lint
alias run-lint-php=".github/actions/lint_php-lint.sh"
alias run-lint-scss=".github/actions/lint_scss-lint.sh"
alias run-lint-twig=".github/actions/lint_twig-lint.sh"
alias run-lint-js=".github/actions/lint_js-lint.sh"
alias run-lint-misc=".github/actions/lint_misc-lint.sh"
alias run-lint="run-lint-php && run-lint-scss &&run-lint-twig && run-lint-js= && run-lint-misc"

