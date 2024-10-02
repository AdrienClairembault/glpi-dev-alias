SCRIPT_PATH=${0:A:h};
source $SCRIPT_PATH/config

# Build dependencies + locales
alias gbuild="xdebug-off php bin/console dependencies install && php bin/console locales:compile"

# Install database
alias ginstall="xdebug-off php bin/console glpi:database:install --no-telemetry -p$DB_USER -u$DB_PASSWORD"
alias ginstall-force="xdebug-off php bin/console glpi:database:install --no-telemetry --force -n"

# Install test database
alias ginstall-test="xdebug-off ginstall --env=testing"
alias ginstall-test-old="xdebug-off ginstall --config-dir=./tests/config"
alias ginstall-test-force="xdebug-off ginstall-force --env=testing"
alias ginstall-test-force-old="xdebug-off ginstall-force --config-dir=./tests/config"

# Update database
alias gupdate="xdebug-off php bin/console glpi:database:update --allow-unstable --no-telemetry --force -n"

# Update test database
alias gupdate-test="xdebug-off gupdate --env=testing"
alias gupdate-test-old="xdebug-off gupdate --config-dir=./tests/config"

# E2e tests
alias open-e2e="export CYPRESS_BASE_URL="$GLPI_URL" && npx cypress open --project tests --e2e --browser electron"
alias run-e2e-local="export CYPRESS_BASE_URL="$GLPI_URL" && npx cypress run --project tests"
alias run-e2e-docker="export CYPRESS_BASE_URL="$GLPI_URL" && ./tests/run_tests.sh e2e"

# Run lint
alias lint-php="xdebug-off .github/actions/lint_php-lint.sh"
alias lint-scss=".github/actions/lint_scss-lint.sh"
alias lint-twig=".github/actions/lint_twig-lint.sh"
alias lint-js=".github/actions/lint_js-lint.sh"
alias lint-misc=".github/actions/lint_misc-lint.sh"
alias lint="lint-php && lint-scss && lint-twig && lint-js"

# Using docker
alias dcsl="docker compose exec app bin/console"
alias dsql="docker compose exec db mariadb -u glpi -pglpi -D glpi"

# PHPStan
alias phpstan="xdebug-off php vendor/bin/phpstan analyze"

# PHPUnit
alias phpunit="xdebug-off vendor/bin/phpunit"
alias phpunit-debug="xdebug-debug vendor/bin/phpunit"
alias phpunit-profile="xdebug-profile vendor/bin/phpunit"

# XDEBUG
alias xdebug-off="XDEBUG_MODE=off"
alias xdebug-debug="XDEBUG_MODE=debug"
alias xdebug-profile="XDEBUG_MODE=profile"

