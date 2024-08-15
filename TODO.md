-      HATCHET_DEPLOY_STRATEGY: git
-      HATCHET_RETRIES: 3
-      HATCHET_BUILDPACK_BASE: https://github.com/Kajabi/heroku-buildpack-bootboot.git
-      HATCHET_APP_LIMIT: 80

bundle exec hatchet ci:setup
