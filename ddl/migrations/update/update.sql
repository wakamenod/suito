ALTER TABLE `expense_category`
ADD UNIQUE INDEX `uid_name_UNIQUE` (`uid`, `name`);

ALTER TABLE `expense_location`
ADD UNIQUE INDEX `uid_name_UNIQUE` (`uid`, `name`);

ALTER TABLE `user`
ADD UNIQUE INDEX `uid` (`uid`);
