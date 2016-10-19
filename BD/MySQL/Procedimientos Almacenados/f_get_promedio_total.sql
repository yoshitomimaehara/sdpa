drop function if exists getTotalcreditos;

delimiter $
create function getTotalcreditos() returns int
begin
	declare suma int;
	declare total int;
	declare _credito int;
	declare i int;
	declare c1 cursor for select creditos from curso;

	set suma = 0;
	set i = 1;
	set total = 0;

	select count(*) into total from curso;
    
    open c1;
		while i <= total do
			fetch c1 into _credito;
            set suma = suma + _credito;
            set i = i + 1;
        end while;
    close c1;
    
    return suma;
end
$