defmodule Metex.PingpongCoordinator do
  def start do
    ping = spawn(Metex.Ping, :loop, [])
    pong = spawn(Metex.Pong, :loop, [])
    send ping, {:ok, :pong, pong}
  end
end