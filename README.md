# Pokedex for ZipDev

This is a Flutter project that will work as a Code Assesment for Zipdev's recruitment process.
This README will serve as code documentation and will explain some architectural and design desitions.

### General workflow
This application was inspired on the GameBoy game Pokemon Silver and Gold Second generation. Thus the pixeled art design of its components.
The application is design to work as just as the Pokemon game works regarding the Pokedex. 
Initially the Pokemons the user haven't seen will appear in a "Hidden" state. Once the user encounter each Pokemon using the Battle simulation system, it will show its information and change to the "Seen" state. 
There is also another state that defines whether the user have caught certain Pokemon or not.
The user can override all Pokemon's state on the Settings tab to "All seen", "All seen and Caught" or "Restart from Scratch".

### Architecture

I followed a Model-View-Presenter-Controller Arquitechture. In order to have well separated responsabilities between layers and its components. 
* Model: Contains all information about the base entities of the app like: Pokemon and PokedexEntry.
* View: Contains all visual components or Widgets.
* Controller: Contains all the business logic.
* Presenter: Orquestrates the views and handles them using the information provided by the controllers.

### State management

The state management of this application was handled using Providers and GetIt.
Proviers are used when certain views has to react to the changes on the state and Re-render using ChangeNotifiers.
GetIt are used for global variables that might not require a context in order to be handled and the views doesn't need to react dynamically to its information, like the Logged User.

### Authentication logic
I used Firebase and Google Sign in to provide the authentication services.
The are handled mainly using the class AuthenticationController. This class defines the workflow of what to do after a Login intent is made and it is generalized in a way that it accepts multiple Firebase Authentication Controllers such as Apple,Facebook and Email Sign.

### API consumption Logic
The data persistance is Managed using the following structure:
* HTTPClient: A custom implementation using the Dio library, it encapsulates the Pokemon Api information and the way our Application handles the requests. 
* Dao: Should have one Dao per entity per specific storage platform, it defines the way each platform is implemented in order to have the same entity.
* Repository: Outter part of the Data Layer, it works as a definition of what dao (Data source Implementation) will the controllers use. This would help the change impact of data sources very little. (Just develop the new Dao).

It's important to mention that the API used [PokeApi](https://pokeapi.co) has some incongruencies and works in some inconvinient way that makes the App have some issues.

For example: When you get the list of Pokemon, you only get its name and Pokemon detail Url. This means there is a need to make another Api call for each pokemon in order to get the full detailed informarion (Pictures, tpyes, etc) and another extra call to get its flavor text.
This causes a little delay and long loading screens even tought it was handled in a paralellized manner.


### Misc classes

* App Response: Error response enveloping technique wich is very usefull to react to certain errors and be responsive to them in a controlled way.
* Theme: Flutter's design style sheet. Completely integrated and used across the whole application, this means that style changes are easy to implement and maintain.

### External Libraries

  * provider: ^4.3.2+2: For state management.
  * get_it: ^5.0.0: For non view responsive state management.
  * firebase_core: ^0.5.0: Firebase integration.
  * firebase_auth: ^0.18.0+1: Firebase Authentication Integration.
  * google_sign_in: ^4.5.4: Google Sign In integration.
  * dio: ^3.0.10: Http client.
  * font_awesome_flutter: ^8.8.1: For some Icons.
  * animated_text_kit: ^2.2.0: For Authentication home Oak's dialog.
  * pixel_border: ^1.0.0: For pixeled - retro styled borders.
  * cached_network_image: ^2.2.0+1: For catched and faster images loading times.

### Installation

The application APK is being delivered, but if need to run the project locally you will have to sign the application on build with the provided SHA-1 certificate fingerprint in order to be able to login using Firebase integration.

