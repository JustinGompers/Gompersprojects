USE master;
GO
DROP DATABASE IF EXISTS AdventureGame;
GO
CREATE DATABASE AdventureGame;
GO
USE AdventureGame
GO

Begin Transaction

CREATE TABLE hero (
	hero_id integer identity(1,1) NOT NULL,
	name varchar(100) NOT NULL,
	hero_strength integer NOT NULL,
	hero_intellect integer NOT NULL,
	hero_agility integer NOT NULL,
	hero_luck integer NOT NULL,
	hero_health integer NOT NULL,
	hero_gold integer NOT NULL,
	CONSTRAINT pk_hero_hero_id PRIMARY KEY (hero_id)
);

CREATE TABLE monster (
	monster_id integer identity(1,1) NOT NULL,
	name varchar(100) NOT NULL,
	monster_strength integer NOT NULL,
	monster_intellect integer NOT NULL,
	monster_agility integer NOT NULL,
	monster_luck integer NOT NULL,
	monster_health integer NOT NULL,
	monster_description varchar(200) NOT NULL,
	CONSTRAINT pk_monster_monster_id PRIMARY KEY (monster_id)
);

CREATE TABLE room (
	room_id integer identity(1,1) NOT NULL,
	name varchar(100) NOT NULL,
	room_description varchar(300) NOT NULL,
	CONSTRAINT pk_room_room_id PRIMARY KEY (room_id)
);

CREATE TABLE spells (
	spell_id integer identity(1,1) NOT NULL,
	name varchar(100) NOT NULL,
	spell_description varchar(300) NOT NULL,
	spell_damage FLOAT NOT NULL,
	crit_damage FLOAT NOT NULL,
	accuracy FLOAT NOT NULL,
	CONSTRAINT pk_spells_spell_id PRIMARY KEY (spell_id)
);

CREATE TABLE items (
	item_id integer identity(1,1) NOT NULL,
	name varchar(100) NOT NULL,
	item_description varchar(300) NOT NULL,
	CONSTRAINT pk_items_item_id PRIMARY KEY (item_id)
);

CREATE TABLE room_monsters (
	room_id integer NOT NULL,
	monster_id integer NOT NULL,
	CONSTRAINT fk_room_id FOREIGN KEY (room_id) REFERENCES room(room_id),
	CONSTRAINT fk_monster_id FOREIGN KEY (monster_id) REFERENCES monster(monster_id)
);

CREATE TABLE hero_spells (
	hero_id integer NOT NULL,
	spell_id integer NOT NULL,
	CONSTRAINT fk_hero_id FOREIGN KEY (hero_id) REFERENCES hero(hero_id),
	CONSTRAINT fk_spell_id FOREIGN KEY (spell_id) REFERENCES spells(spell_id)
);

Commit Transaction
INSERT INTO hero (name,hero_strength,hero_intellect,hero_agility,hero_luck,hero_health,hero_gold)
VALUES ('Gragnock the Unmoveable',8,2,6,4,18,20),('Svyern the Wise',3,8,5,4,10,20),
('Rydell the Unseen',5,3,7,5,14,30),('Thorum the Clean',4,6,3,7,15,25);
INSERT INTO monster (name,monster_strength,monster_intellect,monster_agility,monster_luck,monster_health,monster_description) VALUES
('Goblin',3,1,3,2,5,'A small green creature usually very greedy and is prone to attacking in groups.  Not very intellegent.');
INSERT INTO spells (name,spell_damage,spell_description,crit_damage,accuracy) VALUES
('Whirlwind',3,'Spin with your main weapon out dealing 3 damage to all enemies',15,65),
('Bash',2,'Bash the enemy interrupting any spells being charged',10,85),
('Shield Wall',0,'Nullifies the next 2 attacks dealt to you',0,100),
('Execute',100,'Executes a low health enemy. The enemy must be below 25% health or the attack will fail.',100,100),
('Rupture',2,'Slice the enemy with your blade causing 3 bleed damage over 3 turns.',15,75),
('Manabolt',4,'Conjure your mana into a solid mass throwing it at the enemy causing arca.ne damage.',45,85),
('Firebolt',3,'Conjure fire into a ball and throw it at your enemy causing 3 fire damage over 3 turns.',25,85),
('FrostNova',3,'Freeze the area around you causing frost damage to all enemies in the room.',10,100),
('ManaShield',0,'Encase your body in a solid mass of mana.  Causes the next attack to be blacked.',0,100),
('Detect Magic',0,'Detects the magic in the room allowing you to see any magical traps laid there.',0,100),
('Evade',0,'Disappear into the shadows increasing your dodge chance by 25% and increasing crit chance by 20%.',0,100),
('Backstab',4,'Appear behind your enemy and dig your weapon into their back.',40,100),
('Blind',0,'Throw sand into the eyes of your enemy causing them to lose 30% accuracy.',0,65),
('Weapon: Poison',0,'Coat your weapon in a poison causing your next attack to poison them causing 3 poison damage over 3 turns.',0,100),
('Kick',0,'Roundhouse your opponent causing them to loose their balance and interrupting any spell being cast.',0,100),
('Heal',0,'Pray to the heavens causing the holy light to heal the wounds of a target.  Will deal damage to the undead.',24,100),
('Cleanse',0,'Use the holy light to purge your body of any toxins or curses.',0,100),
('Soothe',0,'Use your holy nature to calm the target making them passive until the next time they are hit.',0,85),
('Smite',3,'Call upon your holy wrath to strike the target dealing holy damage to them.',20,75),
('Weapon: Holy',0,'Coat your weapon in the holy light causing your next 2 attacks to deal 2 extra damage.',0,100);
INSERT INTO hero_spells (hero_id,spell_id) VALUES
(1,1),(1,2),(1,3),(1,4),(2,5),(2,6),(2,7),(2,8),(3,9),(3,10),(3,11),(3,12),(4,13),(4,14),(4,15),(4,16);
INSERT INTO items (name,item_description) VALUES
('Bottle','An empty bottle.... What else do you need to know?'),
('Small Potion','Health Potion that restores 3 health.'),
('Medium Potion','Health Potion that restores 5 health.'),
('Max Potion','Health Potion that restores all missing health.'),
('Small Mana Potion','Mana Potion that restores 1 use of a spell'),
('Medium Mana Potion','Mana Potion that restores 2 uses of a spell'),
('Max Mana Potion','Mana Potion that restores all uses of a spell'),
('Antidote','Removes any afflicted poisons from the target'),
('Holy Water','A bottle that cures a curse from a target. If thrown at an undead it deals 4 damage'),
('Iron Skin Potion','A potion that turns your skin into iron. Decreases physical damage taken by 2.'),
('Flash Bomb','An explosive that flashes the room stunning enemies for a turn.');


 


