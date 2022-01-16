import psycopg2
import matplotlib.pyplot as plt
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

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)

with conn:
    cur = conn.cursor()

    cur.execute(query_1)
    data_to_visualise = {}

    for row in cur:
      data_to_visualise[row[0]] = row[1]

    x_range = range(len(data_to_visualise.keys()))
 
    figure, bar_ax = plt.subplots()
    bar = bar_ax.bar(x_range, data_to_visualise.values(), label='Total')
    bar_ax.set_title('Popularity of different openings')
    bar_ax.set_xlabel('Opening code')
    bar_ax.set_ylabel('Opening popularity in games')
    bar_ax.set_xticks(x_range)
    bar_ax.set_xticklabels(data_to_visualise.keys())


    cur.execute(query_2)
    data_to_visualise = {}

    for row in cur:
      data_to_visualise[row[0] + ", " + str(row[1])] = row[2]

    figure, pie_ax = plt.subplots()
    pie_ax.pie(data_to_visualise.values(), labels=data_to_visualise.keys(), autopct='%1.1f%%')
    pie_ax.set_title('Amount of games, which each player played')


    cur.execute(query_3)
    data_to_visualise = {}
    names_x_axis = []
    games_as_white = []
    games_as_black = []
    for row in cur:
        names_x_axis.append(row[0] + ", " + str(row[1]))
        games_as_white.append(row[2])
        games_as_black.append(row[3])


    figure, bar_ax = plt.subplots()
    bar_ax.bar(names_x_axis, games_as_white, color='gray', label='games as white')
    bar_ax.bar(names_x_axis, games_as_black, bottom=games_as_white, color='black', label='games_as black')
    bar_ax.set_title('Number of games played by black and white by each player')
    bar_ax.set_xlabel('Player name and rating')
    bar_ax.set_ylabel('Amount of games')


mng = plt.get_current_fig_manager()
mng.resize(1400, 600)

plt.show()
