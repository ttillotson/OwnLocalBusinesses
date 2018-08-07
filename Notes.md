Authentication Layer for API

Ensure for every endpoint 

HTTP Response COde for Success or failure 


Authentication


User Auth
- Users Model 
    - 6 methods:
    - sign-in, sign-out, password_digest, password assignment, reset token, ensure_token 
- Session Controller
- Application Controller: helper methods
    - require_sign_in



User Model: Store Retrieve Users/Reset Token
retrieve user 
set password on creation 
validate password against digest 
reset token 

Session Controller: REST Routes - Edit Routes File 
- create/destroy

Application Controller: helper functions for auth 

current_user 
sign_in 
sign_out 
require_sign_in

basic http auth 