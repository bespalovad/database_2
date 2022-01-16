import psycopg2
import os
from dotenv import load_dotenv, find_dotenv
load_dotenv(find_dotenv())
# Program requires .env file with key specified below

username = os.environ.get('USER_DEV')
password = os.environ.get('PASSWORD_DEV')
database = os.environ.get('DB_DEV')
host = os.environ.get('HOST_DEV')
port = '5432'


query_1 = '''
select opening_code, count(*) from public."Game" as game
join public."Opening" as opening on game.opening_code = opening.code
group by opening_code
'''

query_2 = '''
with white_plays as (select player.id, rating, count(*) as amount_of_games from public."Player" as player
join public."Game" as game on game.white_id = player.id
group by player.id),

 black_plays as (select player.id, rating, count(*) as amount_of_games from public."Player" as player
join public."Game" as game on game.black_id = player.id
group by player.id)


select COALESCE(w.id, b.id) as id, COALESCE(w.rating, b.rating) as rating, 
(COALESCE(w.amount_of_games, 0) + COALESCE(b.amount_of_games, 0) ) as amount_of_games from white_plays as w full join black_plays as b  on w.id = b.id
group by w.id, w.rating, w.amount_of_games, b.id, b.rating, b.amount_of_games
'''

query_3 = '''
with white_plays as (select player.id, rating, count(*) as amount_of_games from public."Player" as player
join public."Game" as game on game.white_id = player.id
group by player.id),

 black_plays as (select player.id, rating, count(*) as amount_of_games from public."Player" as player
join public."Game" as game on game.black_id = player.id
group by player.id)



select COALESCE(w.id, b.id) as id, COALESCE(w.rating, b.rating) as rating, 
COALESCE(w.amount_of_games, 0) as games_as_white, COALESCE(b.amount_of_games, 0) as games_as_black from white_plays as w full join black_plays as b  on w.id = b.id
group by w.id, w.rating, w.amount_of_games, b.id, b.rating, b.amount_of_games
'''

con = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)


with con:

    cur = con.cursor()

    print('QUERY 1:')
    cur.execute(query_1)
    for row in cur:
      print(row)

    print('\nQUERY 2:')
    cur.execute(query_2)
    for row in cur:
      print(row)

    print('\nQUERY 3:')
    cur.execute(query_3)
    for row in cur:
      print(row)
