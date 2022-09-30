defmodule Esdb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Esdb.Repo,
      # Start the Telemetry supervisor
      EsdbWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Esdb.PubSub},
      # Start the Endpoint (http/https)
      EsdbWeb.Endpoint
      # Start a worker by calling: Esdb.Worker.start_link(arg)
      # {Esdb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Esdb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EsdbWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
