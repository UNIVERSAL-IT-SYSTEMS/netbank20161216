# Activate and Login iOS Application

## Brief

A simple application that contains screens for activation and login process. The user can enter his/her personal data during activation and later he/she can login using this information.

## Screens

### Activation

`Activation` screen is shown when the user starts the application and the application is not activated yet, it is in `Public` state.

Consist of
* A backgound image
* `Activation` button

When the user clicks on `Activation` button the application navigates to `Activation Form` screen.

### Activation Form

`Activation Form` screen is shown when the user clicks on `Activation` button of `Activation` screen.

Consist of
* A backgound image
* Input fields for user info
  * User name
  * Full name
  * E-mail address
  * Password
  * Password again
* Activate button

When the user clicks on `Activate` button the application runs the following validations:
* Are all the fields filled? If not, show an error message in a pop-up. E.g.: Please fill all fields!
* Content of `Password` and `Password again` fields must match. If not, show an error message in a pop-up. E.g.: Passwords must match!

If validation is OK, activate the application. Store user data in `CoreData`. Set state of application to `Activated`. Navigate to `Login` screen.

Note: Store password with SHA-2 encryption.

### Login

`Login` screen is shown when the user starts the application and the application is activated, it is in `Activated` state.

Consists of
* A backgound image
* Input fields
  * User name
  * Password
* Login button

When the user clicks on `Login` button the application checks whether the given password matches with stored password or not. If not, show an error message in a pop-up. E.g.: Invalid user name or password! If password and user name are OK, navigate to `Home` screen.

### Home

`Home` screen is shown after the user logged in.

Consists of
* A backgound image
* Welcome message

Shows a `Welcome message` message with user's full name. E.g.: Welcome back {fullName}!
