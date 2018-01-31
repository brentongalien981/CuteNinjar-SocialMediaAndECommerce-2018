-- I just added the file ".gitignore".
--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `hashed_password` varchar(255) NOT NULL,
  `user_type_id` int(2) NOT NULL DEFAULT '1',
  `signup_token` varchar(255) DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `account_status_id` int(2) NOT NULL DEFAULT '1'
);





--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `user_type_id` (`user_type_id`),
  ADD KEY `account_status_id` (`account_status_id`);








--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;










/* UserTypes */
--
-- Table structure for table `UserTypes`
--

CREATE TABLE `UserTypes` (
  `id` int(2) NOT NULL,
  `type_name` varchar(100) NOT NULL
);







--
-- Indexes for table `UserTypes`
--
ALTER TABLE `UserTypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type_name` (`type_name`),
  ADD KEY `id` (`id`);





--
-- AUTO_INCREMENT for table `UserTypes`
--
ALTER TABLE `UserTypes`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;






/* AccountStatus */

--
-- Table structure for table `AccountStatus`
--

CREATE TABLE `AccountStatus` (
  `id` int(2) NOT NULL,
  `name` varchar(200) NOT NULL
);






--
-- Indexes for table `AccountStatus`
--
ALTER TABLE `AccountStatus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);





--
-- AUTO_INCREMENT for table `AccountStatus`
--
ALTER TABLE `AccountStatus`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;









/* Profile */
--
-- Table structure for table `Profile`
--

CREATE TABLE `Profile` (
  `user_id` int(11) NOT NULL,
  `description` varchar(3000) DEFAULT NULL,
  `pic_url` varchar(1000) DEFAULT '0'
);

--
-- Indexes for table `Profile`
--
ALTER TABLE `Profile`
  ADD UNIQUE KEY `user_id_2` (`user_id`),
  ADD KEY `user_id` (`user_id`);













/* FK CONSTRAINTS */

  --
-- Constraints for table `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_type_id`) REFERENCES `UserTypes` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`account_status_id`) REFERENCES `AccountStatus` (`id`);


--
-- Constraints for table `Profile`
--
ALTER TABLE `Profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);























/* DATA */

--
-- Dumping data for table `UserTypes`
--

INSERT INTO `UserTypes` (`id`, `type_name`) VALUES
(4, 'accountant'),
(2, 'admin'),
(5, 'legal'),
(3, 'owner'),
(1, 'user');





--
-- Dumping data for table `AccountStatus`
--

INSERT INTO `AccountStatus` (`id`, `name`) VALUES
(1, 'active'),
(2, 'blocked'),
(3, 'under investigation'),
(4, 'tracked'),
(5, 'inactive');



