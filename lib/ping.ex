defmodule Metex.Ping do
  def loop do
    receive do
      {:ok, :pong, sender_pid} ->
        IO.puts("ping")
        :timer.sleep(1000)
        send(sender_pid, {:ok, :ping, self()})
      _ ->
        # NOOP
        IO.puts("don't know how to process this message")
    end
    loop()
  end
end