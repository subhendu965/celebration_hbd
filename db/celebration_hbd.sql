-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 24, 2021 at 05:38 PM
-- Server version: 10.3.31-MariaDB-cll-lve
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mfasohyk_celebration_hbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `bd_event`
--

CREATE TABLE `bd_event` (
  `bd_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bday` datetime NOT NULL,
  `country` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organizer` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bd_event`
--

INSERT INTO `bd_event` (`bd_id`, `first_name`, `middle_name`, `last_name`, `display_name`, `gender`, `bday`, `country`, `organizer`, `year`) VALUES
('DOOP', NULL, NULL, NULL, 'Hanuman', 'male', '2020-11-17 00:00:00', 'india', 'riverslide', 0),
('JAYEETA', 'Jayeeta', NULL, 'Saha', 'Jayeeta', 'female', '2020-10-13 00:00:00', 'india', 'RIVERSLIDE', 0),
('RITABRATA', 'Ritabrata', NULL, 'Bhattacharya', 'Ritabrata', 'male', '2020-12-20 00:00:00', 'India', 'RIVERSLIDE', 0),
('RUCHI', 'Ruchismita', NULL, 'Das', 'Ruchi', 'female', '2020-11-16 00:00:00', 'india', 'RIVERSLIDE', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bd_static_parameters`
--

CREATE TABLE `bd_static_parameters` (
  `event_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_banner_image` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bd_static_parameters`
--

INSERT INTO `bd_static_parameters` (`event_id`, `year`, `first_banner_image`) VALUES
('JAYEETA', '2020', 'data/event_data/static/first_banner_image/JAYEETA_2020_fsp2_1.jpg'),
('RITABRATA', '2020', 'data/event_data/static/first_banner_image/RITABRATA_2020_fsp2_3.jpg'),
('RUCHI', '2020', 'data/event_data/static/first_banner_image/RUCHI_2020_fw.webp');

-- --------------------------------------------------------

--
-- Table structure for table `bd_wish`
--

CREATE TABLE `bd_wish` (
  `event_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wish_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wish_from` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(10000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mediaType` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `riverslide_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `year` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bd_wish`
--

INSERT INTO `bd_wish` (`event_id`, `wish_id`, `wish_from`, `message`, `url`, `mediaType`, `riverslide_id`, `priority`, `datetime`, `year`) VALUES
('doop', 'pB4oX', 'Riverslide', 'It was a test yarooo. Sorry for that.', '', '', NULL, 1, '2020-11-15 11:51:28', 0),
('jayeeta', '4QraZ', 'Tiku', 'Happy Birthday Didi.<br>Many many happy returns of the day.', 'data/user_wish_data/jayeeta-4QraZ.jpg', 'image', NULL, 1, '2020-11-14 04:42:58', 0),
('jayeeta', '85fBU', 'Saurajit', 'Happy Birthday Jayeeta!!', 'data/user_wish_data/jayeeta-85fBU.jpeg', 'image', NULL, 1, '2020-11-14 04:37:12', 0),
('jayeeta', 'Djxcd', 'Bhalo Pahar', 'Hi Jayeeta,<br>\r\n        Today I get to wish you a happy\r\n        birthday for the first time since\r\n        meeting you, and I look forward for many more to come\r\n        Hope ur special day is a fantastic one....may u achieve everything u desire for...keep smiling,stay blessed...Happy birthday', '', '', NULL, 1, '2020-11-14 04:41:49', 0),
('jayeeta', 'fxcgk', 'Joyeta', 'Jayyyy! My namesake! Behind this prettiest smile,\r\n         I have a trillion of secrets! So many memories,\r\n          this little para isn\'t just enough to express how much you mean to me.\r\n           It\'s amazing how we catch up even after not being in contact for such long periods,\r\n            right from where we left behind. The sparkle in your eyes is keen.\r\n             The inquest for knowledge and art. From bonding over horror movies,\r\n              to sharing our deep dark secrets,\r\n               to the tete-a-tete at Artsy (You enjoying a sip of espresso)\r\n                ðŸ˜‚ðŸ˜‚ðŸ˜‚ðŸ˜‚ðŸ˜‚ We have come a long way. We literally were always together remember?\r\n                 Biology. Miss Jain\'s favourites. \"Her two jayeetas\" .\r\n                  Nothing will ever replace those days for me.\r\n                   The laughter still echoes in my ears of the last few benches of 12-G.\r\n                    Your humorous appeal and all that we were upto ðŸ˜‚ðŸ˜‚ðŸ˜‚ðŸ˜‚ Just amazing,\r\n                     how we all grew up together. Beautifully. ðŸ˜˜Just that,\r\n                      please don\'t ever eveeeeerrr change.\r\n                       Please. You are amazing and perhaps\r\n                        one of the best hoomans I have met on this planet earth! Haha.\r\n                         Too much! Glad to have shared this thought with you, Jay. You mean a lot to me.\r\n                          A lot. Happy Birthday prettiness! ðŸ˜˜', 'data/user_wish_data/jayeeta-fxcgk.jpeg', 'image', NULL, 1, '2020-11-14 04:40:03', 0),
('jayeeta', 'hwOCG', 'Ruchi', 'Hey you,<br>\r\n        Another year added, I wish you all the happiness and success. Dream big and stay positive as you are. Loads of love and virtual hug on your special day. Achieve everything in your bucket list. And, always keep smiling and be cheerful. We will meet soon. I love you beautiful.\r\n        <br>Happy birthday.', 'data/user_wish_data/jayeeta-hwOCG.jpeg', 'image', NULL, 1, '2020-11-14 04:33:45', 0),
('jayeeta', 'kdS8N', 'Aritra', 'Hey Jayeeta!<br>\r\n        We met in Unitech, as a common friend of subhendu ruchi ghulam.\r\n         Trusting my memory, I can say that I have never seen you without your beautiful smile.\r\n          Be like the way you are - young energetic and full of positive vibes.\r\n           Wishing you many many happy returns of the day.', 'data/user_wish_data/jayeeta-kdS8N.jpeg', 'image', NULL, 1, '2020-11-14 04:41:14', 0),
('jayeeta', 'kONi9', 'Subhendu', 'Happy Birthday Jayeeeeeeeeeeeeeee!!<br>\r\n        Many many Happy returns of the day. Stay blessed and be safe.\r\n        Hope your special day will bring you all that your heart desires!\r\n        <br>\r\n        ðŸ’ðŸ¥³ðŸŽ‚ðŸ«â¤ï¸\r\n        <br>\r\n        Enjoy!!!!', 'data/user_wish_data/jayeeta-kONi9.jpeg', 'image', NULL, 1, '2020-11-14 07:02:36', 0),
('jayeeta', 'lP05T', 'Souvik', 'First friend in TCS induction auditorium.\r\n         The group scattered but friendship remains.\r\n          Happy Birthday Jayeeta.\r\n           Keep smiling.ðŸ¥³', 'data/user_wish_data/jayeeta-lP05T.jpeg', 'image', NULL, 1, '2020-11-14 04:38:26', 0),
('jayeeta', 'LqWEJ', 'Sakshi', 'Hi Jayeeta,<br>\r\n        Today I get to wish you a happy\r\n        birthday for the first time since\r\n        meeting you, and I look forward for many more to come\r\n        Hope ur special day is a fantastic one....may u achieve everything u desire for...keep smiling,stay blessed...Happy birthday', '', '', NULL, 1, '2020-11-14 04:42:25', 0),
('jayeeta', 'qIJAN', 'Camelia', '', 'data/user_wish_data/jayeeta-qIJAN.jpeg', 'image', NULL, 1, '2020-11-14 04:40:36', 0),
('jayeeta', 'T5MWV', 'Banhisikha', 'Happy birthday love..ðŸŽ‰ðŸŽ‰ thank you for always being there for me.. cant wait to meet again and hear all your stories ðŸ˜’â¤ï¸â¤ï¸', 'data/user_wish_data/jayeeta-T5MWV.jpeg', 'image', NULL, 1, '2020-11-14 04:39:22', 0),
('jayeeta', 'UHOd6', 'Team <a href=\'http://riverslide.com\'>Riverslide</a>', 'Happy Bithday Jayeeta. We are happy to celebrate your birthday.\r\n        Millions of wishes in your special day.', 'data/user_wish_data/jayeeta-UHOd6.jpg', 'image', NULL, 1, '2020-11-14 04:43:50', 0),
('RITABRATA', '0mUfb', 'Subhradip', 'Happy Birthday Smart boyðŸŽ‚ðŸ¥³ðŸŽ‰', '', '', NULL, 1, '2020-12-18 05:16:08', 0),
('RITABRATA', '4DBJ9', 'Guess_Who', 'Remember that growing old is mandatory, but growing up is optional! -The internet.\r\n\r\nValo thakis , never change, and never take your bottle home if priyobrata is watching ðŸ¤£', 'data/user_wish_data/RITABRATA-4DBJ9.jpg', 'image', NULL, 1, '2020-12-17 18:48:39', 0),
('RITABRATA', '6O7p2', 'Suman Saha', 'Many many happy returns of the day with lots of good wishesðŸŽ‚ðŸŽ‰ðŸŽŠ', '', '', NULL, 1, '2020-12-18 17:52:10', 0),
('RITABRATA', '7zHrx', 'Bandana', 'A very happy birthday Ritobrata, may you cherish this year and Goodluck to that,  stay blessed ðŸ˜‡ always, you have always been very helpful and supportive as a friend. Lots of good wishes on this special day of yours.', '', '', NULL, 3, '2020-12-19 17:35:49', 0),
('RITABRATA', '8stRN', 'Tanmoy Roy', 'Happy Birthday .It has been a hell tough year but the upcoming one will be perfect,have blast today ðŸ¥³ðŸ¥³ðŸ¥³', 'data/user_wish_data/RITABRATA-8stRN.jpg', 'image', NULL, 1, '2020-12-19 07:54:22', 0),
('RITABRATA', 'bB5R7', 'Sanchari', 'Happy Birthday roll no 1! I can\'t have any other name other than thisðŸ˜ be happy and be like who you are!â¤ï¸ Take careâ˜€ï¸', '', '', NULL, 1, '2020-12-19 08:08:19', 0),
('RITABRATA', 'bX9AU', 'Indrani', 'Many many happy returns of the day !!! Khub moja kor... Ar khb siggiri ekta get together hok please.... Amdr oi bikele er chicken pakoda ar nonsense discussion khb miss korchi... Stay happy...stay healthy ðŸ’–\r\n~ P.S. bullet ta kintu akdin chorbo... (Jodio bhoy lge khb ðŸ˜‚ðŸ˜‚)', '', '', NULL, 1, '2020-12-18 17:35:22', 0),
('RITABRATA', 'c8Tvf', 'Asmita', 'Heyyyyyyyy, Happy Birthdayyyyyyyy!!!!\r\n\r\nBhalo kre kha, party kor boro kre, r prochur cake kat. Its your day, enjoy it^^', '', '', NULL, 1, '2020-12-18 17:56:55', 0),
('RITABRATA', 'CKVxm', 'Upasana', 'Subho janmdin Rito ðŸ¥³ðŸ¥³\r\nEnjoy n stay blessedðŸ˜‡\r\nMissing those ofc days a lot where we used to hang out and have a lot of fun ðŸ¤©..anyways we will surely plan a get together soonðŸ¥³', 'data/user_wish_data/RITABRATA-CKVxm.jpeg', 'image', NULL, 1, '2020-12-18 17:19:56', 0),
('RITABRATA', 'koO6i', 'Mahasweta', 'Congratulations on being even more experienced. Iâ€™m not sure what you learned this year, but every experience transforms us into the people we are today. Happy birthday! Stay blessed..party hard with your loved one\'sðŸŽ‰ðŸŽ‰', '', '', NULL, 3, '2020-12-20 04:53:08', 0),
('RITABRATA', 'KVHL5', 'Sourabh', 'HBD ðŸŽ‰ðŸ¥³ðŸŽ‚', '', '', NULL, 1, '2020-12-18 18:19:06', 0),
('RITABRATA', 'QEVFN', 'Alisha', 'Happy birthday  Rito.....\r\nI hope, God gives everything  u wish for. And haan dont miss  my  needle hair muchðŸ˜†ðŸ˜†..  will surely  annoy u with my beautiful hair for u which is jhadu when i come Kolkata ðŸ˜…ðŸ˜…ðŸ˜…ðŸ˜….. Miss those lunch  gossips in office canteenðŸ™ƒðŸ™ƒðŸ™ƒ.. Happy birthday  again......', '', '', NULL, 1, '2020-12-17 12:36:01', 0),
('RITABRATA', 'qyzNQ', 'Subhendu', 'Happy Birthday Rito, ðŸ¥³ðŸ¥³ðŸ¥³ðŸ¥³ my friend philosopher and guide in Guwahati and Saltlake ðŸ˜ðŸ˜. I will never forget the days in Chingrighata with full of madness, experiment, laughter and joy ðŸ˜‡. I still enjoy the gossip on \"Business ðŸ¤‘\" and \"Businessman ðŸ¤‘\" ðŸ¤£ðŸ¤£ðŸ¤£ðŸ¤£. I wish, you can achieve everything you want ðŸ’. After the hard time we will meet again. Enjoy your day....ðŸ«ðŸ«ðŸŽ‚ðŸŽ‚ðŸŽ‚ðŸŽ‚ðŸŽ‚', 'data/user_wish_data/RITABRATA-qyzNQ.jpg', 'image', NULL, 1, '2020-12-19 10:52:15', 0),
('RITABRATA', 'rAUdh', 'Ashish Verma', 'Happy Birthday Ritabrata stay healthy n stay safe ðŸŽ‚ðŸŽ‚ðŸ‘ðŸ‘', 'data/user_wish_data/RITABRATA-rAUdh.jpg', 'image', NULL, 3, '2020-12-19 15:30:19', 0),
('RITABRATA', 'Rw5Z1', 'Ruchi', 'Happiest birthday to you. Stay blessed and may you achieve everything you deserve. Always be happy and enjoy your day to the fullest!!', '', '', NULL, 1, '2020-12-17 13:45:40', 0),
('RITABRATA', 'uSs47', 'Subhalaxmi', 'Happy Birthday MedakðŸ¸ðŸŽ‰ðŸ’. Thankyou for being the bestest friend I always wondered in my life.. May god bless you n all your dreams turn to reality. Waiting for the treat idiot ðŸ˜‰', '', '', NULL, 3, '2020-12-17 12:46:07', 0),
('RITABRATA', 'xXDUR', 'Pallab', 'Happy Birthday Vai ðŸ¥³', '', '', NULL, 1, '2020-12-17 12:51:13', 0),
('RITABRATA', 'Zmgta', 'SANTANU BASU', 'Happy Birthday Many Many Happy Returns of the Day', '', '', NULL, 3, '2020-12-19 18:45:08', 0),
('RITABRATA', 'zoKxY', 'Shivam', 'Happy Birthday bro.....you are just an amazing person to talk with.', '', '', NULL, 1, '2020-12-18 17:56:41', 0),
('RITABRATA', 'zxw3n', 'Subhrajit Paul', 'Happy Birthday bhai!!Hotspot on ache net nie ne', '', '', NULL, 1, '2020-12-18 18:26:39', 0),
('ruchi', '0Z1aU', 'Prinesh', 'Janma dinara hardika subhhechhya auu subha kamana.. Khusi re rah', '', '', NULL, 1, '2020-11-14 08:20:28', 0),
('ruchi', '17wa5', 'Nhi batayenge', 'How can I not wish you in Odia? Hapuchi Bduchi Ruchuchi.', 'data/user_wish_data/ruchi-17wa5.jpg', 'image', NULL, 2, '2020-11-14 06:34:26', 0),
('ruchi', '21RG0', 'Naina', 'Hye Gorgeous,\r\nMany many happy returns of the day..\r\nI so miss you and our khatti ofcourse..\r\nHope we meet soonðŸ˜˜', 'data/user_wish_data/ruchi-21RG0.jpg', 'image', NULL, 1, '2020-11-14 10:16:25', 0),
('ruchi', '2KaNE', 'Ritabrata', 'Happy Birthday Ruchi, wish you many many happy returns of the day ðŸŽ‰ðŸŽ‚', '', '', NULL, 1, '2020-11-14 08:40:21', 0),
('ruchi', '3I2hW', 'Sonali', 'Happy Birthday Ruchaâ¤ï¸ðŸ˜˜ chal jiba zero point tora celebration pain au Han cake nije neiki asibu ðŸ˜œ I soo miss those days our fights hugs n whatnot. Meet me soon. Au Bala treat pending achhi tora bohut Dina Ru de be.', 'data/user_wish_data/ruchi-3I2hW.jpg', 'image', NULL, 1, '2020-11-14 08:15:37', 0),
('ruchi', '3TaRO', 'Abhipsa', 'Happiestttt birthday Ruchiii!! ðŸ˜˜ðŸ˜˜', '', '', NULL, 1, '2020-11-14 08:27:15', 0),
('ruchi', '3U9XP', 'Subhendu', 'Happy Birthday Ruchu. ðŸ¥³ðŸ¥³ðŸ¥³Many many happy returns of the day.ðŸŽðŸŽâ¤ï¸... You are now matured one more year ðŸ˜Š. Tons of wishes for your future  ðŸ’–ðŸ’–ðŸ’–. After the hard times you will achieve whatever you want. Try to be as lively as you are ...ðŸ’—. Always smile and be happy ... ðŸ˜ I hope our friendship will remain many more years and we will meet soon. ðŸ˜ðŸ˜ Enjoy your birthday ...... ðŸŽ‰ðŸŽ‰ðŸŽ‚ðŸŽ‚ðŸŽ‚', 'data/user_wish_data/ruchi-3U9XP.jpg', 'image', NULL, 2, '2020-11-14 08:11:56', 0),
('ruchi', '6bJSn', 'Hihihihi', 'Happy Birthday , cry-baby ðŸ˜› . I wish you love, hope and everlasting joy and happiness.Thanks for giving me great memories that will last a lifetime. Best wishes to you on your Birthday .ðŸ˜¬ðŸ˜¬ðŸ˜¬', '', '', NULL, 3, '2020-11-14 07:15:59', 0),
('ruchi', 'cbi1e', 'Dipayan', 'Happy Birthday ðŸŽ‰ðŸŽ‚ðŸŽ‰ðŸŽ‚ðŸŽ‰ðŸŽ‚', '', '', NULL, 1, '2020-11-14 08:51:23', 0),
('ruchi', 'cCJLS', 'Alisha', 'Hey beautiful, \r\nHappy birthday.... May God bless you with  lots of success  and happiness.. Treat ta jaldi dabuðŸ˜›ðŸ˜›.Aau Reliance  bhalia aau gote company Mukesh aau tu misiki jaldi kholaðŸ¤‘ðŸ¤‘ðŸ¤‘ Gote competition  haba na aau.... \r\n\r\n\r\nHappy birthday  babe', '', '', NULL, 1, '2020-11-14 07:19:28', 0),
('ruchi', 'cY6xt', 'Sharmistha', 'Happiee birthdayy to you birthday girl....ðŸ˜ stay blessed and happy always... ðŸ’ðŸ’žðŸ’–', '', '', NULL, 1, '2020-11-14 07:36:03', 0),
('ruchi', 'DZXVq', 'Hii', 'Hii', '', '', NULL, 1, '2020-11-24 16:19:43', 0),
('ruchi', 'e28Hi', 'Pragyan', 'Happy Birthday Ruchi, You deserve all the cakes, love, hugs and happiness today. Have a blast!', '', '', NULL, 1, '2020-11-15 10:23:40', 0),
('ruchi', 'e9am1', 'Pallab', 'Happy Birthday Ruchi .. Always keep alive the child within youðŸ˜', '', '', NULL, 1, '2020-11-14 09:08:20', 0),
('ruchi', 'fxaws', 'Shanti swarup', 'Happy Birthday ruchi... Emotional nashedi patient... Don\'t loose your emotions, you have potential to sustain all.... Bass khusi re raha enjoy kar... Sabu dream achieve kar..... God bless you ðŸ¤—ðŸ¤—ðŸ¤—', 'data/user_wish_data/ruchi-fxaws.jpg', 'image', NULL, 1, '2020-11-15 16:29:40', 0),
('ruchi', 'GclV9', 'JAYEETA', 'My sweetheart, my ultimate. Just when I was missing those girly gossips which I used to have in my school days with \"girl\" friends, you came to my life like a blooming sunflower. I have shared my in and out with you. I will cherish all those days I\'ve spent with you, in the gym, on our walks and every moment which can only be understood by a \"girl\" friend. Keep smiling and be as you are. I love you:-*', 'data/user_wish_data/ruchi-GclV9.jpg', 'image', NULL, 2, '2020-11-14 06:25:14', 0),
('ruchi', 'HwotJ', 'Rakesh(rrr)', 'I wish you a very happy birthday RUCHI. Have a blast & cheers to our college memories.', 'data/user_wish_data/ruchi-HwotJ.jpg', 'image', NULL, 1, '2020-11-15 16:28:10', 0),
('ruchi', 'I01ws', 'Your Shubham', 'Happy birthday â¤  Be the happiest . Trip,daily class,irrigation canal,fishery , what not.. So much to cherish.. I m always thereðŸ˜€ my First beer was with you.. Hopefully we will buzz again soon.ðŸ¥³', 'data/user_wish_data/ruchi-I01ws.jpg', 'image', NULL, 1, '2020-11-15 16:49:51', 0),
('ruchi', 'IArpT', 'Souvik', 'Happy Birthday ðŸŽ‚', '', '', NULL, 1, '2020-11-14 06:17:43', 0),
('ruchi', 'IXBMR', 'Subhalaxmi', 'Happy Birthday beautiful.. May you achieve all success in your life and every dream of urs turn into reality..', '', '', NULL, 1, '2020-11-14 06:15:44', 0),
('ruchi', 'KMuAF', 'Priyanka Mohapatra', 'Happy birthday Ruchiiiii â™¥ï¸â™¥ï¸ 4 years of engineering (and especially labs ðŸ˜‰) would have been incomplete without you ðŸ˜„ Thank you for everything ðŸ˜˜ Miss you a lot. Hopefully jaldi dekha haba â™¥ï¸ Stay happy and healthy ðŸ˜˜ Have loads of fun. Happy birthday again ðŸŽ‰ðŸŽˆ Lots of love, from Pinky â™¥ï¸â™¥ï¸', 'data/user_wish_data/ruchi-KMuAF.jpg', 'image', NULL, 1, '2020-11-15 16:37:44', 0),
('ruchi', 'lCuaD', 'The Other Mukesh', 'On this bday, I wish you to have 2 Blue Lays Chips packet not red not green only blue.', '', '', NULL, 1, '2020-11-15 16:22:58', 0),
('ruchi', 'M9BFu', 'Saurajit Sinha', 'Wish you a blissful birthday dear. Keep smiling. May you continue revolving around the sun for decades to come.', 'data/user_wish_data/ruchi-M9BFu.jpg', 'image', NULL, 2, '2020-11-14 06:27:39', 0),
('ruchi', 'nE1H6', 'Shromona', 'A very happy birthday RuchismitaðŸŽ‰ðŸ¥³\r\nWishing you a very prosperous year. Stay blessedâ¤ï¸ðŸ˜Š', '', '', NULL, 1, '2020-11-14 08:59:29', 0),
('ruchi', 'phvVI', 'Mainak', 'May the joy that you have spread in the past come back to you on this day. Wishing you a very happy birthday!', '', '', NULL, 1, '2020-11-14 17:12:01', 0),
('ruchi', 'VB7R6', 'Satya', 'Many many happy returns of the day Ruchi.ðŸŽ‚ðŸŽ‰ðŸŽ‰ðŸŽŠðŸŽŠ..Stay happy and blessed.ðŸ˜Š.smile always â¤ï¸..loads of love â™¥ï¸', 'data/user_wish_data/ruchi-VB7R6.jpg', 'image', NULL, 1, '2020-11-15 17:15:23', 0),
('ruchi', 'vRVcZ', 'Sakshi', 'Happy birthday to u...many happy returns of the day Ruchi..God bless u and keep smiling always', '', '', NULL, 1, '2020-11-14 06:19:37', 0),
('ruchi', 'yCTV8', 'Dilip', 'Happy Birthday Mrs. Pradhan ...Wishing you a day full of laughter and happiness and a year that brings you much success and to wish you all the love and happiness in the world, all of which you deserve... bahut bhala kahi deli ðŸ¤¦... Aau formality maintain kari habani ...Cute Aunty ji ...#AGM', 'data/user_wish_data/ruchi-yCTV8.jpg', 'image', NULL, 1, '2020-11-15 09:20:42', 0),
('ruchi', 'YJpqe', '', 'Happy Birthday ðŸŽ‰ðŸŽ‰ðŸŽ‚ðŸŽ‚ðŸ’ðŸ’', 'data/user_wish_data/ruchi-YJpqe.mp3', 'audio', NULL, 1, '2020-11-14 10:03:19', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bd_event`
--
ALTER TABLE `bd_event`
  ADD PRIMARY KEY (`bd_id`);

--
-- Indexes for table `bd_static_parameters`
--
ALTER TABLE `bd_static_parameters`
  ADD PRIMARY KEY (`event_id`,`year`);

--
-- Indexes for table `bd_wish`
--
ALTER TABLE `bd_wish`
  ADD PRIMARY KEY (`event_id`,`wish_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bd_static_parameters`
--
ALTER TABLE `bd_static_parameters`
  ADD CONSTRAINT `static_param_match` FOREIGN KEY (`event_id`) REFERENCES `bd_event` (`bd_id`);

--
-- Constraints for table `bd_wish`
--
ALTER TABLE `bd_wish`
  ADD CONSTRAINT `event_id_match` FOREIGN KEY (`event_id`) REFERENCES `bd_event` (`bd_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
