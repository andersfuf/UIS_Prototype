# Spike cus-1-2-2022


Change login to listbased. The present login has authentication. This authentication should be changed to make authentication easier. To implement a degree of security in line with the durrent implementation a security feature for a user is to have granted acces to direct login or not. This would be similar to having fasual recognition enabled in an app.
```
ALTER TABLE customers
ADD COLUMN direct type VARCHAR(10) or boolean.
```
Pseudo SQL code..

Modalities could be: login, derect, fasual, fingerprint. This is not our solution, but if there were several modalities, like fasual or fingerprint authentication, other modalities like github, dropbox or facebook login could also a concern to support. A number of authentication mechanisms could be relevant. In this case a seperate entity 'login-modalities' with a one-many relationship to customers could an alternative. 

The agile solution is to only change what is neecesary. So discard the generic solution and create a dedicated field:
```
direct BOOLEAN DEFAULT TRUE -- or default FALSE
```
depending on you want new customers to apear on the list or not.
```
  loop
    if rec.direct
	  add to list
	end if
  end loop that created list
``` 
Pseudo SQL code..

If default is set to FALSE, then the students will wonder why their new customer does not apear on the easy login and issue an UPDATE statement to make it happen. For now i go for default FALSE. An alternative to the datatype BOOLEAN is VARCHAR() or 'character varying'.  Then the access right can take on more values that TRUE, FALSE or NULL.

Login form. The current login form (L) and a listed login form (LL). Imagine a picture with two forms one marke (L) and another marked (LL). Alternative 1(story A): LL is to replace L everywhere; or alternative 2 (Story B): LL is available through a link. Story B is the easier as existing functionality is maintained. The global variables roles and mysession must be maintained as well as the authetication mechanism that evaluates `if current_user.is_authenticated:`  to true.

Table with trueth values for a boolan. Row 1 TRUE, FALSE, NULL. Then dieerent other values for true (true, 't', 'true', 'y', 'yes', 1) and other values for false (false, 'f', 'false', 'n', 'no', '0') in postgresql. So there are a range of ways to check a BOOLEAN.

This means that models.py and medels_e.py could have a SQL like this:

```
		SELECT username
		FROM users
		WHERE direct = 'yes'
		
		or 
		WHERE direct 
		
		or 
		
		WHERE direct IS TRUE
				
``` 
Pseudo SQL code..

To add a field to a table, an ALTER-TABLE-ADD-COLUMN statement could be issued to an existing database. In this case an install script would also need a remove statement if changes need to be rolled back.

```
  -- To add field
  ALTER TABLE test24004
  ADD COLUMN direct BOOLEAN DEFAUL FALSE
  ;
  COMMIT; -- If needed

  ..
  
  -- To remove field
  ALTER TABLE test24004
  DROP COLUMN direct
  ;
  COMMIT; -- If needed
  
  
```
Pseudo SQL code..

To explain the global variables the endpoint /login sets `mysession["role"]` to passed role. This could probably be simplified, but did the job:
```
            print("role:" + user.role)
            if user.role == 'employee':
                mysession["role"] = roles[1] #employee
            elif user.role == 'customer':
                mysession["role"] = roles[2] #customer
            else:
                mysession["role"] = roles[0] #ingen
```


# Notes
I think cus-1-2-2022 should be split in a database part and a python part cus-1-3-2024

Comment github: Make a branch to develop or continue on main branch. 
I Decide to work on main brainch as i am old school and not adopted
to branching.
