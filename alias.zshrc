SCRIPT_PATH=${0:A:h};
source $SCRIPT_PATH/config

# Build dependencies + locales
alias gbuild="php bin/console dependencies install && php bin/console locales:compile"

# Install database
alias ginstall="php bin/console glpi:database:install --no-telemetry -p$DB_USER -u$DB_PASSWORD"
alias ginstall-force="php bin/console glpi:database:install --no-telemetry --force -n"

# Install test database
alias ginstall-test="ginstall --env=testing"
alias ginstall-test-old="ginstall --config-dir=./tests/config"
alias ginstall-test-force="ginstall-force --env=testing"
alias ginstall-test-force-old="ginstall-force --config-dir=./tests/config"

# Update database
alias gupdate="php bin/console glpi:database:update --allow-unstable --no-telemetry --force -n --skip-db-checks"

# Update test database
alias gupdate-test="gupdate --env=testing"
alias gupdate-test-old="gupdate --config-dir=./tests/config"

# E2e tests
alias open-e2e="export CYPRESS_BASE_URL="$GLPI_URL" && npx cypress open --project tests --e2e --browser electron"
alias run-e2e-local="export CYPRESS_BASE_URL="$GLPI_URL" && npx cypress run --project tests"
alias run-e2e-docker="export CYPRESS_BASE_URL="$GLPI_URL" && ./tests/run_tests.sh e2e"

# Run lint
alias lint-php=".github/actions/lint_php-lint.sh"
alias lint-scss=".github/actions/lint_scss-lint.sh"
alias lint-twig=".github/actions/lint_twig-lint.sh"
alias lint-js=".github/actions/lint_js-lint.sh"
alias lint-misc=".github/actions/lint_misc-lint.sh"
alias lint="lint-php && lint-scss && lint-twig && lint-js"

# Using docker
alias dcsl="docker compose exec app bin/console"
alias dsql="docker compose exec db mariadb -u glpi -pglpi -D glpi"

# PHPStan
alias phpstan="php vendor/bin/phpstan analyze"

# PHPUnit
alias phpunit="vendor/bin/phpunit"

# XDEBUG
alias xdebug-off="XDEBUG_MODE=off"
alias xdebug-debug="XDEBUG_MODE=debug"
alias xdebug-profile="XDEBUG_MODE=profile"

