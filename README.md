# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 2.6.2
* Rails version - 6

* Database creation and migrations

* How to run the test suite

This app is build to park and unpark two_wheeler or four wheeler vehicles.
We have a STI created for vehicle having sub classes as ThreeWheeler and FourWheeler.
A vehicle can be parked from 4 entry gates as 1, 2, 3 and 4
A vehicle can similarly unpark the vehicle for 4 exit gates 1, 2 , 3 and 4
Each gate has a two wheeler and four wheeler parking
Once the vehicle is parked, only available vacant slots will be visible to park any vehicle
All vehicle details like its color and registeration number is saved by the database and then a vacant slot is alloted near to its gate entry
Once vehicle is ready to go, the database mark the alloted spot as unparked and vacate the slpot for database and further parking.

