insert into public."Player" (id, rating) values ('andrew', 1542);
insert into public."Player" (id, rating) values ('anton', 1601);
insert into public."Player" (id, rating) values ('danil', 1608);
insert into public."Player" (id, rating) values ('masha', 1700);
insert into public."Player" (id, rating) values ('lera', 1301);


insert into public."Opening" (code, name, ply) values ('C20', 'King''s Pawn Game: Leonardis Variation',3);
insert into public."Opening" (code, name, ply) values ('B27', 'Sicilian Defense: Mongoose Variation',4);
insert into public."Opening" (code, name, ply) values ('D00','Blackmar-Diemer Gambit: Pietrowsky Defense',10);
insert into public."Opening" (code, name, ply) values ('C50','Italian Game: Schilling-Kostic Gambit',6);
insert into public."Opening" (code, name, ply) values ('B01','Scandinavian Defense: Mieses-Kotroc Variation',4);

insert into public."Game" (id, start_time, end_time, all_moves, game_status,
						  winner, time_increment, white_id, black_id, opening_code) 
						  values 
						  ('TZJHLljE', 1.50421E+12,1.50421E+12, 
						   'e4 e5 d3 d6 Be3 c6 Be2 b5 Nd2 a5 a4 c5 axb5 Nc6 bxc6 Ra6 Nc4 a4 c3 a3 Nxa3 Rxa3 Rxa3 c4 dxc4 d5 cxd5 Qxd5 exd5 Be6 Ra8+ Ke7 Bc5+ Kf6 Bxf8 Kg6 Bxg7 Kxg7 dxe6 Kh6 exf7 Nf6 Rxh8 Nh5 Bxh5 Kg5 Rxh7 Kf5 Qf3+ Ke6 Bg4+ Kd6 Rh6+ Kc5 Qe3+ Kb5 c4+ Kb4 Qc3+ Ka4 Bd1#',
						  'outoftime', 'white', 15, 'andrew', 'anton', 'C20');
						  
insert into public."Game" (id, start_time, end_time, all_moves, game_status,
						  winner, time_increment, white_id, black_id, opening_code) 
						  values 
						  ('MsoDV9wj', 1.50424E+12,1.50424E+12,
						   'e4 c5 Nf3 Qa5 a3',
						  'draw', 'draw', 15, 'andrew', 'danil', 'B27');
						  
insert into public."Game" (id, start_time, end_time, all_moves, game_status,
						  winner, time_increment, white_id, black_id, opening_code) 
						  values 
						  ('qwU9rasv', 1.50423E+12,1.50423E+12,
						   'd4 d5 e4 dxe4 Nc3 Nf6 f3 exf3 Nxf3 Nc6 Bb5 a6 Bd3 Bg4 O-O Nxd4 Be2 Nxe2+ Qxe2 Bxf3 Qxf3 Qd4+ Be3 Qg4 Qxb7 Rd8 Qc6+ Nd7 Nd5 e6 Nxc7+ Ke7 Bd2',
						  'resign','white', 15, 'andrew', 'masha', 'D00');
						  
insert into public."Game" (id, start_time, end_time, all_moves, game_status,
						  winner, time_increment, white_id, black_id, opening_code) 
						  values 
						  ('dwF3DJHO', 1.50351E+12,1.50351E+12,
						   'e4 e5 Bc4 Nc6 Nf3 Nd4 d3 Nxf3+ Qxf3 Nf6 h3 Bc5 a3 O-O Be3 Bxe3 Qxe3 Re8 Qf3 c6 Nc3 b5 Bb3 Qa5 O-O Bb7 Ne2 c5 Rfd1 d6 c4 bxc4 dxc4 Rac8 Rd5 Bxd5 exd5 Qb6 Nc1 e4 Qf4 Nh5 Qg4 Nf6 Qf4 Qa5 Bc2 Qe1+ Kh2 Nh5 Qxd6 Qxf2 Bxe4 Rxe4 Nd3 Qg3+ Kg1 Qxd3 Rf1 Rce8 Qd7 Qe3+ Kh1 Ng3+ Kh2 Nxf1+',
						  'resign','black', 10, 'andrew', 'lera', 'C50');
						  
insert into public."Game" (id, start_time, end_time, all_moves, game_status,
						  winner, time_increment, white_id, black_id, opening_code) 
						  values 
						  ('afoMwnLg', 1.50344E+12,1.50344E+12,
						   'e4 d5 exd5 Qxd5 Nc3 Qe5+ Be2 Na6 d4 Qf5 Bxa6 bxa6 Nf3 Qe6+ Be3 Bb7 Ng5 Qc4 Qh5 Bxg2 Qxf7+ Qxf7 Nxf7 Kxf7 Rg1 Bf3 Rg3 Bh5 Rh3 g6 Ne4 Nf6 Nc5 e6 Nxa6 Rc8 Bf4 Bg4 Rg3 c6 Nb4 Bxb4+ c3 Ba5 b4 Bc7 Bxc7 Rxc7 Rb1 e5 dxe5 Re8 f4 Rd7 Kf2 Rd2+ Kg1 Rxa2 exf6 Kxf6 Rxg4 Kf5 Rg2 Rxg2+ Kxg2 Re2+ Kf3 Re4 Ra1 Rxf4+ Kg3 Rg4+ Kh3 h5 Rxa7 g5 Rf7+ Kg6 Rf3 Rf4 Rxf4 gxf4 Kg2 Kg5 c4 h4 b5 cxb5 cxb5 Kg4 b6 f3+ Kf2 Kf4 b7 h3 b8=Q+ Ke4 Qb4+ Kd5 Kxf3 Ke5 Kg3 Kf6 Qe4 Kg5 Qf3 Kh6 Qg4 Kh7 Qg5 Kh8 Kf4 Kh7 Kf5 Kh8 Kf6 Kh7 Qg7#',
						   'mate','white', 10, 'anton', 'andrew', 'B01');

