defmodule FeatureToggler do
  import Kernel

  @moduledoc """
  Provides function to set/unset and check if a feature is set/unset for a user id
  """

  @doc """
	## Parameters
    - client : client to connect to redis
    - feature : String that represents the name of the feature
    - user_id : Integer that represents the identity of a user

  ## Examples
    iex> FeatureToggler.activate_feature(client, "awesome_feature", 1)
    true

  """
  def activate_feature(client, feature, user_id) when is_integer(user_id) do
    client |> Exredis.query(["SADD", feature, user_id]) |> return_as_boolean
  end

  @doc """
	## Parameters
    - client : client to connect to redis
    - feature : String that represents the name of the feature
    - user_id : Integer that represents the identity of a user

  ## Examples
    iex> FeatureToggler.deactivate_feature(client, "awesome_feature", 1)
    true

  """
  def deactivate_feature(client, feature, user_id) when is_integer(user_id) do
    client |> Exredis.query(["SREM", feature, user_id]) |> return_as_boolean
  end

  @doc """
	## Parameters
    - client : client to connect to redis
    - feature : String that represents the name of the feature
    - user_id : Integer that represents the identity of a user

  ## Examples
    iex> FeatureToggler.activated_for?(client, "awesome_feature", 1)
    true

  """
  def activated_for?(client, feature, user_id) when is_integer(user_id) do
    client |> Exredis.query(["SISMEMBER", feature, user_id]) |> return_as_boolean
  end

  @doc """
	## Parameters
    - client : client to connect to redis
    - feature : String that represents the name of the feature
    - user_id : Integer that represents the identity of a user

  ## Examples
    iex> FeatureToggler.deactivated_for?(client, "awesome_feature", 1)
    false

  """
  def deactivated_for?(client, feature, user_id) when is_integer(user_id) do
    client |> Exredis.query(["SISMEMBER", feature, user_id]) |> return_as_boolean |> Kernel.!
  end

  @doc false
  def return_as_boolean(result) do
    if result == "1", do: true, else: false
  end

end
