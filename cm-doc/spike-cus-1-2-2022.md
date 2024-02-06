# Spike cus-1-2-2022


Change login to listbased. The present login has authentication. This authentication should be changed to make authentication easier. To implement a degree of security in line with the durrent implementation a security feature for a user is to have granted acces to direct login or not. This would be similar to having fasual recognition enabled in an app.
```
ALTER TABLE customers
ADD COLUMN direct type VARCHAR(10) or boolean.
```
Pseudo SQL code..

Modalities could be: login, derect, fasual, fingerprint. This is not our solution, but if there were several modalities, like fasual or fingerprint authentication, other modalities like github, dropbox or facebook login could also a concern to support. A number of authentication mechanisms could be relevant. In this a seperate entity 'login-modalities' with a one-many relationship to customers could an alternative. 

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



# Notes
Comment github: Make a branch to develop or continue on main branch. 
I Decide to work on main brainch as i am old school and not adopted
to branching.
