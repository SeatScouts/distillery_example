# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure for your application as:
#
#     config :distillery_example, key: :value
#
# And access this configuration in your application as:
#
#     Application.get_env(:distillery_example, :key)
#
# Or configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"
config :logger,
  backends: [LogflareLogger.HttpBackend, :console],
  utc_log: true,
  truncate: 4096,
  level: :info,
  sync_threshold: 500,
  discard_threshold: 500

config :logger, :info_log,
  path: "log/thelog.log",
  level: :info

config :logflare_logger_backend,
  # Default LogflareLogger level is :info. Note that log messages are filtered by the :logger application first
  level: :info,
  api_key: "N0uFpIjfsu7N",
  source_id: "${LOGFLARE_SOURCE_ID}",
  # minimum time in ms before a log batch is sent to the server ",
  flush_interval: 1_000,
  # maximum number of events before a log batch is sent to the server
  max_batch_size: 50
