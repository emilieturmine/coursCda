CREATE USER 'util1' @'%' IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON Papyrus.* TO util1 @'%';

CREATE USER 'util2' @'%' IDENTIFIED BY '5678';

GRANT
select
    ON Papyrus.* TO util2;

CREATE USER 'util3' @'%' IDENTIFIED BY '9101';

GRANT
select
    ON Papyrus.fournis TO util3;