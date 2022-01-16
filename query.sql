-- Get opening and it's popularity in games
select opening_code, count(*) from public."Game" as game
join public."Opening" as opening on game.opening_code = opening.code
group by opening_code

-- Get amount of games, which played every player

with white_plays as (select player.id, rating, count(*) as amount_of_games from public."Player" as player
join public."Game" as game on game.white_id = player.id
group by player.id),

 black_plays as (select player.id, rating, count(*) as amount_of_games from public."Player" as player
join public."Game" as game on game.black_id = player.id
group by player.id)


select COALESCE(w.id, b.id) as id, COALESCE(w.rating, b.rating) as rating, 
(COALESCE(w.amount_of_games, 0) + COALESCE(b.amount_of_games, 0) ) as amount_of_games from white_plays as w full join black_plays as b  on w.id = b.id
group by w.id, w.rating, w.amount_of_games, b.id, b.rating, b.amount_of_games

-- Get amount of games for white and for black side for each player
with white_plays as (select player.id, rating, count(*) as amount_of_games from public."Player" as player
join public."Game" as game on game.white_id = player.id
group by player.id),

 black_plays as (select player.id, rating, count(*) as amount_of_games from public."Player" as player
join public."Game" as game on game.black_id = player.id
group by player.id)



select COALESCE(w.id, b.id) as id, COALESCE(w.rating, b.rating) as rating, 
COALESCE(w.amount_of_games, 0) as games_as_white, COALESCE(b.amount_of_games, 0) as games_as_black from white_plays as w full join black_plays as b  on w.id = b.id
group by w.id, w.rating, w.amount_of_games, b.id, b.rating, b.amount_of_games
