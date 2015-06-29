defmodule Player do
  def play(hand) do
    IO.puts("Player #{inspect(self)} is #{inspect(hand)}.")
    receive do
      {:give, n, dealer} ->
        {cards_to_send, remaining_hand} = Enum.split(hand, n)
        send(dealer, {:take, cards_to_send, self})
        play(remaining_hand)
      {:take, cards, _} ->
        play(hand ++ cards)
      :game_over ->
        IO.puts("Player #{inspect(self)} leaves.")
    end
  end
end

defmodule Dealer do
  def start(number_of_players \\ 2) do
    deck = shuffled_deck
    number_of_cards = trunc(length(deck) / number_of_players)
    dealt_cards = Enum.map(1..number_of_players, fn(i) ->
      Enum.slice(deck, (i - 1) * number_of_cards, number_of_cards)
    end)
    players = Enum.map(dealt_cards, fn(player_cards) -> spawn(Player, :play, [player_cards]) end)
    IO.puts("New game with #{inspect(players)}.")
    request_cards(players, 1)
    wait_for_cards(players, %{}, [])
  end

  def deal_cards(_, 0, _, result) do
    result
  end

  def deal_cards(deck, n, length, result) do
    [head | tail] = Tuple.to_list(Enum.split(deck, length))
    deal_cards(tail, n - 1, length, result ++ head)
  end

  def next_round(players) when length(players) == 1 do
    winner = List.first(players)
    IO.puts("There is a winner #{inspect(winner)}.")
    send(winner, :game_over)
  end

  def next_round(players) when length(players) == 0 do
    IO.puts("It's a draw")
  end

  def next_round(players) do
    request_cards(players, 1)
    wait_for_cards(players, %{}, [])
  end

  def evaluate_round(received_cards, pile) do
    players_with_highest_card = players_with_highest_card(received_cards)
    if(length(players_with_highest_card) > 1) do
      request_cards(players_with_highest_card, 3)
      wait_for_cards(players_with_highest_card, %{}, pile ++ collect_cards(received_cards))
    else
      send(List.first(players_with_highest_card), {:take, pile ++ collect_cards(received_cards), self})
      next_round(eliminate_losers(received_cards))
    end
  end

  def collect_cards(received_cards) do
    Enum.flat_map(received_cards, fn({_, cards}) -> cards end)
  end

  def winning_card(received_cards) do
    Enum.map(received_cards, fn({_, cards}) -> List.last(cards) || 0 end)
      |> Enum.max
  end

  def players_with_highest_card(received_cards) do
    winning_card = winning_card(received_cards)
    Enum.filter(received_cards, fn({_, cards}) -> List.last(cards) == winning_card end)
      |> Enum.map(fn({pid, _}) -> pid end)
  end

  def eliminate_losers(received_cards) do
    Enum.filter_map(received_cards, fn(player_hand) ->
      case player_hand do
        {pid, []} ->
          send(pid, :game_over)
          false
        _ -> true
      end
    end,
    fn({player, _}) -> player end)
  end

  def wait_for_cards(players, received_cards, pile) when map_size(received_cards) == length(players) do
    evaluate_round(received_cards, pile)
  end

  def wait_for_cards(players, received_cards, pile) do
    receive do
      {:take, cards, player} ->
        wait_for_cards(players, Map.put(received_cards, player, cards), pile)
    end
  end

  def request_cards(players, n) do
    Enum.each(players, fn(player) ->
      send(player, {:give, n, self})
    end)
  end

  def shuffled_deck do
    # card_values = [2,3,4,5,6,7,8,9,10,11,12,13,14]
    card_values = [1,2,3,4]
    all_cards = card_values ++ card_values ++ card_values ++ card_values
    Enum.shuffle(all_cards)
  end
end