--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user_id`, `user_name`, `email`, `hashed_password`, `user_type_id`, `signup_token`, `private`, `account_status_id`) VALUES
(8, 'bren', '', '$2y$10$NUvesdcKf749dWYzg2Ll/Ok88DKAOoJF2gU5eUo3DHMgg55/CfBaW', 1, NULL, 0, 1),
(9, 'c', '', '$2y$10$K5SpUutbvfrIw2gmi5pDh.SjhfCIah2n.kgmK8W285vwwB/KL0q9.', 1, NULL, 1, 1),
(10, 'ye', '', '$2y$10$YJ4PuMoBFbjECsCouWi1/OXSM4E9adnyT47LcaXvgEvWOG0yO0VXS', 1, NULL, 1, 1),
(11, 'apesapes123', '', '$2y$10$aOgIUHN8sb30x7uKA14QMe5QPoqmnmjeKljmCTITY5.HedkxGYsW6', 1, NULL, 1, 1),
(12, 'kobekobe123', '', '$2y$10$sKJjEP.JlR3zUjs8VxwhiOlCGtiOyGV7S0LKs/WGl3psTHxpwSRkW', 1, NULL, 0, 1),
(13, 'johnjohn123', '', '$2y$10$6ieChkTpeDxadg03ebcrJeOtQaegjldDqYTGTjLGkbPX3xsUyp8Oi', 1, NULL, 1, 1),
(14, 'UserForOneTimeAddresses123', '', '$2y$10$R8nKvfFjh4oj5wMfqoMreePXh1VrgyZvxFMeeUG2ZJ2RgpgwIMD3a', 1, NULL, 1, 1),
(15, 'leilei123', '', '$2y$10$JcHTcbO94oJbaKdIkAf9J.5U9qXmh4lD/2fa7.Or9CXXqMNYWk.fu', 1, NULL, 1, 1),
(34, 'brenbren123', 'brenbren123@random.com', '$2y$10$cBKKHyrTd5oW28BNd/QMEu30Ua0WuEMQ0cOX6kxzFNrdZtUOTWBKC', 1, '', 1, 1),
(38, 'odoxodox123', 'o@a.com', '$2y$10$QxRDNI72URr1uTk5whz1zOpaZB3jaX2TqAA7X2YWnZHA9RkrUPYma', 1, '39c66d966324929b8f7d75bb42b86bee', 1, 1),
(58, 'opsops123', 'odox700@gmail.com', '$2y$10$0ljQR1FSbmKYDAy6TOHg2OHM.obn6KPfRvGWDEGaySNOs74Gd76nu', 1, 'ac2bb09384be96f7b49aafadca3e55a8', 1, 1),
(59, 'potpot123', 'potpot123@a.com', '$2y$10$YDRY10oedKFhr2YdVyU6sOhnUhQ1s7jXp7U/IMgjSpkAYS3BfpIm6', 5, '', 0, 1),
(60, 'bonbon123', '', '$2y$10$LpgNrdmMI5W7tMsF0YUnZ.Ch0p.6QtbONwBc31uaZWfkCVmBo.lQe', 1, '', 1, 4),
(61, 'boyboy123', '', '$2y$10$fgwrQDRKrYpVuY4W1c11oOPEI5pEuhO/PlV0x0fL0t4gdJvewORkC', 1, '', 1, 1),
(62, 'hoyhoy123', '', '$2y$10$Pb1BGnhRxM5JxchYYiNb9uQqmaIrG7zMyBoY3ymTl.GuKykazvzVW', 1, '', 1, 1),
(63, 'noynoy123', '', '$2y$10$YJsTySTsLPkJuINz.JCOc.tENTV7uQxSh3EsUoVi.9cu.Fays2jxG', 1, '', 1, 2),
(66, 'soysoy123', '', '$2y$10$z/h6oJdJX6ngGvWh5U4sEec.rCd1TroXTespCVg0ldgaEN3bp1R.m', 1, '', 1, 1),
(67, 'zoyzoy123', '', '$2y$10$H4xNl7LUcNGw54HI7iBVIubMFzB.855ICmqmEv99HTEvP5kqGqlFq', 1, '', 0, 1),
(68, 'heyhey123', '', '$2y$10$VT4cIXVZ.364Mf8OkW4v3.fbmHva53nXsqOeItXvSQk5yFRLJqvTG', 1, '', 0, 1),
(69, 'zeyzey123', '', '$2y$10$PXG5hc3jM/x1AglEANm87.QwaR0vIsj46HOxTRXWK91yzlYqCKXka', 1, '', 1, 1),
(70, 'meymey123', '', '$2y$10$V5vbhJ8BQJJMQoWVYhrR5uP5/591RlquxTdVkG.VtInS6SrAO/jNq', 1, '', 0, 1),
(71, 'xeyxey123', '', '$2y$10$Ro.kWMSIX/Sx9hBXDRg3duq19PFzmyZp8TlXL/DTifrlZxZMFJQfS', 4, '', 1, 1),
(72, 'yeyyey123', '', '$2y$10$kOhksvxAluuX6zlj8YjYk.LCvDdAxOGMReECeZwGGFgkKFWN1CEW.', 5, '', 0, 3),
(73, 'aayaay123', '', '$2y$10$pJJVLCHvnC2BxAwNFpHy2OQdiRb3t7CI8y18loRKw3g5PNCUKpuCy', 4, '', 0, 4),
(74, 'baybay123', '', '$2y$10$wxlwrOhKXBzkTUgRhZ43kuPFG0oo2k7Q3ik.S1d3.RtRPsn7Gswoq', 1, '', 1, 1),
(75, 'caycay123', '', '$2y$10$Y5Njb9BI2rDtU7uheR47.evdKZMp8FJCPPnPKS80digzks4r7sb/m', 1, '', 1, 1),
(76, 'dayday123', '', '$2y$10$K.hp7J6FH1uJvP1qLP4Rh.RtI8U3iXYvqe2NtyIpCmhOfW6UMSlhq', 4, '', 0, 2),
(77, 'eayeay123', '', '$2y$10$4w.kgQP2AtCAeqOXCxeiQup.xmrrk.su0JOrHaxyxOWMEGw6yLS3q', 1, '', 1, 1),
(78, 'fayfay123', 'fayfay123@a.com', '$2y$10$TnZwC/lFdln3M3YpzfkrwOn3EFu5eB3W8tLop86BH17kNbI4KH2yW', 1, '', 1, 1),
(79, 'gaygay123', '', '$2y$10$Hnlo/0eVYXDsDTjA1qYZHeEfF3Syy7TlgDb9LBoOB5kYy94vETVuy', 1, '', 1, 1),
(80, 'hayhay123', '', '$2y$10$psOoHpIcJaETYNcpgTS8AO.j69vrF0jNfp6X20SFiX4utK4fMiZ/C', 1, '', 1, 1),
(82, 'duranto1', 'duranto@gmail.com', '$2y$10$uG5iFggoGPTKKwcb6KVBNOUNZ0V0N4s7o5PFsnFjj7ilRbKqIp09.', 1, NULL, 1, 1),
(83, 'duranti1', 'duranti1@gmail.com', '$2y$10$7I.VfUhfkxsCkCDjzDJRCeM1Mx4KEscTNZH6yPZ5EbxFfQn9sWrUe', 1, '', 1, 1),
(85, 'duranta1', 'duranta1@gmail.com', '$2y$10$x1sdlcHbfoKT3I5T.YrtpO0pfyJwjY8TO/4KEUUVYGv71a5vHBVXK', 1, '', 0, 1),
(86, 'durante1', 'durante1@shit.co', '$2y$10$O4.GZJVr4BBYghS/7gbAtu2In4DNAS11EF/XerP./vd74gHlaKZLK', 1, '', 1, 1),
(87, 'durantu1', 'b1@gmail.com', '$2y$10$kadloJZCs2IeGC0tOsuGaeGh2nUKxhzbHLEAn8gKoaJqdJ.RzTkL2', 1, '', 1, 1),
(89, 'kobakoba1', 'kobakoba1@gmail.com', '$2y$10$YHZg7Zf8E9YvQY5t0bh41ONtDgbzZEUfMMz8TwERIaVMXAPynx.fC', 1, '', 1, 1),
(91, 'kobekobe1', 'kobekobe1@gmail.com', '$2y$10$XimPxe4RNCGiYPRC2dEFcew4rZVp4vU04Yk2wFe8wMA.VOciOBv8e', 1, '', 1, 1),
(94, 'kobikobi1', 'kobikobi1@gmail.com', '$2y$10$lpr7mAw6CYXPEGT61ANJ3eJTdLFDubu3dSb3/gsfqL6hfBSXC2sge', 1, '', 1, 1),
(95, 'kobokobo1', 'kobokobo1@gmail.com', '$2y$10$2jmB8Z.dnQ9RIBZ/ea8X4edUrTrzOW7UMjSFi9UQ.d09p9YB1gBN.', 1, '', 1, 1),
(96, 'kobukobu1', 'brenallen1.1x10e11@gmail.com', '$2y$10$im18mReVoqTiaLJkWMXn6e9npx84QfisJdfx89rDN7g5VBHCH8IMa', 1, NULL, 1, 1);







--
-- Dumping data for table `Profile`
--

INSERT INTO `Profile` (`user_id`, `description`, `pic_url`) VALUES
(8, '\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra lectus aliquam mauris finibus porta. Quisque eget diam mauris. Duis hendrerit est nisi, quis imperdiet libero blandit quis. Vestibulum ac neque lorem. Duis eu vulputate tellus. Vivamus a tempus mi, eu dignissim lacus. Sed vehicula elementum mattis. Vivamus id justo scelerisque, faucibus erat non, iaculis dui. Nullam ultricies nulla vitae arcu consectetur, et placerat nisi hendrerit. Aliquam erat volutpat. Quisque eget blandit urna.\r\n<br><br>\r\nNam suscipit ut tellus nec fermentum. Aliquam et molestie tellus. Nullam euismod risus magna, quis elementum diam auctor a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec ut velit lacus. Curabitur non neque sit amet ligula ultricies ullamcorper. Duis gravida massa et diam sollicitudin, sed rhoncus quam cursus. Aenean vitae vehicula sem, et convallis quam. Integer faucibus lacus et gravida ullamcorper. In porta, sem ac elementum lobortis, felis quam feugiat est, et aliquam lorem ex bibendum enim. Etiam pharetra mauris a vulputate laoreet. Morbi a neque non nulla semper finibus. Suspendisse posuere, velit nec suscipit elementum, enim dolor suscipit augue, at consequat lorem tortor quis erat. Praesent gravida odio vel venenatis vulputate. Ut efficitur, mi et rutrum interdum, diam neque consequat dolor, et congue lorem justo ac sem. Duis ligula purus, condimentum interdum posuere nec, sagittis vel dolor.\r\n<br><br>\r\nNam rutrum lectus et metus mollis euismod. Proin semper elementum nunc. Vestibulum vel ex dui. Aliquam eget lectus ante. Quisque varius ultrices arcu, eu blandit eros viverra nec. Nam tempor mauris sed velit placerat aliquet. Aliquam vitae arcu ac massa aliquet ullamcorper. Nulla semper sagittis turpis, in efficitur est porta ut. Praesent felis nibh, aliquet at placerat vestibulum, fermentum sed neque. Sed massa mauris, finibus a venenatis quis, dapibus a sapien. Sed sed suscipit lacus.\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec gravida dapibus sollicitudin. Vestibulum velit ipsum, cursus eget tellus id, aliquet posuere sem. Nulla molestie leo nec sapien tristique, vel suscipit diam congue. Nulla dignissim dapibus metus, ac interdum elit cursus porta. Maecenas ligula augue, tincidunt et lacus nec, tincidunt bibendum sapien. Curabitur laoreet eget urna ut cursus. Integer sit amet ligula porta, porttitor lacus sed, rhoncus leo. Proin malesuada, nibh sollicitudin auctor dignissim, mauris quam ultrices elit, in fermentum libero augue sed felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent suscipit augue a dui finibus condimentum. Nunc viverra mi quis elementum lobortis. Nunc iaculis faucibus risus, sed imperdiet justo. Cras eu venenatis velit.\r\n', 'https://farm5.staticflickr.com/4365/36521302700_b4b4b9f984_o.jpg'),
(9, '\r\nKaede Rukawa (?? ?? Rukawa Kaede) is the small forward of the Shohoku team, and Hanamichi Sakuragi\'s rival. He is the polar opposite to Sakuragi — attractive to girls, skilled at basketball, and very cold and aloof, although he does share some traits with Sakuragi in that they are not academically inclined and are good fighters. Although he regards Sakuragi as an idiot and the two frequently get into conflicts, he seems to realize that Sakuragi can put his talents to better use. Takenori Akagi\'s younger sister, Haruko, has a crush on him,[ch. 2] though she does not confess it and he himself is completely unaware of her feelings. Rukawa\'s chief hobby outside basketball is sleeping, and he is usually seen asleep whenever he\'s not on the court because he spends his nights practicing further. Due to this, he is prone to falling asleep even while riding his bicycle. He has also been in his fair share of off-court fights, but can hold his own. Rukawa\'s goal is to be the best high school player in Japan, and he considers Sendoh of Ryonan to be his greatest rival. He is often referred to as the \"super-rookie\" and the \"ace of Shohoku\".\r\n<br>\r\nKaede Rukawa (?? ?? Rukawa Kaede) is the small forward of the Shohoku team, and Hanamichi Sakuragi\'s rival. He is the polar opposite to Sakuragi — attractive to girls, skilled at basketball, and very cold and aloof, although he does share some traits with Sakuragi in that they are not academically inclined and are good fighters. Although he regards Sakuragi as an idiot and the two frequently get into conflicts, he seems to realize that Sakuragi can put his talents to better use. Takenori Akagi\'s younger sister, Haruko, has a crush on him,[ch. 2] though she does not confess it and he himself is completely unaware of her feelings. Rukawa\'s chief hobby outside basketball is sleeping, and he is usually seen asleep whenever he\'s not on the court because he spends his nights practicing further. Due to this, he is prone to falling asleep even while riding his bicycle. He has also been in his fair share of off-court fights, but can hold his own. Rukawa\'s goal is to be the best high school player in Japan, and he considers Sendoh of Ryonan to be his greatest rival. He is often referred to as the \"super-rookie\" and the \"ace of Shohoku\".\r\n', 'https://farm5.staticflickr.com/4423/36099515574_5b59786231_q.jpg'),
(10, NULL, '0'),
(13, NULL, '0'),
(58, NULL, '0'),
(70, NULL, '0'),
(71, NULL, '0'),
(72, NULL, '0'),
(73, NULL, '0'),
(74, NULL, '0'),
(75, NULL, '0'),
(76, NULL, '0'),
(77, NULL, '0'),
(78, NULL, '0'),
(79, NULL, '0'),
(80, NULL, '0'),
(83, NULL, '0'),
(85, NULL, '0'),
(87, NULL, '0'),
(89, NULL, '0'),
(91, NULL, '0'),
(94, NULL, '0'),
(95, NULL, '0'),
(96, NULL, '0');