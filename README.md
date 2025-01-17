# A simple listing and detail showcase application using APIs

## Screenshots of the app are:

### Homescreen with list of posts 
![qemu-system-x86_64_8PYGkYAMER](https://github.com/user-attachments/assets/af3384ae-0ecc-4cfb-9d99-3d0f7271c0b7)
![qemu-system-x86_64_gIpirMbxwQ](https://github.com/user-attachments/assets/3d667a3e-1f97-4061-b9d1-15a82a22e05f)

### After clicking on the post it will show the posts and the comments of that post below it. 

![qemu-system-x86_64_V50Ql1iZH7](https://github.com/user-attachments/assets/f3acb564-f4e8-4df8-bce8-8de79aa73e81)
![qemu-system-x86_64_Z1gjcOvj6O](https://github.com/user-attachments/assets/4501db28-5c41-4d40-b864-6eee5ec90adf)


Used the retrofit library for implementing the APIs. 
Used the naming conventions.
Used dio for caching

### Thank You
--- 
---





## These are the task given:

### What you need to do?

- If you haven’t already, take a [git class in codeschool](https://www.codeschool.com/courses/trygit).
- Once complete, create a private repo of any name of your choice in [github](https://github.com/)
- Solve the problem detailed below
- Push your code to the repo (make sure that you have multiple commits with proper messages)
- share the code with us . Share us the link to your repo or invite us to the repository.

### Problem

Implement a simple listing and detail showcase application using the following APIs:

#### Tasks

- A screen to list all the posts.
- https://jsonplaceholder.typicode.com/posts
- A post detail screen which have list of comments.
- https://jsonplaceholder.typicode.com/posts/{post_id}/comments
- Add new comment by using POST request to the api. You can use any static userId to make the
  request.
- https://jsonplaceholder.typicode.com/posts/{post_id}/comments
  Checkout [JSONPlaceholder](https://jsonplaceholder.typicode.com/) for more details and also use
  their [guide](https://jsonplaceholder.typicode.com/guide/).
  Once loaded, the data (both listing and detail) should persist. Any persistence mechanism can be
  used, i.e., cache or database.

#### NOTE

- You can build application using native android or Flutter.
- Design is important, but can be designed as you wish.

### Android

#### Criteria for judgement

- Object Oriented approach used in project.
- Proper use of naming conventions for XML, files and functions.
- Proper use of ViewGroup(s) and View(s).
- Proper use of Android API(s).
- Project structure.

#### Bonus points

- use kotlin
- Use of 3rd party libraries like [Retrofit](http://square.github.io/retrofit/) or any ORM libraries
  would be a big plus.
- If you can demonstrate the correct use of relevant 'Material Design' components in your
  application.
- If you write a readme file which contains screenshots and a short description of your application.

### Flutter

#### Criteria for judgement

- Object Oriented approach used in project.
- Proper use of naming conventions for Widgets, files, function.
- Proper code and widget separation and use of widgets.

#### Bonus points\* Proper state management

- Use of proper animations.
- If you write a readme file which contains screenshots and a short description of your application.
- Use of 3rd party libraries meaningfully.

#### Extra features

These are optional features. Implementing them will give you extra points.

- Show list of users
-
- https://jsonplaceholder.typicode.com/users
- Show the users posts, albums and photos.
- Posts: https://jsonplaceholder.typicode.com/users/{user_id}/posts
- Todos: https://jsonplaceholder.typicode.com/users/{user_id}/todos
- Albums: https://jsonplaceholder.typicode.com/users/{user_id}/albums
- Photos: https://jsonplaceholder.typicode.com/albums/{album_id}/photos
- The posts, albums and todos should be either in Tabs or BottomNavigation.
- Implement add, delete, update of todos for user.
- https://jsonplaceholder.typicode.com/guide.html

For code generation:
flutter packages pub run build_runner build
