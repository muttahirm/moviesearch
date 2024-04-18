# movie-search



The Movie Search App is created in Flutter Framework that provides the users with access to search movies by name.

The app consists of the clean architecture, ensuring maintainability, scalability, and testability through Test-Driven Development and Bloc Pattern, which interacts with the layers as follows:

Movie Search
UI -> BLoC -> Usecase -> Repository -> Remote DataSource
Movie Details
UI <- BLoC <- Usecase <- Repository <- Remote DataSource

On typing of each letter in the search field the new list of movie is generated dynamically

The selecting a search movie, the user navigates to a new screen where s/he can check the details of a selected movie
