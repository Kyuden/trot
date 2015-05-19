defmodule Trot do
  @http_methods [:get, :post, :put, :patch, :delete, :options]

  defmacro is_http_method(thing) do
    quote do
      is_atom(unquote(thing)) and unquote(thing) in @http_methods
    end
  end

  @doc """
  Takes a Plug.Conn and sends a "not found" message to the requestor.
  """
  def not_found(conn) do
    Plug.Conn.send_resp(conn, Plug.Conn.Status.code(:not_found), "<html><body>Not Found</body></html>")
  end
end
