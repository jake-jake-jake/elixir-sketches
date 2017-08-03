defmodule Pop.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    start_state = 1..15 |> Enum.to_list
    Pop.Supervisor.start_link(start_state)
  end
end
