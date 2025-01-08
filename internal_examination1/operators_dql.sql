create table val_organization(
	org_id serial Primary Key,
	org_name varchar(50) not null,
	est_date date default current_date,
	active_roaster_number int,
	check(active_roaster_number >= 5)
);

create table val_professionals (
	pros_id serial Primary Key,
	pros_name varchar(50) not null,
	short_description text not null,
	headshot_percent numeric(4,2),
	current_org_id int,
	previous_org_id int,
	Foreign key (current_org_id) References val_organization(org_id),
	Foreign key (previous_org_id) References val_organization(org_id)
);

INSERT INTO val_organization (org_name, est_date, active_roaster_number)
VALUES 
('Sentinels', '2020-04-01', 6),
('Team Liquid', '2015-01-01', 8),
('Cloud9', '2013-12-04', 7),
('Fnatic', '2004-07-23', 9),
('NRG Esports', '2016-11-16', 7),
('LOUD', '2019-11-21', 8),
('100 Thieves', '2017-11-20', 10);

INSERT INTO val_professionals (pros_name, short_description, headshot_percent, current_org_id, previous_org_id)
VALUES 
('Shroud', 'Former CS:GO pro turned Valorant player.', 25.40, 1, 3),
('TenZ', 'One of the best Valorant players in the world.', 27.50, 1, 3),
('Scream', 'Known for his precise headshots.', 29.00, 2, NULL),
('Leaf', 'Young talent with excellent aim.', 22.30, 3, NULL),
('Derke', 'Finnish player with aggressive playstyle.', 26.10, 4, NULL),
('Fns', 'In-game leader with strategic expertise.', 21.90, 5, NULL),
('JohnQT', 'Versatile player with strong support role.', 23.45, 1, NULL),
('Sacy', 'Former CS:GO player turned Valorant star.', 24.80, 6, NULL),
('Zekken', 'Rising star known for his mechanical skills.', 25.00, 1, NULL),
('Zellsis', 'Aggressive duelist with clutch potential.', 22.75, 1, NULL),
('Bangzerra', 'Skilled entry fragger and team player.', 23.10, 7, NULL),
('Narrate', 'Sharp shooter with a consistent playstyle.', 24.35, 1, NULL);

--union
select pros_name as "info" from val_professionals union all select org_name from val_organization;
--in operator
--only gave TenZ and Shroud but not Pranil
select pros_name from val_professionals where pros_name in ('TenZ', 'Shroud', 'Pranil');
--not operator
select pros_name from val_professionals where pros_name not in ('TenZ', 'Shroud', 'Pranil');
--is operator
select distinct pros_name from val_professionals where previous_org_id is NULL limit 5;
