-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2014 at 05:38 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `textadventure`
--
CREATE DATABASE IF NOT EXISTS `textadventure` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `textadventure`;

-- --------------------------------------------------------

--
-- Table structure for table `backgrounds`
--

CREATE TABLE IF NOT EXISTS `backgrounds` (
  `backgroundID` int(11) NOT NULL AUTO_INCREMENT,
  `backgroundURL` text NOT NULL,
  PRIMARY KEY (`backgroundID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `backgrounds`
--

INSERT INTO `backgrounds` (`backgroundID`, `backgroundURL`) VALUES
(1, 'city.png'),
(2, 'hospital.png'),
(3, 'house.png'),
(4, 'house2.png'),
(5, 'library.png'),
(6, 'samsClub.png'),
(7, 'groceryStore.png'),
(8, 'restaurant.png'),
(9, 'woods.png'),
(10, 'station.png'),
(11, 'holdingCell.png');

-- --------------------------------------------------------

--
-- Table structure for table `choices`
--

CREATE TABLE IF NOT EXISTS `choices` (
  `choiceID` int(11) NOT NULL,
  `choice` text NOT NULL,
  `fromStory` int(11) NOT NULL,
  `toStory` int(11) NOT NULL,
  PRIMARY KEY (`choiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `choices`
--

INSERT INTO `choices` (`choiceID`, `choice`, `fromStory`, `toStory`) VALUES
(1, 'Stop and help the officer anyway you can.', 1, 2),
(2, 'Keep walking as if you didn''t notice.', 1, 3),
(3, 'Take the nightstick.', 2, 44),
(4, 'You leave the nightstick and the poor man''s body alone.', 2, 3),
(5, 'Go to the hospital to see how your mother is doing.', 3, 4),
(6, 'Go home and see how your family is doing.', 3, 9),
(7, 'Go to a restaurant, since nearly dying seemed to give you a ravenous appetite.', 3, 34),
(8, 'You push your way through. Your mother might need you.', 4, 5),
(9, 'Turn back. You will come back when it has calmed down.', 4, 46),
(10, 'Push ahead, your mom might need you.', 5, 6),
(11, 'Go to your house.', 5, 8),
(12, 'You decide to go back to the hospital. The ruckus may have died down by now.', 8, 6),
(13, 'You eagerly head to the library, hoping your family is still alive.', 8, 24),
(14, 'You disregard your father''s warning and rush to lift the bookcase off of him.', 9, 10),
(15, 'You hesitate for a moment, then rush out of the nearest door.', 9, 11),
(16, 'You go to the hospital.', 11, 12),
(17, 'You go to the grocery store.', 11, 13),
(18, 'FIGHT.', 13, 14),
(19, 'RUN.', 13, 15),
(20, 'Search the house for anything useful.', 17, 18),
(21, 'Move on and ask the girl where else he might be at.', 17, 19),
(22, 'Drop your weapon.', 20, 21),
(23, 'Keep your weapon at the ready.', 20, 43),
(24, 'Step in front of the child.', 21, 23),
(25, 'Stand back and give them a cleaner shot.', 21, 22),
(26, 'Remain in front of the child.', 23, 45),
(27, 'You reluctantly step away.', 23, 22),
(28, 'Go to the base.', 24, 27),
(29, 'Go to Sam''s Club.', 24, 26),
(30, 'Fight back.', 26, 28),
(31, 'Attempt to negotiate.', 24, 29),
(32, 'Do as they say and try to catch the other group near the military base.', 26, 30),
(33, 'Take the pie.', 34, 35),
(34, 'Choose the chili.', 34, 36),
(35, 'Dig into the chili, after all you are starving.', 36, 40),
(36, 'The blood on his bandage makes you lose your appetite.', 36, 37),
(37, 'Go home and see how your family is doing.', 46, 8),
(39, 'Go to your Uncle''s restaurant.  You''re are starving.', 46, 34),
(40, 'Go to the hospital.', 47, 12),
(41, 'Go to your Uncle''s restaurant.', 47, 34);

-- --------------------------------------------------------

--
-- Table structure for table `encounters`
--

CREATE TABLE IF NOT EXISTS `encounters` (
  `encounterID` int(11) NOT NULL,
  `fromStory` int(11) NOT NULL,
  `cpuScore` int(11) NOT NULL,
  `numDice` int(11) NOT NULL,
  `win` int(11) NOT NULL,
  `lose` int(11) NOT NULL,
  PRIMARY KEY (`encounterID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `encounters`
--

INSERT INTO `encounters` (`encounterID`, `fromStory`, `cpuScore`, `numDice`, `win`, `lose`) VALUES
(1, 6, 375, 5, 7, 43),
(2, 14, 175, 4, 16, 43),
(3, 27, 125, 3, 25, 43),
(4, 28, 250, 4, 31, 43),
(5, 30, 200, 4, 25, 43),
(6, 38, 160, 3, 39, 43),
(7, 41, 280, 5, 42, 43),
(8, 29, 60, 1, 33, 32);

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE IF NOT EXISTS `scores` (
  `userName` text NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`userName`, `score`) VALUES
('gandrews', 60),
('bhogan', 80),
('screviston', 90),
('dschmidt', 215),
('mellious', 260),
('dstorm', 175),
('jhays', 85),
('bjaenke', 205),
('mheisler', 130),
('cmpunk', 300),
('mvolk', 95),
('cbutterfield', 95),
('jallegro', 235),
('bpoppe', 95),
('escore', 300);

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE IF NOT EXISTS `stories` (
  `storyID` int(11) NOT NULL AUTO_INCREMENT,
  `story` text NOT NULL,
  `toStory` int(11) DEFAULT NULL,
  `backgroundID` int(11) NOT NULL,
  `encounter` tinyint(1) DEFAULT NULL,
  `weapon` int(11) DEFAULT NULL,
  PRIMARY KEY (`storyID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `stories`
--

INSERT INTO `stories` (`storyID`, `story`, `toStory`, `backgroundID`, `encounter`, `weapon`) VALUES
(1, 'As you near the door you see a police officer bleeding profusely from his neck.', NULL, 11, NULL, NULL),
(2, 'As you hurry to help the officer, you realize you have no idea what you are doing.  You try to apply pressure to the wound, but it seems you somehow made it worse.  You can tell that the officer is grateful for you trying to help.  All of the sudden, his face goes blank.  He is dead.  You notice a nightstick on his belt.', NULL, 11, NULL, NULL),
(3, 'Once you get outside the police station, you see Firemen and police officers trying to maintain a semblance of order.  You''re feeling slightly overwhelmed for a moment.  When you notice the serviceman pointing to something behind you. The officer from the hallway is now walking towards you... But something is different.  He almost seems feral.  You hear loud gunshots and the officer drops to the ground dead.  One of the firemen comes up and suggests you get to somewhere that is safe.  "What is going on?" you ask.  "This is going to sound absurd, but it appears that the dead are coming back to life and are trying to eat people."  You look at the man in utter disbelief.  There is no way that this could be true.', NULL, 10, NULL, NULL),
(4, 'As you approach the hospital, you see the hallways are overcrowded with paramedics, cops, and panicked people clutching their loved ones.  You realize you would have to push your way through these people to get to your mothers room.', NULL, 2, NULL, NULL),
(5, 'As you approach you mothers room, a security guard approaches you and warns you that it is not safe and mentions that there are "crazed people running about."', NULL, 2, NULL, NULL),
(6, 'You walk into your mothers room to see that she has been strapped to the bed, lying motionless.  You begin to undo the bindings, wondering why anybody would treat her in such a deplorable manner.  As you undo the last strap, your mothers'' head jerks towards you.  She looks at you with blank, lifeless eyes and a moaning growl escapes her lips.  It''s GO TIME!', NULL, 2, 1, NULL),
(7, 'After defeating your mother, you hear a commotion out in the hallway.  You poke your head out of the door, ready to put up a fight.  You see a group of soldiers working their way down the hallway.  One of the soldiers sees you and rushes over to you.  He takes a quick glance at the gruesome scene behind you and immediately calls over a fellow soldier.  Before you can even try to explain yourself, the soldier pulls out a strange scanning device, and quickly takes a small blood sample from you before you can even object.  After a few seconds in the scanner the soldiers says "He''s clean."  They whisk you out to their convoy and explain that the military has set up a safe haven for people until they can get the situation under control.', 48, 2, NULL, NULL),
(8, 'You arrive at your house to see it has completely burned down.  Your entire past has been reduced to little more than a pile of rubble.  As the crushing reality rushes over you, you remember that as a child one of your emergency meet up places with your family was at the library.  If they did not perish in the fire, you feel that that may be where you family is.', NULL, 3, NULL, NULL),
(9, 'You arrive to your house to see it ablaze.  You rush inside, hoping that your family has already made it out.  Once inside you can hear cries of pain coming from the basement.  You run and open the basement door, and your are greeted with a chaotic scene.  You see your father trapped under a bookcase with his leg bent and an unnatural angle.  Your brother is lying on the ground next to him, obviously dead.  Another glance at your father reveals what looks like a bite mark on his forearm.  Your father suddenly looks at you and says, "The house is about to come down.  Leave me and save yourself."  The words had barely left his lips when you hear a bunch of creaking and a distant crash.  You have only a split second to decide...', NULL, 3, NULL, NULL),
(10, 'As you strain to lift the bookcase off of your father you hear another crash.  Almost instantaneously you feel a searing heat in your chest as your lungs fill with smoke.  Another second later there is a flash, then nothing.', 43, 3, NULL, NULL),
(11, 'You stop in the back yard and turn around just in time to see your childhood home collapse.  Your entire life has just been reduced to ash.  You are momentarily overcome with grief.  Once you come to again, you notice an aluminum baseball bat on the ground a few feet away.  You grab it as it could come in handy later.', NULL, 3, NULL, 2),
(12, 'As you approach you mothers room, a security guard approaches you and warns you that it is not safe and mentions that there are "crazed people running about."', 6, 10, NULL, NULL),
(13, 'As you enter the store, you are witness to yet another scene of total chaos.  You''re making your way through the aisles gathering as many canned goods as you can carry.  Suddenly you hear the anguished cries of a child. not twenty feet away from you.  The child is crouched over the body of who you assume is her mother.  You rush over to the child to pull her away, just as the body begins to twitch with the unnatural reanimation.', NULL, 7, NULL, NULL),
(14, 'You make sure the girl is out of harms way and brace yourself for the attack.', NULL, 7, 1, NULL),
(15, 'You try to run away with the child but she pulls away from you to go to what used to be her mother.  You keep running, then you hear her blood-curdling scream, which stops as suddenly as it started.', 47, 7, NULL, NULL),
(16, 'After your "victory", you turn to the now violently sobbing child.  You are finally able to calm the child enough to ask, "Where is your father?  Can I take you to him?"  In between the sobs the child tells you the location of her house.  It is not very far, so you grab the childs'' hand, and an armful of canned goods and head there.', 17, 7, NULL, NULL),
(17, 'The little girl leads you to her house, her sobbing now largely subsided.  As you enter the house, it becomes apparent that nobody is home.  The place is most definitely deserted.', NULL, 4, NULL, NULL),
(18, 'A quick sweep of the house reveals a handgun and a few rounds of ammunition.  You grab them and head back downstairs.  You ask the girl where else her father might be.  She says he may be found at the army base just outside of town.', 20, 4, NULL, 4),
(19, 'You ask the girl where else he father might be.  She informs you that he may be at the Army base just outside of town.', 20, 4, NULL, NULL),
(20, 'You are finally approaching the military base.  A group of soldiers approaches you with assault rifles drawn.  You ready you weapon just in case.  "Drop your weapon!" they demand.', NULL, 9, NULL, NULL),
(21, 'As you drop your weapon and are approached by the soldiers, they grab your arm, as well as the childs'', and extract a small amount of blood from your forearms.  They scan it with a strange scanning machine.  The soldiers exchange dark glances and say, "The man is clean, but the little girl is infected."  They point their guns at her, and you ask what they are doing.  "It''s protocol," they say, "she is going to turn otherwise.  There is no saving her."', NULL, 9, NULL, NULL),
(22, 'You cover your ears seconds before you hear gun shots.  The soldiers lead you into the base.  You catch a glance of the armory and you see a plethora of assault weapons and riot gear.  This is the safest you have felt since.', 48, 9, NULL, NULL),
(23, '"Move out of the way or we will be forced to shoot you as well!"', NULL, 9, NULL, NULL),
(24, 'When you enter the library, after a brief search, you can see your family is nowhere to be seen.  There is, however, two small groups that seem to be bickering about where they should go next.  You approach the groups.  "They will have plenty of rations on the base." you hear one say.  "We don''t know if they will even take civilians.  The Sam''s Club will have plenty of food." another says.  You are able to glean that there are two options.', NULL, 5, NULL, NULL),
(25, 'As you approach the base you are approached by a group of soldiers.  They have their weapons drawn.  They tell you to drop your weapons and the group obliges without a second thought.  They systematically test each persons; blood with a strange scanning device.  "They''re all clean," proclaims one soldier.  As they lead you into the base, you catch a brief glimpse into the armory.  They have a plethora of assault weapons and riot gear.  This is the safest you have felt since...', 48, 9, NULL, NULL),
(26, 'You decide to go where the food is.  As you approach the front door, you are greeted by yet another group of strangers.  Their weapons are drawn and they are demanding that you leave immediately.', NULL, 6, NULL, NULL),
(27, 'The road is crowded with the undead.  You''ll have to fight your way through.', NULL, 5, 1, NULL),
(28, 'You hear a gunshot, and before you even think, an all out battle breaks out.', NULL, 6, 1, NULL),
(29, 'You attempt to talk them into letting you in their group.', NULL, 6, 1, NULL),
(30, 'You are a little steamed that Sam''s Club was a no go.  There are even more undead on the road this time.', NULL, 9, 1, NULL),
(31, 'You successfully take Sam''s Club.  You spend the rest of the day fortifying it.  It is now basically Fort Knox.', 48, 6, NULL, NULL),
(32, 'You fail to convince them.  Get ready to fight.', NULL, 6, 1, NULL),
(33, 'You are able to convince them that there is power in numbers.  You join forces and spend the rest of the day fortifying the store.  It is now basically Fort Knox.', 48, 6, NULL, NULL),
(34, 'You decide to head to your Uncle&#39;s restaurant as it is only 2 blocks away. When you arrive at the restaurant you can see that he is only one there. You ask him if he has anything for you to eat. He tells you that he has half a pie and leftover chili. "I haven&#39;t had a customer all day", he says. <br><br>"Well haven&#39;t you noticed the strange things that have been happening?" you ask.<br><br>"This is nothing..." he says waving you off, "so how about it. Do you want pie or chili?"', NULL, 8, NULL, NULL),
(35, 'You order the pie as you have always had a sweet tooth.', 37, 8, NULL, NULL),
(36, 'You order the chili. Your uncle&#39;s chili is always the best. You are about to dig in when you notice a cut on your uncle&#39;s finger. "What is that?" you ask. "Some crazy guy jumped me while I was taking out the garbage about an hour ago. Bastard bit me."', NULL, 8, NULL, NULL),
(37, 'Now that you&#39;re no longer hungry, you turn to your uncle to strike up another conversation when you hear a bad crash come from the front of the store. A large horde of the undead are pushing their way through! Your uncle grabs you and ushers you to the kitchen. On your way, you grab a large chef&#39;s knife off of the counter. You know have a knife.', 38, 8, NULL, 3),
(38, 'Near the back of the kitchen, you see an undead person turn around and look right at you.  He charges and attacks!', NULL, 8, 1, NULL),
(39, 'Your uncle pulls you into his storage room. He locks the door behind him.', 41, 8, NULL, NULL),
(40, 'Not long after, you begin to feel weird.  You develop a fever, and begin to slowly black out.', 43, 8, NULL, NULL),
(41, 'Not long after, your uncle feels ill. He develops a fever and not long after passes. You think nothing of it until he starts moving again...', NULL, 8, 1, NULL),
(42, 'You sit for a while, trying not to look at the corpse that used to be your uncle. After what feels like eternity you hear gunshots coming from the dining area of the restaurant.  You hear footsteps approaching and you brace yourself.  A group of soldiers kick down the door.  They ask you to stick out your arm and you oblige without a second thought.  They scan your blood in a strange scanning device, and after a few seconds one soldier announces that you came out clean.  You are escorted to a nearby military base.  As you are enter you are able to get a brief glimpse of the armory.  They have a plethora of assault weapons and riot gear.  This is the safest you have felt since...', 48, 8, NULL, NULL),
(43, 'You are dead.  Would you like to submit your score?', NULL, 1, NULL, NULL),
(44, 'You now have a night stick!', 3, 11, NULL, 1),
(45, 'You refuse to move away from the girl.  After all, if the world has come to shooting innocent children what is there to live for?  You close your eyes and hear a loud gunshot...', 43, 9, NULL, NULL),
(46, 'The hospital was a not go.  Where to next?', NULL, 2, NULL, NULL),
(47, 'You feel bad that you weren&#39;t able to save the girl, but you have your own survival to worry about.  Where to next?', NULL, 7, NULL, NULL),
(48, 'Congratulations, you survived day 1! Would you like to submit your score?', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `weapons`
--

CREATE TABLE IF NOT EXISTS `weapons` (
  `weaponID` int(11) NOT NULL,
  `weaponName` text NOT NULL,
  `damageBoost` int(11) NOT NULL,
  PRIMARY KEY (`weaponID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weapons`
--

INSERT INTO `weapons` (`weaponID`, `weaponName`, `damageBoost`) VALUES
(1, 'Night Stick', 15),
(2, 'Baseball Bat', 25),
(3, 'Knife', 50),
(4, 'Handgun', 100);

CREATE USER 'test'@'localhost' IDENTIFIED BY 'testtest';
GRANT ALL PRIVILEGES ON * . * TO 'test'@'localhost';
FLUSH PRIVILEGES;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
