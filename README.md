ErrorHandler
============

ErrorHandler Senatra API tool

Need to install the following dependancies

rubygems
rubygems-dvp
bundler
libsqlite3-dev

install Gem in directory using gemfile by runnig bundle in the same directory

Add Record
curl -d "error[name]=HorribleError&error[text]=This problem is so bad i should make a ticket" http://localhost:4567/ErrorHandler
Query records
curl http://localhost:4567/ErrorHandler
Query record
curl http://localhost:4567/ErrorHandler/<id>
Update Record
curl -X PUT -d "error[name]=ReallyHorribleError" http://localhost:4567/ErrorHandler/1
Delete Record
curl -X DELETE http://localhost:4567/ErrorHandler/1
