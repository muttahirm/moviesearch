# movie-search

The project consists of the clean architecture which interacts with the layers as follows:

Movie Search
UI -> BLoC -> Usecase -> Repository -> Remote DataSource
Movie Details
UI <- BLoC <- Usecase <- Repository <- Remote DataSource

On typing of each letter in the search field the new list of movie is generated dynamically