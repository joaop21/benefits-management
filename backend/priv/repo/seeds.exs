alias Benefits.Accounts
alias Benefits.Perks

Accounts.create_user(%{"user_id" => "user1", "balance" => "250.00"})
Accounts.create_user(%{"user_id" => "user2", "balance" => "100.00"})
Accounts.create_user(%{"user_id" => "user3", "balance" => "25.00"})
Accounts.create_user(%{"user_id" => "user4", "balance" => "10.00"})
Accounts.create_user(%{"user_id" => "user5", "balance" => "0.00"})

1..100
|> Enum.each(fn num ->
  price = Enum.random(20..100)

  Perks.create_product(%{
    "identifier" => "product#{num}",
    "name" => "Product#{num}",
    "price" => price
  })
end)
