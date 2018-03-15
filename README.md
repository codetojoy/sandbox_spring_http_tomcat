
### sandbox_spring_http_tomcat

Example of remoting with Spring HTTP (using standalone Tomcat).

### To Run

* edit `go.sh` to point to Tomcat directory
* `go.sh` will build 3 war files and the client
* run `./client/staging/bin/client`

### Commands

* `u` to use UserService
* `b` to use BillingService
* `c` to use CompoundService
* `q` to quit

### Notes

* `client` must be run _in situ_ because it uses `stdin`
