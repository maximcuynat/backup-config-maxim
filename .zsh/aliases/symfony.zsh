# ------------------------------------------------------------
# Symfony aliases
# ------------------------------------------------------------

alias sf='php bin/console'
alias sfc='php bin/console cache:clear'
alias sfcw='php bin/console cache:warmup'
alias sfcc='php bin/console cache:clear && php bin/console cache:warmup'
alias sfs='php bin/console server:stop'

# Doctrine
alias sfr='php bin/console doctrine:migrations:migrate'
alias sfrp='php bin/console doctrine:migrations:migrate --no-interaction'  # sans confirmation
alias sfmg='php bin/console doctrine:migrations:generate'
alias sfmd='php bin/console doctrine:migrations:diff'                      # génère migration depuis diff
alias sfms='php bin/console doctrine:migrations:status'
alias sfml='php bin/console doctrine:migrations:list'
alias sfschema='php bin/console doctrine:schema:update --force'            # màj schéma direct
alias sfl='php bin/console doctrine:schema:validate'
alias sfdql='php bin/console doctrine:query:dql'                           # usage: sfdql "SELECT..."

# Debug
alias sfd='php bin/console debug:container'
alias sfds='php bin/console debug:container --show-private'
alias sfrt='php bin/console debug:router'
alias sfrts='php bin/console debug:router --show-controllers'              # avec controllers
alias sfde='php bin/console debug:event-dispatcher'
alias sfdtwig='php bin/console debug:twig'
alias sfenv='php bin/console debug:dotenv'                                 # variables d'env chargées

# Make / Messenger
alias sfmake='php bin/console make:entity'
alias sfmakec='php bin/console make:controller'
alias sfmakef='php bin/console make:form'
alias sfmsg='php bin/console messenger:consume -vv'                        # démarre le consumer
alias sfmsgf='php bin/console messenger:failed:show'

# Security
alias sfuser='php bin/console security:hash-password'

# Tests
alias sftest='php bin/phpunit'
alias sftestf='php bin/phpunit --filter'                                   # usage: sftestf MyTest

# ------------------------------------------------------------
# Symfony helper
# ------------------------------------------------------------

sfhelp() {
  echo ""
  echo "  🎵  Symfony Aliases Cheatsheet"
  echo "  ──────────────────────────────────────────────────────"
  echo ""
  echo "  CACHE"
  echo "    sfc         → cache:clear"
  echo "    sfcw        → cache:warmup"
  echo "    sfcc        → cache:clear + warmup"
  echo ""
  echo "  DOCTRINE / MIGRATIONS"
  echo "    sfr         → migrations:migrate"
  echo "    sfrp        → migrations:migrate     (no-interaction)"
  echo "    sfmg        → migrations:generate"
  echo "    sfmd        → migrations:diff        (depuis schema diff)"
  echo "    sfms        → migrations:status"
  echo "    sfml        → migrations:list"
  echo "    sfschema    → schema:update --force"
  echo "    sfl         → schema:validate"
  echo "    sfdql <q>   → doctrine:query:dql"
  echo ""
  echo "  DEBUG"
  echo "    sfd         → debug:container"
  echo "    sfds        → debug:container        (+ privés)"
  echo "    sfrt        → debug:router"
  echo "    sfrts       → debug:router           (+ controllers)"
  echo "    sfde        → debug:event-dispatcher"
  echo "    sfdtwig     → debug:twig"
  echo "    sfenv       → debug:dotenv"
  echo ""
  echo "  MAKE"
  echo "    sfmake      → make:entity"
  echo "    sfmakec     → make:controller"
  echo "    sfmakef     → make:form"
  echo ""
  echo "  MESSENGER"
  echo "    sfmsg       → messenger:consume -vv"
  echo "    sfmsgf      → messenger:failed:show"
  echo ""
  echo "  SECURITY"
  echo "    sfuser      → security:hash-password"
  echo ""
  echo "  TESTS"
  echo "    sftest         → php bin/phpunit"
  echo "    sftestf <n>    → phpunit --filter"
  echo ""
}
