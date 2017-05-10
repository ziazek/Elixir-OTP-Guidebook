defmodule Metex.Pong do
  def loop do
    receive do
      {:ok, :ping, sender_pid} ->
        IO.puts("pong")
        :timer.sleep(1000)
        send(sender_pid, {:ok, :pong, self()})
        loop()
      _ ->
        # NOOP
        IO.puts("don't know how to process this message")
    end
  end
end