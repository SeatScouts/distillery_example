defmodule DistilleryExample.Worker do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    Process.send_after(self(), :do_work, 1_000)
    {:ok, nil}
  end

  def handle_info(:do_work, state) do
    {:noreply, state}
  end
end
