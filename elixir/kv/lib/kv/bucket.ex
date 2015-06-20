defmodule KV.Bucket do
  @doc """
  start new bucket
  """

  def start_link do
    Agent.start_link(fn -> HashDict.new end)
  end

  @doc """
  get val in `bucket` with `key`
  """
  def get(bucket, key) do
    Agent.get(bucket, &HashDict.get(&1,key))
  end

  @doc """
   no doc
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &HashDict.put(&1, key, value))
  end

  @doc """
   no doc
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, &HashDict.pop(&1, key))
  end
end
