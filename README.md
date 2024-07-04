# biodiversity
Shiny Application for gbif.org data.

The (hopefully) working app can be viewed here https://vistalore.com/biodiversity/.

The current iteration of the app loads a subset of the gbif.org data stored locally on the server. 
given that the full dataset is large (almost 20GB), future versions will benefit from having an API integrated to call data bring data into memory only when it's needed which will improve initial app loading efficiency. 

Currently, the sidebar module is rendered server side unnecessarily, which is less efficient; this is in preparation for adding region and date range filters which will limit the animal names shown in the search bar accordingly. 

Modules from top left to bottom right, as shown visually in the app. 

sidebar.R contains all the UI related features of the sidebar including the search bar. The server aspects are implemented at the bottom of server.R. Both scientific and vernacular names are stacked within a single search bar.

map.R and table.R contain all of the map and table related features (i.e. both UI and server), respectively. The data that flows into each is filtered by the search bar input, the logic of which exists in server.R, subsequently each module is called.

Between all of that data transformation logic in server.R sits a chunk of code dedicated to alerting the user if no data is currently selected. 










