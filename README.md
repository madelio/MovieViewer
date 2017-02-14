# Project 1 - MovieViewer

**MovieViewer** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **9** hours spent in total

## User Stories

The following **required** functionality is complete:

- [x] User can view a list of movies currently playing in theaters from The Movie Database.
- [x] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [x] User sees a loading state while waiting for the movies API.
- [x] User can pull to refresh the movie list.

The following **optional** features are implemented:

- [ ] User sees an error message when there's a networking error.
- [ ] Movies are displayed using a CollectionView instead of a TableView.
- [ ] User can search for a movie.
- [ ] All images fade in as they are loading.
- [ ] Customize the UI.

The following **additional** features are implemented:

- [x] List anything else that you can get done to improve the app functionality!

* Just added a navigation controller in order to place the label on top of the Movie viewer

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How they were able to implement the collection view, it's one of the optional
   features that I actually really wanted to get around to but didn't have the
   time to do this week.
2. Some cool, creative UI ideas that other people implemented.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://gifyu.com/images/movieviewer.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Working with the API's was a first for me, so trying to understand the
components was a bit of a challenge.

## License

Copyright [2017] [Jie-Anne Asistio]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

# Project 2 - *MovieViewer*

**MovieViewer* is a movies app displaying box office and top rental DVDs using [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **8** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User can view movie details by tapping on a cell.
- [x] User can select from a tab bar for either **Now Playing** or **Top Rated** movies.
- [x] Customize the selection effect of the cell.

The following **optional** features are implemented:

- [x] For the large poster, load the low resolution image first and then switch to the high resolution image when complete.
- [x] Customize the navigation bar.

The following **additional** features are implemented:

- [x] List anything else that you can get done to improve the app functionality!
* Added the deselection animation on static cells
* Customized the bar controller UI to match the navigation controller

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How to add the ability to buy movie tickets, like the example shown in class
2. See how people came up with their UI, it was hard for me to think about creative ways to change the UI so I'm curious as to what other people came up with

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://gifyu.com/images/movieviewer3.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Just resolving some of the bugs I encountered and trying to understand what the code meant. The code from moving from low res to high res was particularly a little hairy to understand.

## License

Copyright [2017] [Jie-Anne Asistio]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
