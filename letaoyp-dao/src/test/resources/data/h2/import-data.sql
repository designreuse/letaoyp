INSERT INTO `template`.`s_account`
(`id`,
`name`,
`login_name`,
`password`,
`salt`,
`active`,
`created`,
`modified`)
VALUES
(1,
'super admin',
'admin',
'691b14d79bf0fa2215f155235df5e670b64394cc',
'7efbd59d9741d34f',
1,
now(),
now());


INSERT INTO `template`.`s_role`
(`id`,
`name`,
`description`,
`active`,
`created`,
`modified`)
VALUES
(1,
'admin',
'super admin',
1,
now(),
now());

INSERT INTO `template`.`s_account_role`
(`id`,
`role`,
`account`,
`active`,
`created`,
`modified`)
VALUES
(1,
1,
1,
1,
now(),
now());

INSERT INTO `template`.`s_permission`
(`id`,
`name`,
`description`,
`active`,
`created`,
`modified`)
VALUES
(1,
'*',
'超级管理员权限',
1,
now(),
now());

INSERT INTO `template`.`s_role_permission`
(`id`,
`role`,
`permission`,
`active`,
`created`,
`modified`)
VALUES
(1,
1,
1,
1,
now(),
now());



