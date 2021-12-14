# Movie_Recommender

How to run the app:

1. first using rsconnect to connect to Shiny account (this is to deploy the app. ignore this if you just want to run the app in the local environment).

2. change working directory to the web folder - the folder you just unzipped. 

3. run the following code.

		library(shiny)

		source("server.R")
		source("ui.R")

		runApp()

You should be able to see the App running in your local environment.
