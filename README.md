# _Hair Salon Application_

#### _A web application to save Stylists and Clients for a Hair Salon owner. Exercise to practice one to many database relationships though use of SQL, Ruby, Sinatra; week three of Epicodus Ruby, 12/9/2016_

#### By _**Tracie Weitzman**_

## Specifications

## Setup/Installation Requirements

_Works in any web browser. To run Hair Salon Application, in command line run:_

```
$ git clone https://github.com/weitzwoman/hair_salon_ruby
$ cd hair_salon_ruby
$ postgres
$ psql (optional, for editing the database directly)
$ bundle
$ ruby app.rb
```

_Add SQL Database: in PSQL, run:_


```
CREATE DATABASE salon;
\c salon;
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar, client_id int);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar);
```

<!-- CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon; -->
## Support and contact details

_Contact me on Github at [weitzwoman](https://github.com/weitzwoman)_

## Technologies Used

* _HTML_
* _CSS_
  * _Bootstrap_
* _Ruby_
  * _Sinatra_
* _SQL_

### License

Hair Salon App is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

Hair Salon App is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with the Hair Salon App. If not, see http://www.gnu.org/licenses/.

Copyright (c) 2016 **_Tracie Weitzman_**
